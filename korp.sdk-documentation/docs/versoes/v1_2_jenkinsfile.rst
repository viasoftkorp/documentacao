.. warning::

    A atualização da Jenkinsfile deve ser feita **apenas para serviços versionados com o desktop**.
    
    Ex: 2022.1.0.x

    Caso seu serviço não seja versionado (Ex: 1.2.x), a atualização de jenkinsfile deve ser ignorada.

Jenkinsfile
-----------

#. Copie a `Jenkinsfile`_ de Projecttemplates.Golang, e altere as 5 primeiras linhas para os valores que já estavam em seu projeto anteriormente:

.. code-block:: 

  def serviceName     = ""
  def composeName     = ""

  def publishDevelopment  = true
  def publishProduction   = true


----

Docker-compose
--------------

#. Adicionar versão sem build ao nome do serviço do compose, trocando ``.`` para ``-``. Ex:

    .. code-block::
        :caption: ANTES

        services:
          korp-producao-apontamento:
        
    .. code-block::
        :caption: DEPOIS
        
        services:
          korp-producao-apontamento-2021-3-0:

#. Adicionar versão sem build ao ``container_name`` com '-' separando. Ex:
    
    .. code-block::
        :caption: ANTES

        container_name: "Korp.Producao.Apontamento"
        
    .. code-block::
        :caption: DEPOIS
        
        container_name: "Korp.Producao.Apontamento-2021.3.0"

#. Atualizar a porta do serviço:

    Containers com a nova versão do sdk devem estar com a porta padronizada conforme o `arquivo de portas`_.

    Escolha uma porta dentro do range estabelecido pelo seu domínio, e sete dentro do compose.
    
    Por exemplo, o serviço ``Korp.Producao.Apontamento`` está no domínio 'Produção', que tem o range de portas '25000	- 25299', a porta escolhida será '25001'.
    
    **Dois containers não podem tem a mesma porta. Ou seja, cada versão do seu serviço deve ter uma porta diferente.**

#. Adicionar variável de ambiente ``- HTTP_PORT=<SERVICE_PORT>``


.. warning::

    A partir da versão v1.2.x do korp.sdk, os  serviços que versionam com o desktop, devem conter **um container por versão em uso**.

    Ou seja. Caso seu serviço seja 'Korp.Producao.Apontamento' e tenha duas versões em uso (2021.3.0.x e 2022.1.0.x), seu compose ficará da seguinte forma:



.. code-block:: yaml
  :caption: Compose antes da alteração

    version: "3.8"

    networks:
      servicos:
        external:
        name: servicos

    volumes:
      secret-manager:
        external: true
        name: secret-manager

    services:
      korp-producao-apontamento:
        image: "korpcicd/korp.producao.apontamento:2022.1.0.x"
        container_name: "Korp.Producao.Apontamento"
        restart: "no"
        environment:
          - URL_CONSUL=http://192.168.1.132:8500
        networks:
          - servicos
        ports:
          - "9951:9951"
        volumes:
          - secret-manager:/app/SecretManager/
          - /home/korp/apontamento/reports/:/app/reports/

.. code-block:: yaml
  :caption: Compose após a alteração

    version: "3.8"

    networks:
      servicos:
        external:
        name: servicos

    volumes:
      secret-manager:
        external: true
        name: secret-manager

    services:
      korp-producao-apontamento-2021-3-0:
        image: "korpcicd/korp.producao.apontamento:2021.3.0.x"
        container_name: "Korp.Producao.Apontamento-2021.3.0"
        restart: "no"
        environment:
          - URL_CONSUL=http://192.168.1.132:8500
          - HTTP_PORT=25001
        networks:
          - servicos
        ports:
          - "25001:25001"
        volumes:
          - secret-manager:/app/SecretManager/
          - /home/korp/apontamento/reports/:/app/reports/

      korp-producao-apontamento-2022-1-0:
        image: "korpcicd/korp.producao.apontamento:2022.1.0.x"
        container_name: "Korp.Producao.Apontamento-2022.1.0"
        restart: "no"
        environment:
          - URL_CONSUL=http://192.168.1.132:8500
        networks:
          - servicos
        ports:
          - "9951:9951"
        volumes:
          - secret-manager:/app/SecretManager/
          - /home/korp/apontamento/reports/:/app/reports/


.. note:: 

    * A alteração deve ser feita nos composes de produção e development.
  
    * Uma vez que os composes de produção e de development foram atualizados, deve-se solicitar sua atualização nos servidores.

    * Todas as branches que serão publicadas utilizando o compose explicado a cima devem ser atualizadas. Caso seu projeto esteja com uma versão antiga do korp.sdk que não possa ser utilizada, siga o tópico abaixo para suportar as alterações do compose

----

.. include:: jenkinfile_suport_to_versionade_compose.rst

.. _arquivo de portas: https://bitbucket.org/viasoftkorp/korp-iac/src/master/Portas-servicos/portas.txt
.. _Jenkinsfile: https://bitbucket.org/viasoftkorp/viasoft.projecttemplates.golang/src/master/Jenkinsfile