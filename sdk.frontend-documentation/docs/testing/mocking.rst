
Mocking
=======

Requisições HTTP
----------------

Consultar a `documentação do Cypress <https://docs.cypress.io/guides/guides/network-requests.html#Stubbing>`_.

Lógica
------

Em certas situações, é necessário modificar a lógica de um componente ou serviço que não faz requisições HTTP. Nesses casos, você pode seguir os passos nesta seção.

Configuração de environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Para assegurar-se de que os testes sempre serão executados com o mesmo ambiente, podemos adicionar uma configuração de ambiente (\ ``environment``\ ) a ser utilizada apenas para servir a aplicação em uma situação de teste.

Arquivos
~~~~~~~~

Primeiramente, crie o arquivo ``environment.mock.ts`` na pasta ``src/environment/`` de seu app:

.. code-block:: ts

   export const environment = {
       ...
       production: false,
       mock: true // Ativará o "mock" para os serviços do SDK Frontend
   };

No arquivo ``angular.json`` de seu projeto, encontre ou crie as seguintes propriedades:

.. code-block:: json

   // Trocar NOME_DO_APP e CAMINHO_DO_APP pelo nome e caminho do seu app, respectivamente
   {
       "projects" : {
           ...
           "NOME_DO_APP": {
               "architect": {
                   ...
                   "build": {
                       ...
                       "configurations": {
                           ...
                           "mock": {
                               ...
                               "fileReplacements": [
                                   {
                                       "replace": "CAMINHO_DO_APP/src/environments/environment.ts",
                                       "with": "CAMINHO_DO_APP/src/environments/environment.mock.ts"
                                   }
                               ]
                           }
                       }
                   },
                   "serve": {
                       ...
                       "configurations": {
                           ...
                           "mock": {
                               "browserTarget": "NOME_DO_APP:build:mock"
                           }
                       }
                   }
               }
           }
       }
   }

Com isso feito, você poderá utilizar o comando ``ng serve --configuration=mock`` para servir seu app com o ``environment`` escolhido.

App
~~~

No módulo raiz de seu app, onde ``VsCommonModule.forRoot()`` é importado, você deve prover a propriedade ``environment``\ :

.. code-block:: ts

   import { environment } from '../environments/environment'; // Importar do diretório de environments (geralmente "src/environments/")

   // ...

   @NgModule({
       ...
       imports: [
           ...
           VsAppCoreModule.forRoot({
               ...
               environment: environment // aqui
           }),
       ],
   })
   export class AppModule { ... }

Utilização
^^^^^^^^^^

Injeção
~~~~~~~

Para utilizar o ``environment`` provido, basta injetar a constante ``ENVIRONMENT`` da seguinte maneira:

.. code-block:: ts

   import { Inject, Optional } from '@angular/core';
   import { ENVIRONMENT, IVsEnvironment } from '@viasoft/common';

   // ...

   export class MyClass {
       constructor(
           @Optional() @Inject(ENVIRONMENT) private environment: IVsEnvironment
       ) {}
   }

Para manipulação de dependências
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

É possível manipular as dependências que um módulo providencia (serviços, por exemplo) da seguinte maneira:

.. code-block:: ts

   @NgModule({ ... })
   export class MyModule {

       constructor(
           @Optional() @Inject(ENVIRONMENT) private environment: IVsEnvironment
       ) {}

       static forRoot(): ModuleWithProviders {
           /*
           * Aqui utilizamos forRoot, porém outros métodos como forChild devem
           * funcionar da mesma maneira
           */
           return {
               ngModule: MyModule,
               providers: [
               {
                   provide: MyService,
                   useClass: this.environment?.mock ? MyMockService : MyService
               }
           }
       }
   }

No exemplo acima, estamos provendo um serviço falso (\ ``MyMockService``\ ) ao invés do serviço real (\ ``MyService``\ ) baseando-se na propriedade ``mock`` de nosso ``environment``.

.. code-block:: ts

   @Injectable()
   export class MyService {
       constructor() {
           myMethod();
       }

       myMethod() {
           console.info("do something");
       }
   }

.. code-block:: ts

   @Injectable()
   export class MyMockService extends MyService {
       constructor() {
           super(); // Se MyService possui dependências injetadas, você deve passá-las aqui
       }

       myMethod() {
           console.info("do something else instead");
       }
   }
