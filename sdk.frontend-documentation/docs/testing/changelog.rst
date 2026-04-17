Changelog - Testing
===================

This changelog refers to the ``@viasoft/testing`` library.

2.0.2 (07/03/2023)
------------------
This version of @viasoft/testing no longer depends on the 'cypress-image-snapshot' library. Instead, the 'matchImageSnapshot' function has been added directly to the @viasoft/testing. So it is no longer necessary to install 'cypress-image-snapshot' in your project.

- To use the image snapshot functionality in this version of @viasoft/testing, you can import the "plugin.js" and "command.js" files from the ``@viasoft/testing/snapshot`` path.

2.0.1 (01/03/2023)
------------------

This version of @viasoft/testing includes the 'cypress-image-snapshot' library. Therefore, it's no longer necessary to install 'cypress-image-snapshot' in your project.

2.0.0 (27/02/2023)
------------------

This version brings Angular up to v14, Node up to v18 and Chrome up to v107

Before updating
^^^^^^^^^^^^^^^


* After each "dependency update" step, you might need to delete your ``node_modules`` folder and ``package-lock.json`` file and run ``npm i`` again.


Update dependencies
^^^^^^^^^^^^^^^^^^^

These are the final dependency tables, go through each dependency and perform the necessary changes.

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
     - Documentation
   * - @angular-devkit/core
     - 🔄 Updated
     - ``^14.2.10``
     - `angular-devkit/core <https://github.com/angular/angular-cli>`_
   * - @angular-devkit/schematics
     - 🔄 Updated
     - ``^14.2.10``
     - `angular-devkit/schematics <https://github.com/angular/angular-cli>`_
   * - typescript
     - 🔄 Updated
     - ``~4.7.2``
     - `typescript <https://www.typescriptlang.org/>`_
   * - yargs
     - 🔄 Updated
     - ``~17.6.2``
     - `yargs <https://yargs.js.org/>`_

.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
     - Documentation
   * - @babel/cli
     - 🔄 Updated
     - ``^7.20.7``
     - `babel/cli <https://babel.dev/docs/en/next/babel-cli>`_
   * - @babel/core
     - 🔄 Updated
     - ``^7.20.7``
     - `babel/core <https://babel.dev/docs/en/next/babel-core>`_
   * - @babel/preset-env
     - 🔄 Updated
     - ``^7.20.2``
     - `babel/preset-env <https://babel.dev/docs/en/next/babel-preset-env>`_
   * - @types/jasmine
     - 🔄 Updated
     - ``~4.3.1``
     - `types/jasmine <https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/jasmine>`_
   * - @types/node
     - 🔄 Updated
     - ``~18.11.17``
     - `types/node <https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/node>`_
   * - jasmine
     - 🔄 Updated
     - ``~4.3.0``
     - `jasmine <http://jasmine.github.io/>`_


Breaking changes
^^^^^^^^^^^^^^^^

* Updated the default docker image.

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    korp/cypress-docker:node14.16.0-chrome89-ff86

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    korp/cypress-docker:node18.12.0-chrome107   
  

* Changed the default spec folder.

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    cypress/integration

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    cypress/e2e

* The ``testFiles`` property has been renamed to ``specPattern`` and is now inside ``e2e``.    

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    cypressJson.testFiles  

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    cypressJson.e2e.specPattern

* Renamed the E2E support file.

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    cypress/support/index.js

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    cypress/support/e2e.js


* Changed the cypress config testFiles.

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    cypress.json

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    cypress-config.json


* Now ``baseUrl`` property is inside ``e2e``.    

.. raw:: html

    <span style="color: red">Before</span>
    
.. code-block:: javascript

    cypressJson.baseUrl

.. raw:: html

    <span style="color: green">After</span>
    
.. code-block:: javascript

    cypressJson.e2e.baseUrl

----    

