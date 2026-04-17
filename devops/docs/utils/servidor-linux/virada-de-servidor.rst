Virada de servidor
==================

Responsabilidades do cliente
----------------------------

Pré requisitos para migração
############################

Cliente deve ter feito os seguintes:


    - Alterar config.json em todas as estações

    - Importar certificado em todas as maquinas

    - Configurar os DNSs

    - Homologado a versão


Ações feitas pelo cliente durante a migração
############################################

    - Atualização da base para a devida versão


Ações feitas pelo cliente após a migração
#########################################

    - Correção de redirecionamento referente à integração do Portal Nuvem

        - Pedir para o cliente permitir/alterar o direcionamento do DNS para o servidor Linux.

            Atualmente o cliente deverá ter um direcionamento do ``Endereço de entrada`` para o servidor Window na porta ``1504``, esse direcionamento será alterado para o servidor Linux na porta ``9999``.


Passos para a migração após a homologação
-----------------------------------------

#. Instalar aplicativo ``object-storage``

    Abrir o KorpDesktop e se conectar com um Login administrador, testa o seguinte app:
    
    - ObjectStorage:

            Acessar `LOG01 - Cadastro de Produto` -> Imagem -> Adicionar uma `imagem pequena` -> Fechar o Aplicativo, e abrir novamente no mesmo caminho, a imagem ainda deve estar lá.

#. Migração de object-storage

    - Executar:

        .. code-block:: powershell

            nssm edit ViasoftKorpStorageServer

        A tela que irá abrir contém o diretório de arquivos, sendo geralmente ``C:/Korp/Storage``.

    *Caso não hajam arquivos, apenas parar o serviço* ``ViasoftKorpStorageServer`` *e* ``ViasoftKorpObjectStorage``

    - Copiar os arquivos para a pasta ``/etc/korp/dados-docker/minio-server/`` no servidor Linux

    - Parar o serviços ``ViasoftKorpStorageServer`` e ``ViasoftKorpObjectStorage``

#. Migração de Viasoft.Email

    - Caso haja configurações de email, essas estarão em ``C:/Korp/Storage/email``

    - Copiar arquivo para ``/etc/korp/dados-docker/viasoft-email/data/<tenant-id>/<tenant-id>.db`` no servidor Linux

#. Correção de rotas no fabio

    - Alterar as configurações do Fabio para:

        Alterar os valores ``<IP-WINDOWS>`` e ``<IP-LINUX>`` 

        .. code-block::

            proxy.addr = :1504
            ui.addr = :9988
            proxy.matcher = glob
            registry.backend = static
            registry.static.routes = route add Viasoft.LicensingServer /Licensing/LicenseServer/* http://localhost:9980/ \n \
            route add Viasoft.LicensingServer /licensing/license-server/* http://localhost:9980/ \n \
            route add KorpServices /korp/* http://<IP-WINDOWS>:1503/ \n \
            route add KorpServices /Korp/* http://<IP-WINDOWS>:1503/


    .. route add FallbackToLinux /* http://<IP-LINUX>:9999/  - rota removida

    
    - Reiniciar o serviço ``ViasoftKorpGateway``

    - Acessar ``http://<IP-WINDOWS>:9988`` e confirmar que as configurações foram aplicadas

#. Configurar o endereço de email nas bases licenciadas

    - Executar a seguinte query em todas as bases, alterando o valor ``<IP-LINUX>``

        .. code-block:: SQL

            -- Configuração envio de e-mail
            declare @url_email varchar(max)
            declare @valor_parametro_atual varchar(max)

            set @url_email = 'http://<IP-LINUX>:9999/'
            select @valor_parametro_atual = valor from parametros where secao = 'REST' and chave = 'Email'

            IF ISNULL(@valor_parametro_atual, '') = ''
            begin
                insert into parametros (secao, chave, valor) values ('REST', 'Email', @url_email)
            end
            else if (@valor_parametro_atual != @url_email)
            begin
                RAISERROR('O valor do parâmetro de email está diferente do esperado. Valor atual %s, valor esperado %s', 16, 1, @valor_parametro_atual, @url_email)
                --delete from parametros where secao = 'REST' and chave = 'Email'
            end

#. Para os serviços ``ViasoftKorp*``

    **EXCETO:**
    
        - ``ViasoftKorpLicenseServer``
        - ``ViasoftKorpGateway``

#. Correção de redirecionamento referente à integração do Portal Nuvem

    - Acessar ``Gerenciamento de Licenças`` em porta.korp.com.br -> abrir as configurações do cliente -> ``Configurações de infraestrutura`` -> Em ``Endereço de entrada`` alterar a porta de ``1504`` para ``9999``.

    - Pedir para o cliente permitir/alterar o direcionamento do DNS para o servidor Linux.

        Atualmente o cliente deverá ter um direcionamento do ``Endereço de entrada`` para o servidor Window na porta ``1504``, esse direcionamento será alterado para o servidor Linux na porta ``9999``.

    - Testar:

        - Cliente deve acessar o ``portal.korp.com.br``, e alterar/criar algum usuário.

        - As alterações devem ser vistar no portal local.

            **PARA ESSE TESTE SER VÁLIDO, OS SERVIÇOS DO SERVIDOR WINDOWS PRECISAM JÁ TER SIDO DESATIVADOS**

Notas
-----

#. A migração só ser feita após a homologação pelo cliente

#. O config.json do Korp Desktop de todas as estações deve ser alterado para apontar para o servidor Linux.

    Esse passo não precisa ser feito durante a virada, podendo ser feito gradativamente depois.