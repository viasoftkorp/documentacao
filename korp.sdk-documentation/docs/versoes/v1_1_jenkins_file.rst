| Para atualizar a **Jenkinsfile**, a **dockerfile** e o **compose** do serviço também deverão ser atualizados.
| Para atualizar cada arquivo, siga seus devidos tópicos.


Jenkinsfile
-----------

#. Copie o valor da variável composeName da Jenkinsfile atual.

#. Configurar Jenkinsfile


  * Caso seu projeto utilize versionamento (caso padrão, Ex: 2022.1.0.x), use o arquivo `Jenkinsfile`_.

    Caso o contrário (Ex: 1.2.x), use o arquivo `jenkinsfile_without_version`_ e renomeie ele para ``Jenkinsfile``. **O 'J' DEVE SER MAIÚSCULO**.

  * Altere os parâmetros das duas primeiras linhas:

    * ``serviceName`` para o nome do seu repositório (com letras maiúsculas e pontos).
    * ``composeName`` para o nome do compose copiado no passo 1.

  * Dependendo das configurações do seu projeto, as constantes ``publishDevelopment`` e ``publishProduction`` podem ser alteradas.
    (Leia os comentários na jenkinsfile)

----

Dockerfile
----------

A principal alteração é referente ao nome do executável, que agora segue **exatamente** o nome do repositório.
  
  | As propriedades que voce terá que alterar serão:

  .. code-block::

    COPY ./<seviceName> .
    RUN chmod +x ./<serviceName>
    CMD ["./<serviceName>"]

  onde <seviceName> é o nome do seu repositório.


  | Exemplo completo após alteração

    .. code-block:: dockerfile
      :caption: ANTES

       FROM golang:1.16

       USER root
       WORKDIR /app

       ENV GIN_MODE=release \
           CGO_ENABLED=1 \
           GLOBAL_CONFIG_PATH=/app/data/globalconfig.json

       COPY ./ViasoftKorpAuditTrail .

       RUN chmod +x ./ViasoftKorpAuditTrail

       EXPOSE 9981

       CMD ["./ViasoftKorpAuditTrail"]

    .. code-block:: dockerfile
      :caption: DEPOIS

       FROM golang:1.16

       USER root
       WORKDIR /app

       ENV GIN_MODE=release \
           CGO_ENABLED=1 \
           GLOBAL_CONFIG_PATH=/app/data/globalconfig.json

       COPY ./Viasoft.AuditTrail.Client .

       RUN chmod +x ./Viasoft.AuditTrail.Client

       EXPOSE 9981

       CMD ["./Viasoft.AuditTrail.Client"]

----

Docker-compose
--------------

* Alterações dentro do container:


  * Alterar ``container_name`` para o nome do repositório (com letras maiúsculas e pontos).
  * Adicionar ``- secret-manager:/app/SecretManager/`` dentro de ``volumes:``.
  * Alterar o nome do serviço para o nome do repositório, tudo minúsculo e '-' ao invés de '.'.
  * A imagem deve seguir o padrão ``korp/<repoName_lowerCase>:<tag>`` para produção, e ``korpcicd/<repoName_lowerCase>:<tag>`` para o portal interno.

    * ``<tag>`` = Caso seu serviço seja versionado a tag será algo como ``<v>.<v>.<v>.x`` ou ``2021.4.0.x``. Caso fique uma versão fixada (caso não padrão), o ultimo 'x' deve ser substituído pela versão da tag.
    * ``<repoName_lowerCase>``\ = Nome do repositório, tudo minúsculo.

* Alterações fora do container:


  * Declarar volume ``secret-manager`` no compose (isso deve ser feito já no inicio do compose):

    .. code-block:: yaml

       volumes:
         secret-manager:
           external: true
           name: secret-manager

----

.. code-block:: yaml
  :caption: Compose antes da alteração

   version: "3.8"

   networks:
     servicos:
       external:
         name: servicos

   services:
     teamwork-integration:
       image: "korpcicd/viasoft.teamwork.integration:1.0.x"
       container_name: "viasoft.teamwork.integration"
       restart: always
       environment:
         - URL_CONSUL=http://consul-agent:8500
       networks:
         - servicos
       ports:
         - "9912:9912"


.. code-block:: yaml
  :caption: Compose após da alteração

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
     viasoft-teamwork-integration:
       image: "korp/viasoft.teamwork.integration:2021.4.0.x"
       container_name: "Viasoft.Teamwork.Integration"
       restart: always
       environment:
         - URL_CONSUL=http://consul-agent:8500
       networks:
         - servicos
       ports:
         - "9912:9912"
       volumes:
         - secret-manager:/app/SecretManager/


.. note:: 
  
  Uma vez que os composes de produção e de development foram atualizados, deve-se solicitar sua atualização nos servidores.


.. _Jenkinsfile: https://bitbucket.org/viasoftkorp/viasoft.projecttemplates.golang/src/master/Jenkinsfile?at=master
.. _jenkinsfile_without_version: https://bitbucket.org/viasoftkorp/viasoft.projecttemplates.golang/src/master/jenkinsfile_without_version?at=master
.. _korp.sdk: https://bitbucket.org/viasoftkorp/korp.sdk/src/master/