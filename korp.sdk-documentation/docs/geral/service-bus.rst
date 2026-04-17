ServiceBus
==========

ServiceBus é uma camada de abstração utilizada para comunicação orientada a mensagens.
Para saber mais https://microservices.io/patterns/communication-style/messaging.html.


Configurando o ambiente
-------------------------------------

* Certifique-se de que o RabbitMQ está rodando na sua máquina, acesse http://localhost:15672. Uma tela do RabbitMQ de login deve aparecer
* Certifique-se de que a connection string para o RabbitMQ esteja configurada no Consul. Acesse http://localhost:8500/ui/dc1/kv e navegue até a chave "Global", precisa existir a seguinte propriedade

.. code-block:: json

  "ServiceBus": {
    "Transport": {
      "Hostname": "amqp://guest:guest@host.docker.internal"
    }
  }

----

Inicializando o Broker
----------------------

A transmissão das mensagens pelo ServiceBus se dá por um Broker, que é o RabbitMQ.

* Na função main do arquivo main.go, adicionar uma chamada para ``MustUseRabbitMqAsBroker``. Esse método obriga um parâmetro do tipo ``ConsumeOptions``, e nele você especifica para quais chaves você que se inscrever na mensageria. Adicionar a chamada logo após a inicialização do ``FlushSentry``:

.. code-block:: go

    import (
        "bitbucket.org/viasoftkorp/korp.sdk/bus"
    )
    ...
    defer sentrySdk.FlushSentry()

    consumeOptions := bus.NewConsumeOptions("Korp.SDK.ApontamentoRealizado", "Korp.SDK.RMAAtualizado"))
    bus.MustUseRabbitMqAsBroker(consumeOptions)
    ...

----

Declarando mensagens
--------------------

* As mensagens podem ser de dois tipos, comandos e eventos. Eventos são ações que já aconteceram (ou seja o nome é sempre no passado), e comando são ações que devem ser feitas/processadas.
* Para declarar um evento, a sua struct deve implementar a interface ``bus.IMessage``
* Para declarar um comando, a sua struct deve implementar a interface ``bus.ICommand``

* **ATENÇÃO!!!** O nome (key) da sua mensagem deve conter o nome do seu serviço + nome da mensagem, segue exemplo:

.. code-block:: go

    // evento
    type ApontamentoRealizado struct {
        Odf string
        Usuario string
    }

    func (a *ApontamentoRealizado) Key() string {
        return "Viasoft.Picking.ApontamentoRealizado"
    }

    //comando

    type EmitirNotaFiscal struct {
        NumeroNota string        
    }

    func (a *EmitirNotaFiscal) Key() string {
        return "Viasoft.Faturamento.EmitirNotaFiscal"
    }

    func (a *EmitirNotaFiscal) Destination() string {
        return "Viasoft.Faturamento.EmissaoNotaFiscal"
    }

----

Publicando uma mensagem
-----------------------

Instancie um Service Bus, e utilize os métodos ``Send`` (para comandos) e ``Publish`` (para eventos).

.. code-block:: go

    package main

    import (
        "bitbucket.org/viasoftkorp/korp.sdk/bus"
        "bitbucket.org/viasoftkorp/korp.sdk/infrastructure"
        "github.com/google/uuid"
    )

    func main() {
        serviceBus := bus.NewServiceBus()
        apontamento, err := RealizarApontamento(serviceBus)
    }

    func RealizarApontamento(serviceBus bus.IServiceBus) (*ApontamentoRealizado, error) {
        apontamentoRealizado := &ApontamentoRealizado{
            Odf:     "5008",
            Usuario: "MASTER",
        }

        ambientData := &bus.ServiceBusAmbientDataHeaders{
            AmbientDataModel: &ambient_data.AmbientDataModel{EnvironmentId: "", TenantId: ""},
            Company:          uuid.MustParse(""),
            LegacyCompanyId:  0,
            UserId:           uuid.MustParse(""),
        }    

        err := serviceBus.Publish(ambientData, apontamentoRealizado)
        if err != nil {
            return nil, err
        }

        return apontamentoRealizado, nil     
    }

----

Consumindo uma mensagem
-----------------------

| Declare um método que deverá ser chamado após a inicialização do bus no ``main.go``. Esse método deverá inicializar um consumidor através da função ``Consume()``.

