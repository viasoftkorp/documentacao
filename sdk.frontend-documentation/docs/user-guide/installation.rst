.. role:: raw-html-m2r(raw)
   :format: html


Instalação
==========

:raw-html-m2r:`<span style="background: rgba(255, 0, 0, 0.1); color: #404040; padding: 2rem; width: 100%; display: block; text-align: center;">Esta documentação está desatualizada e não deve ser seguida para o SDK atualmente.</span>`

Pré-Requisitos
--------------

Node.js
^^^^^^^

O Angular e, portanto, o Viasoft SDK requerem a instalação do ``Node.js`` versão ``10.9.0`` ou mais recente. Recomendamos que seja instalada a versão ``10.16.3 LTS``.


* Se já possui o ``Node.js``\ , abra uma janela do terminal e digite ``node -v`` para verificar a versão instalada.
* Se você não possui o ``Node.js`` ou deseja atualizá-lo, acesse o site do `Node.js <https://nodejs.org/pt-br/>`_ e siga as instruções de instalação da versão ``10.16.3 LTS`` para seu sistema operacional.

npm
^^^

O Angular, suas ferramentas e o Viasoft SDK dependem de funcionalidades providenciadas por bibliotecas disponíveis no `npm <https://npmjs.com/>`_. Para baixar, instalar e utilizar pacotes do ``npm``\ , é necessário um gerenciador de pacotes do ``npm``.

Esse guia utilizará o ``npm client``\ , que é instalado por padrão durante a instalação do ``Node.js``. Para verificar que você possui o ``npm client`` instalado, abra uma janela do terminal e digite ``npm -v``.

Angular
^^^^^^^

Para instalar o Angular CLI, abra uma janela do terminal e digite o seguinte comando:

.. code-block:: shell

   💲️ npm i -G @angular/cli@7.3.9

É importante que seja utilizada a versão ``7.3.9``.

Criação do projeto
------------------

Para criar um novo projeto, navegue até o diretório onde deseja criar sua aplicação e digite os seguintes comandos:

.. code-block:: shell

   💲️ ng new <NOME> --prefix=<PREFIXO> --style=scss --routing=false
   💲️ cd <NOME>

Não se preocupe com o roteamento, iremos configurá-lo `aqui <./configuration.rst#rotas>`_.

Instalação do SDK
-----------------

Para instalar os pacotes do Viasoft SDK, é necessário adicionar o ``registry`` da Viasoft ao seu projeto. Para isso, abra uma janela do terminal e digite o seguinte comando:

.. code-block:: shell

   💲️ npm config set @viasoft:registry http://proget.korp.com.br/npm/viasoft-sdk-frontend/

Com o ``registry`` configurado, digite o seguinte comando para instalar os pacotes ``@viasoft``\ :

.. code-block:: shell

   💲️ npm i -S @viasoft/app-core @viasoft/http @viasoft/common @viasoft/components @viasoft/navigation @viasoft/theming @viasoft/view-template

Dependências
------------

Os pacotes do Viasoft SDK requerem que as seguintes dependências sejam instaladas:

.. code-block::

   @agm/core@1.0.0-beta.7
   @angular/cdk@7.3.7
   @angular/flex-layout@7.0.0-beta.23
   @angular/material@7.3.7
   @aspnet/signalr@1.1.4
   @asymmetrik/ngx-leaflet@5.0.1
   @fortawesome/fontawesome-pro@5.10.2
   @ngx-translate/core@11.0.1
   angular-oauth2-oidc@8.0.4
   angular2-query-builder@0.4.2
   dateformat@3.0.3
   hammerjs@2.0.8
   jwt-decode@2.2.0
   leaflet@1.4.0
   ng2-date-picker@2.12.0
   ngx-currency@1.5.1
   ngx-mask@7.3.6
   primeicons@1.0.0
   primeng@7.0.5

Para isso, abra uma janela do terminal e digite o seguinte comando para cada dependência:

.. code-block:: shell

   💲️ npm i -S <PACOTE>@<VERSÃO>

Para a instalação do FontAwesome, veja `Autenticação do FontAwesome <#autenticacao-do-fontawesome>`_ primeiro, depois instale o pacote normalmente.

Configurações adicionais
------------------------

Autenticação do FontAwesome
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Para que os ícones do FontAwesome apareçam, é necessária a autenticação com a chave do FontAwesome Pro. Abra e/ou crie o arquivo ``.npmrc`` no diretório raiz do seu projeto e adicione as seguintes linhas:

.. code-block::

   @fortawesome:registry=https://npm.fontawesome.com/
   //npm.fontawesome.com/:_authToken=<INSIRA A CHAVE AQUI>

Para obter a chave de acesso, solicite-a `aqui <https://teams.microsoft.com/l/channel/19%3a6b9981d91f784fd0ac14c0cb69fb3ac2%40thread.skype/General?groupId=ff460a7a-2c00-4d09-83a9-823facf23a8b&tenantId=3dffdf2d-8622-4734-b93b-61c05a76d598>`_.

Assets
^^^^^^

O ``@viasoft/navigation`` precisa de dois ícones para que funcione corretamente. Baixe os ícones `aqui <https://mega.nz/#F!8TRyQCzL!5zoxUfSnABKIqqKpW1kLPA>`_ e coloque-os dentro da pasta ``src/assets``.

Styles
^^^^^^

Para o funcionamento correto dos componentes, é necessário que você importe algumas folhas de estilo adicionais.

No angular.json
~~~~~~~~~~~~~~~

No diretório raiz do seu projeto, abra o arquivo ``angular.json`` e navegue até ``projects.<NOME DO PROJETO>.architect.build.options.styles``\ :

.. code-block:: json

   {
     "projects": {
       "<NOME DO PROJETO>": {
         "architect": {
           "build": {
             "builder": "@angular-devkit/build-angular:browser",
             "options": {
               "styles": [
                 "src/styles.scss"
                 // aqui!
               ],
             },
           },
         }
       },
     },
   }

Então, adicione as seguintes linhas:

.. code-block:: json

   "styles": [
       "node_modules/primeicons/primeicons.css",
       "node_modules/primeng/resources/primeng.css",
       "node_modules/primeng/resources/themes/rhea/theme.css",
       "node_modules/@fortawesome/fontawesome-pro/css/all.min.css",
       "node_modules/@fortawesome/fontawesome-pro/css/light.min.css",
       "src/styles.scss"
   ]

No styles.scss
~~~~~~~~~~~~~~

Em sua aplicação, dentro de ``src/styles.scss``\ , adicione as seguintes linhas:

.. code-block:: scss

   @import '~@viasoft/theming/use-theme';
   @include useTheme();
