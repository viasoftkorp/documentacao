Atualização de publicação de serviços 26/07/2023
------------------------------------------------

A partir dessa data, há uma nova modalidade de versionamento: **serviços versionados exclusivo**

serviços versionados exclusivo seguem o versionamento do ERP(2023.3.0.x), porém diferente de serviços versionados não exclusivos, rodam apenas uma instância, que deve ser compatível com todas as rotas das versões antigas.

Devido a criação de serviços versionados exclusivos, algumas mudanças foram feitas na publicação de serviços:

Adições à Jenkinsfile
=====================

Propriedades adicionadas às Jenkinsfiles:

Geral
*****

    - ``publishProdImageOnRelease``:

        Quando definida como ``true``, a build do Jenkins irá publicar a imagem de produção e de homologação ao liberar um commit na release.

        A imagem de homologação tomara efeito imediato nos ambientes da qualidade, enquanto a imagem de produção será atualizada somente à noite.

        A funcionalidade de Tag continua a mesma: libera imagem de produção, e atualiza imediatamente no portal de produção.


Frontend
********

    - ``runAsContainer``:

        Faz com que o Front rode como um container exclusivo na nuvem. Esse será o novo padrão.

        FrontEnd que rodam como containers ficam no servidor ``Process-3``, e o nome do container é o Identificador do aplicativo.

Migrando frontend para rodar como container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Atualize a Jenkinsfile do repositório para a ultima versão utilizando o `template do schematics`_

    - A propriedade ``runAsContainer`` deve ter o valor ``true``.

#. Crie um compose para o front:

    #. Acesse o diretório ``Oracle/Process-3/frontend-composes`` em `korp-aic`_.

    #. Duplique o arquivo ``compose-exemplo.yml``, e o renomeia para ``compose-<app_id>.yml``, onde ``<app_id>`` é o identificador do seu app.

    #. Verifique em qual das 3 categorias seu aplicativo se encaixa:

        - Frontend não versionado
        - Frontend versionado exclusivo
        - Frontend versionado não exclusivo

    #. Mantenha o template de compose para a sua categoria de versionamento, e remova as outras.

    #. Substitua as variáveis:

        - ``appIdentifier``
        - ``version``

    #. Crie um PR, e solicite para a equipe de DevOps atualizar o arquivo no servidor.


Migrando serviço não versionado para versionado exclusivo
=========================================================

Korp-IAC
********

#. Localizar compose do serviço

#. Alterar as propriedades ``image`` e ``container_name``, adicionando a nova versão.

    .. code-block:: yaml

      <service-name>:
        image: "korp/<service-name>:<version>.x"
        container_name: "<service-name>-<version>"
        restart: "no"
        extra_hosts: *extra_hosts
        environment:
          - URL_CONSUL=http://consul-agent-process:8500
          - URL_GATEWAY=https://gateway.korp.com.br
          - HOST_ADDRESS=<host_addr>
          - HTTP_PORT=<port>
        networks:
          - servicos
        ports:
          - "<port>:<port>"

#. Subir PR para a equipe de DevOps e solicitar atualização do compose no servidor.

KorpSetupLinux
**************

#. Localizar compose do serviço

#. Alterar as propriedades ``image`` e ``container_name``, alterando a versão para '{{ version_without_build }}'

    .. code-block:: yaml

      <service-name>:
        image: "{{ docker_account }}/<service-name>:{{ version_without_build }}.x{{ docker_image_suffix }}"
        container_name: "<service-name>-{{ version_without_build }}"
        restart: unless-stopped
        extra_hosts: *default-extra_hosts
        environment:
          - ON_PREMISE_MODE=true
          - USE_SERVERGC={{ use_servergc }}
          - URL_CONSUL=http://consul-server:8500
          - CERT_FILE_PATH={{ containers_cert_path }}
        networks:
          - servicos
        volumes:
          - "{{ certs_directory }}/:{{ certs_directory }}/"

#. No diretório ``vars`` da role, editar o arquivo ``main.yml``, e remover a propriedade ``version.unversioned`` do serviço.

#. Subir PR para a equipe de DevOps

infrastructure-setup-dev
************************

#. Localizar compose do serviço

#. Alterar as propriedades ``image`` e ``container_name``, alterando a versão para '{{ version_without_build }}'

    .. code-block:: yaml

      <service-name>:
        image: "korp/<service-name>:{{ version_without_build }}.x{{ docker_image_suffix }}"
        container_name: "<service-name>-{{ version_without_build }}"
        restart: on-failure:10
        extra_hosts: *default-extra_hosts
        environment:
          - URL_GATEWAY={{ frontend.endpoints.gateway_url }}
          - URL_CDN={{ frontend.endpoints.cdn_url }}
          - URL_LOADER={{ frontend.endpoints.frontend_url }}
          - URL_CONSUL=http://consul-server:8500
          - CERT_FILE_PATH={{ self_signed_ca_cert_path }}
        networks:
          - servicos
        volumes:
          - "{{ self_signed_certs_directory }}/:{{ self_signed_certs_directory }}/"

#. No diretório ``vars`` da role, editar o arquivo ``main.yml``, e remover a propriedade ``version.unversioned`` do serviço.

#. Subir PR para a equipe de DevOps

Repositório
***********

Criar branches das releases liberas

.. _template do schematics: https://bitbucket.org/viasoftkorp/viasoft.schematics/src/master/src/workspace/files/Jenkinsfile
.. _korp-aic: https://bitbucket.org/viasoftkorp/korp-iac/src/master/Oracle/Process-3/frontend-composes
