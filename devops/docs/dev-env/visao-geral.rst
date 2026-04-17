Visão Geral
-----------

O Ambiente para desenvolvedor consistem em 3 principais componentes:

    - VM linux
    - Maquina Windows
    - Banco de dados

Na VM Linux, única para cada colaborador, rodam todos os containers Docker.

Na Maquina windows, é executado as IDEs, os serviços Korp, e o Octopus.

Os Bancos de Dados são dois, um SQL Server, e um Postgres. Ambos são compartilhados entre todos os ambiente.

----

Cada ambiente tem um nome, esse nome é criado com base no email empresarial do colaborador.

Por exemplo, o email ``nome.colaborador@korp.com.br``, gerará um ambiente de nome ``nome-colaborador``.

Chamaremos isso de **environment-name**

Acesso ao ambiente
==================

Para acessar as ferramentas do ambiente, utiliza-se um DNS para cada colaborador. O DNS é o environment-name com o domínio ``.com``.

Dessa forma temos que:

    - Acesso Portal: ``https://<environment-name>.com``

    - Acesso Portainer: ``http://<environment-name>.com:9011``

    - Acesso Consul: ``http://<environment-name>.com:8500``

    - Acesso Fabio: ``http://<environment-name>.com:9998``

    - Acesso Fabio Desktop: ``http://<environment-name>.com:9988``


Acesso aos Bancos de Dados
==========================

Endereços:

    - SQL Server: ``dev-env-mssql.com``

    - Postgres: ``dev-env-postgres.com``

Usuário: ``<environment-name>.korp``

Ambos os bancos de dados são compartilhados entre os ambientes de todos os colabores.
Por esse motivos, todos os databases tem como prefixo o nome do ambiente.

Por exemplo, ao invés de ``Viasoft_Authentication``, o banco se chama ``<environment-name>_Viasoft_Authentication``


Configuração Maquina Windows
============================

As seguintes variáveis de ambiente são importadas na maquina do desenvolvedor:

    - ENVIRONMENT_NAME

    - LINUX_DNS

    - URL_CONSUL

    - URL_GATEWAY


Desenvolvimento Backend
#######################

Ao rodar um backend localmente (tanto Golang, quanto C#) é necessário parar o serviço equivalente da VM linux.

Caso o contrário a rota do serviço ficará duplicada no fabio, e as chamadas poderão ir para o container, ao invés da sua maquina local.

Desenvolvimento Golang
######################

Nenhuma ação precisa ser tomada, pois Golang pega das variáveis de ambiente do sistema.

Desenvolvimento CSharp
######################

Adicionar o seguinte bloco à ``launchSettings.json``:

.. code-block:: 

    {
        "profiles": {
            "dev-env": {
                "commandName": "Project",
                "launchBrowser": false,
                "environmentVariables": {
                    "ASPNETCORE_ENVIRONMENT": "Development"
                }
            }
        }
    }

Ao rodar o debug, selecionar o ambiente ``dev-env``

Desenvolvimento FrontEnd
########################

Para rodar o front, deve-se usar o comando: 

    .. code:: 
        
        ng serve --configuration=dev-env

É necessário fazer algumas alterações no projeto, essas alterações podem ser commitadas para facilitar futuros desenvolvimentos no repo.

#. Editar ``./package.json``, adicionar linha 

    .. code::

        {
            "scripts": {
                "serve:dev-env": "node replace-dev-env-variables.js && ng serve --configuration=dev-env",
            }
        }

#. Editar ``./angular.json``, adicionar linha 

    .. code-block:: json

        {
            "projects": {
                "<appName>": {
                    "architect": {
                        "build": {
                            "configurations": {
                                "dev-env": {
                                    "fileReplacements": [
                                        {
                                            "replace": "apps/<appName>/src/environments/environment.ts",
                                            "with": "apps/<appName>/src/environments/environment.dev-env.ts"
                                        }
                                    ]
                                }
                            }
                        }
                    }
                }
            }
        }

    .. code-block:: json

        {
            "projects": {
                "<appName>": {
                    "architect": {
                        "serve": {
                            "configurations": {
                                "dev-env": {
                                    "browserTarget": "<appName>:build:dev-env"
                                }
                            }
                        }
                    }
                }
            }
        }

#. Criar arquivo ``./replace-dev-env-variables.js``

    Template: `replace-dev-env-variables.js`_

    .. code-block:: javascript

        const { readFileSync, writeFileSync } = require('fs');
        const path = require('path');
        const { glob } = require("glob");

        var environmentTsFile = "";
        var appsettingsFile = "";

        let files = glob.sync(__dirname + '/**/environment.dev-env.ts');
        if(files.length == 0) {
            throw new Error("Unable to find 'environment.dev-env.ts'");
        }
        environmentTsFile = files[0];

        files = glob.sync(__dirname + '/**/appsettings.dev-env.json');
        if(files.length == 0) {
            throw new Error("Unable to find 'appsettings.dev-env.json'");
        }
        appsettingsFile = files[0];

        const replaceKey = /\!URL_GATEWAY/g;
        const replaceValue = process.env.URL_GATEWAY;
        const environmentFiles = [environmentTsFile, appsettingsFile];
        const environmentFilesFormat = 'utf-8';

        for (const environmentFile of environmentFiles) {
            const fileContent = readFileSync(environmentFile, environmentFilesFormat);
            writeFileSync(
                environmentFile,
                fileContent.replace(replaceKey, replaceValue),
                environmentFilesFormat
            );
        }

        console.info(`Environment Variables were replaced in ${environmentFiles.map(filePath => `"${path.basename(filePath)}"`).join(', ')} files`);

#. Criar arquivo ``.\apps\<appName>\src\assets\app-settings\appsettings.dev-env.json``

    Template: `appsettings.dev-env.json`_

    .. code-block:: json

        {
            "appVersion": "development",
            "backendUrl": "!URL_GATEWAY",
            "hydraUrl": "!URL_GATEWAY/",
            "apiGateway": "!URL_GATEWAY"
        }

#. Criar arquivo ``apps\<appName>\src\environments\environment.dev-env.ts``

    Template: `environment.dev-env.ts`_

    .. code-block:: typescript

        // ! THIS FILE IS BEING IGNORED BY GIT

        export const environment = {
            production: false,
            mock: false,
            local: '/assets/app-settings/appsettings.dev-env.json',
            gatewayUrl: '!URL_GATEWAY',
            assetsUrl: '/assets/',
            onPremise: false
        };

#. Commitar todos os arquivos

#. Editar .gitignore

    .. code-block::

        # Arquivos alterados conforme o ambiente de cada desenvolvedor
        *.dev-env.*

#. Commitar .gitignore

.. _appsettings.dev-env.json: https://bitbucket.org/viasoftkorp/viasoft.schematics/src/31b8c7c510c624eade8dd7b8ed04b1cb82a0244b/src/application/files/apps/__projectName@dasherize__/src/assets/app-settings/appsettings.dev-env.json
.. _environment.dev-env.ts: https://bitbucket.org/viasoftkorp/viasoft.schematics/src/31b8c7c510c624eade8dd7b8ed04b1cb82a0244b/src/application/files/apps/__projectName@dasherize__/src/environments/environment.dev-env.ts
.. _replace-dev-env-variables.js: https://bitbucket.org/viasoftkorp/viasoft.schematics/src/31b8c7c510c624eade8dd7b8ed04b1cb82a0244b/src/workspace/files/replace-dev-env-variables.js
