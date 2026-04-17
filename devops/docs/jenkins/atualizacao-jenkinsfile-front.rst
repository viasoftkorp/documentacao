Como migrar Jenkinsfile Frontend
================================

No projeto
----------

Atualizar Jenkinsfile
#####################

#. Atualizar a jenkinsfile conforme o devido template:

    - `frontend`_

Breaking Changes
################

- Renomear ``<app-name>-production`` para ``<app-name>-portal`` em ``angular.json`` e em qualquer outra referência no projeto.

``package.json`` Scripts
########################

Agora, o Jenkinsfile chamará scripts da NPM, para que você possa modificar facilmente qualquer um deles:

- ``jenkins:test``: Comando para testar seu application/packages/parcels, geralmente você deve seguir a documentação `@Viasoft/testing`_.

    - Você pode verificar o estágio de teste da Jenkinsfile antiga para ter certeza do comando anterior.

- ``jenkins:build-application``: Comando para buildar seu aplicativo.

    - Durante a build, esse comando terá algumas variáveis substituídas:

        - ``!APP_NAME``: Nome da Aplicação
        - ``!APP_BUILD_SUFFIX``: sufixo ``-portal``, pode ser customizado pela Jenkinsfile (Essa variável pode estar vazia devido aos desvios de fluxo)
        - ``!APP_FOLDER``: Pasta onde Jenkinsfile esperará o ``dist``.
        - ``!BUILD_CDN_URL``: CdnUrl, dessa forma, sua build pode saber onde estará disponível.

- ``jenkins:build-package:<PACKAGE_NAME>``: Comando para construir seu(s) package(s), observe que o ``<PACKAGE_NAME>`` depende do nome do seu package.
- ``jenkins:build-parcel:<PARCEL_NAME>``: Comando para construir suas parcels, observe que ``<PARCEL_NAME>`` depende do nome da sua parcel.

Exemplos
~~~~~~~~

.. code-block:: json

    {
        "scripts": }
            // ...
            "jenkins:test": "node ./test.script.js",
            "jenkins:build-application": "node ./node_modules/@angular/cli/bin/ng build !APP_NAME!APP_BUILD_SUFFIX --configuration production --outputPath=!APP_FOLDER --deployUrl=!BUILD_CDN_URL",
            "jenkins:build-package:PACKAGE_NAME": "npm run build-my-package",
            "jenkins:build-parcel:PARCEL_NAME": "npm run build-my-parcel"
        }
    }

.. note::

    Não se preocupe, se você não tiver nenhum package/parcel, os scripts relacionados a eles não serão chamados.

Arquivo de Versão
#################

#. Criar arquivo ``version.yaml`` na root do projeto, contendo:

    .. code:: yaml

        version: <version>
        packageVersion: <packageVersion>

    Onde ``<version>`` é versão da master(develop), contendo ``x``, por exemplo:

      - .. code:: yaml

          version: 2022.2.0.x

      - .. code:: yaml

          version: 1.2.x
    
    Onde ``<packageVersion>`` é a versão do packages, caso seu serviço não tenha packages, essa propriedade pode ser ignorada.

Exemplos
~~~~~~~~

    .. code-block:: yaml

        version: 1.3.x
        packageVersion: 1.2.1


Replaces
########

Durante o build de um app **apenas** as seguintes variáveis / strings serão substituídas após o build:

    - ``!BACKEND_URL``
    - ``!CDN_URL``
    - ``!DYNAMIC_CDN_URL``
    - ``!APP_VERSION``
    - ``!APP_DEPLOY_VERSION``

**Quaisquer outras variáveis / strings que eram substituídas anteriormente devem ser revisadas/removidas/substituídas manualmente.**

Scripts customizáveis
#####################

Agora a Jenkinsfile suporta scripts customizáveis pré e pós estágios, se você deseja executar algum código entre os estágios, poderá criar qualquer um dos seguintes arquivos na pasta `./Jenkins`, contendo comandos de bash:

    - ``pre-initialize.sh``
    - ``post-initialize.sh``
    - ``pre-install-dependencies.sh``
    - ``post-install-dependencies.sh``
    - ``pre-tests.sh``
    - ``post-tests.sh``
    - ``pre-build-application.sh``
    - ``post-build-app.sh``
    - ``pre-publish-app.sh``
    - ``post-publish-app.sh``
    - ``pre-build-packages.sh``
    - ``post-build-packages.sh``
    - ``pre-publish-packages.sh``
    - ``post-publish-packages.sh``
    - ``pre-build-parcels.sh``
    - ``post-build-parcels.sh``
    - ``pre-publish-parcels.sh``
    - ``post-publish-parcels.sh``

.. note::

    Não se preocupe, esses scripts são opcionais; portanto, por padrão, você não precisará deles.


No Jenkins
----------

Habilitar a build para a branch ``master``


.. _@viasoft/testing: https://sdk-frontend-documentation.readthedocs.io/en/latest/testing/changelog.html
.. _frontend: https://bitbucket.org/viasoftkorp/viasoft.schematics/src/master/src/workspace/files/Jenkinsfile