.. note::
    Para especificar a quais mensagens você quer consumir, verifique a documentação `Inicializando o Broker`_.

.. code-block:: go

    func InicializarConsumidorMensagens() {
        c, err := bus.Session.Consume()

        if err != nil {
            panic(err)
        }

        go consumirMensagens(c)
    }

    func consumirMensagens(c *bus.Consumer) {
        defer c.Done()

        for d := range c.Deliveries {
            routeMessage(d)
        }
    }

| O método abaixo será responsável por rotear as mensagens para a regra de negócio, visto que utilizamos somente uma fila para todas as mensagens.

.. warning::

    Em hipótese alguma coloque código de regra de negócio aqui, esse método tem somente como objetivo rotear as mensagens.

.. code-block:: go

    func routeMessage(d amqp.Delivery) {
        var err error = nil
        var key string
        defer guardMessageDeadLetter(d, &key, &err)

        key = bus.GetMessageKey(d.Headers)

        switch key {
        case "Korp.Producao.Apontamento.ApontamentoRealizado":
            var apontamento ApontamentoRealizado
            err = json.Unmarshal(d.Body, &apontamento)
            if err == nil {
                //método de negócio para processar a mensagem
            }

            break;
        default:
            err = fmt.Errorf("não intendi que mensagem é essa %s", key)
            break
        }
    }

| Por fim, o seguinte método tem como objetivo mover a mensagem para fila de erros caso algum problema aconteça

.. code-block:: go

    func guardMessageDeadLetter(d amqp.Delivery, key *string, err *error) {
        defer func() {
            if r := recover(); r != nil {
                utils.LogError("erro não esperado ao processar mensagem", r)
            }
        }()

        _ = d.Ack(false)

        var localErr error

        if r := recover(); r != nil {
            localErr = fmt.Errorf("%s", r)
        } else {
            localErr = *err
        }

        if localErr != nil {
            serviceBus := bus.NewServiceBus()
            localErr = serviceBus.DeadLetter(d.Headers, d.Body, localErr)
            if localErr != nil {
                utils.LogError("erro ao enviar a mensagem %s para deadletter", localErr, *key)
            }
        }
    }

Recuperando AmbientData de uma mensagem    
---------------------------------------

Para recuperar TenantId, EnvironmentId etc de uma mensagem utilize a função ``bus.GetServiceBusAmbientData()``.

É possível ignorar um AmbientData utilizando o parâmetro ``ambientDataToIgnore``.

    .. code-block:: go

        ambientData, err := bus.GetServiceBusAmbientData(d.Headers, bus.ServiceBusHeadersUserId, bus.ServiceBusHeadersCompany)
        if err != nil {
            return err
        }

Lista de AmbientData que é possível ignorar

* UserId - ``bus.ServiceBusHeadersUserId``
* CompanyId - ``bus.ServiceBusHeadersCompany``
* LegacyCompanyId - ``bus.ServiceBusHeadersLegacyCompanyId``

----

Testes unitários com Service Bus
--------------------------------

* Injete no seu serviço uma instância de InMemoryServiceBus

.. code-block:: go

    import (
        "bitbucket.org/viasoftkorp/korp.sdk/bus"
    )

    func TestGeracaoApontamento(t *testing.T) {
        serviceBus := bus.NewInMemoryServiceBus()
        ...    
    }

* Verifique pelas mensagens presentes na propriedade PublishedMessages do InMemoryServiceBus

.. code-block:: go

   import (
        "bitbucket.org/viasoftkorp/korp.sdk/bus"
    )

    func TestGeracaoApontamento(t *testing.T) {
        serviceBus := bus.NewInMemoryServiceBus()
        apontamentoService := services.NewApontamentoService(serviceBus)

        apontamentoRealizadoExpected := &services.ApontamentoRealizado{
            Odf:     "5008",
            Usuario: "MASTER",
        }

        apontamento, err := apontamentoService.Apontar()
        if err != nil {
            assert.Nil(t, err)
        }

        msgsApontamento, _ := serviceBus.PublishedMessages["Viasoft.Picking.ApontamentoRealizado"]

        assert.Len(t, msgsApontamento, 1)
        assert.Equal(t, msgsApontamento[0].Message, apontamentoRealizadoExpected)
        assert.Equal(t, msgsApontamento[0].Message, apontamento)
    }