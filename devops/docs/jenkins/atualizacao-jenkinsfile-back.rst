Como migrar Jenkinsfile Backend
===============================

No projeto
----------

#. Remover os arquivos ``Dockerfile`` e ``entrypoint.sh`` (agora eles são gerados dinamicamente)

#. Atualizar a jenkinsfile conforme o devido template:

    - para golang: `golang`_

    - para csharp: `csharp`_


#. Criar arquivo ``version.yaml`` na root do projeto, contendo:

    .. code:: yaml

        version: <version>

    Onde ``<version>`` é versão da master(develop), contendo ``x``, por exemplo:

      - .. code:: yaml

          version: 2022.2.0.x

      - .. code:: yaml

          version: 1.2.x


.. _golang: https://bitbucket.org/viasoftkorp/viasoft.projecttemplates.golang/src/master/Jenkinsfile

.. _csharp: https://bitbucket.org/viasoftkorp/viasoft.projecttemplates/src/master/Templates/Jenkinsfile

No Compose
----------

Visto que agora a imagem para o ambiente de desenvolvedor é publicada na account ``korp``, com o sufixo ``-dev``, a imagens dos container dos portal interno precisam ser alteradas:

Antes:

    .. code:: 

        "korpcicd/<service_name>:<version>"

Depois:

    .. code:: 

        "korp/<service_name>:<version>-dev"

No Jenkins
----------

Habilitar a build para a branch ``master``


Utilidades
----------

Caso seja necessário customizar os arquivos ``Dockerfile`` ou ``entrypoint.sh``, pode-se criar um diretório ``jenkins``, e colocar os arquivos customizados nela.