1.1.4 (17/06/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1700 <http://jira.korp.com.br/browse/FRM-1700>`_\ : ``test.script.js`` would stay up indefinitely if an error occurred during ``ng serve``. The default test script has been updated to fix this so new repositories won't have this issue, but existing repositories will have to implement this change manually. *Reminder: your application should ALWAYS be served with AOT on.*

Fixing the script in existing repositories
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Inside ``test.script.js``\ , replace the content in the ``Serve app and run rests`` region with the following code:

.. code-block:: js

   //#region Serve app and run rests
   const serve = shell.exec(SERVE_COMMAND, { silent: false, async: true });
   let runningTests = false;

   const endProcess = (code) => {
       if (serve) {
           serve.kill(code);
       }
       process.exit(code);
   }

   serve
       .stdout
       .on('data', data => {
           if (String(data).indexOf('Angular Live Development Server') > -1) {
               setTimeout(() => {
                   if (!runningTests) {
                       console.log('Error detected, process will exit now.');
                       endProcess(-1);
                   }
               }, 5000);
           }
           if (String(data).indexOf('Compiled successfully') > -1) {
               runningTests = true;
               console.log('Running tests...');
               endProcess(shell.exec(TEST_COMMAND).code);
           }

       });
   //#endregion

----

1.1.0 (21/07/2020)
------------------

Features
^^^^^^^^

* 
  Added support for TypeScript


  * Use ``typescript-migration`` schematic to add TS support to your current Cypress environment
  * Added type definitions to all helper commands

* 
  Added several helper commands

  * ``waitForElement()``
  * ``waitForElementToNotExist()``
  * ``waitForNgAnimation()``
  * ``waitForMatSidenavOpen()``
  * ``waitForMatButtonAnimation()``
  * ``waitForMatTooltipOpen()``
  * ``waitForMatTooltipClose()``
  * ``waitForMatModalOpen()``
  * ``waitForMatSelectOpen()``
  * ``waitForGridPageMenuOpen()``
  * ``waitForGridPageMenuClose()``
  * ``selectTab()``

Breaking Changes
^^^^^^^^^^^^^^^^

* 
  Commands are now exported from a single function: ``addHelperCommands()``


  * ``addTreeTableHelperCommands`` and ``addVsInputHelperCommands`` will no longer work

* 
  ``npx vs-test create`` will always generate TS tests from now on

How to Update a JavaScript test to TypeScript
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Rename file from ``<name>.js`` to ``<name>.ts``
#. Fix typescript / lint errors
#. Rename snapshot folder from ``<name>.js`` to ``<name>.ts``

We recommend using the `PowerRename module in Microsoft PowerToys <https://github.com/microsoft/PowerToys/wiki/PowerRename-Overview>`_ to easily rename all test files and snapshot folders.

----

1.0.13 (26/06/2020)
-------------------

* `FRM-1280 <http://jira.korp.com.br/browse/FRM-1280>`_\ : Added TreeTable helper commands

1.0.12 (24/04/2020)
-------------------

* `FRM-1180 <http://jira.korp.com.br/browse/FRM-1180>`_\ : Updated vs-input commands

  * Following the 4.4.0 release of ``@viasoft/components``\ , vs-input commands will now query for ``formControlName`` instead of ``controlName``. To use the old format, set the ``legacy`` parameter (usually the last one) to ``true`` as such:

    * ``cy.getVsInput('name', true);``
    * ``cy.validateVsInput('name', 'abc', true);``
    * ``cy.typeAndValidateVsInput('name', 'abc', '123', true);``

  * Changed the selector so that it queries for vs-input specifically, which might fix some issues where the command would find more than one element at a time.

1.0.3 (28/02/2020)
------------------

* `FRM-1071 <http://jira.korp.com.br/browse/FRM-1071>`_\ : Added ``--jenkins`` flag

  * This flag will enable Jenkins mode, in which the Cypress test command is run directly since it's already in a Docker environment.

1.0.2 (28/02/2020)
------------------

* 
  `FRM-1069 <http://jira.korp.com.br/browse/FRM-1069>`_\ : Changed default ``TEST_COMMAND`` const in ``test.script.js``


  * If you've already generated this file, please change the ``TEST_COMMAND`` constant manually from ``vs-test run -a`` to ``npx vs-test run -a``.

* 
  `FRM-1070 <http://jira.korp.com.br/browse/FRM-1070>`_\ : Added ``--report`` flag


  * This flag will enable JUnit reporting, which enables you to see your test results in the Jenkins pipeline.

1.0.1 (26/02/2020)
------------------

* Added ``--force-base-url`` flag

1.0.0 (26/02/2020)
------------------

Initial Release
