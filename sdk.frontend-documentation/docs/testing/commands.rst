
Comandos - Testing
==================

Cypress
-------

Consultar a `documentação do Cypress <https://docs.cypress.io/api/api/table-of-contents.html>`_.

Alguns comandos são essenciais e devem ser estudados:


* `cy.get <https://docs.cypress.io/api/commands/get.html#Syntax>`_ (Encontrar elementos utilizando seletores)
* `cy.contains <https://docs.cypress.io/api/commands/contains.html#Syntax>`_ (Encontrar elementos por conteúdo)
* `cy.click <https://docs.cypress.io/api/commands/click.html#Syntax>`_
* `cy.type <https://docs.cypress.io/api/commands/type.html#Syntax>`_
* `should <https://docs.cypress.io/api/commands/should.html#Syntax>`_ (Validações)

Personalizados
--------------

A biblioteca ``@viasoft/testing`` disponibiliza alguns comandos personalizados para facilitar os testes que utilizam o ``@viasoft/components``. O desenvolvedor pode também criar seus próprios comandos personalizados, segundo a `documentação do Cypress <https://docs.cypress.io/api/cypress-api/custom-commands.html>`_.

cy.getVsInput
^^^^^^^^^^^^^

Esse comando retorna o elemento ``input`` associado a um ``controlName``\ , se o mesmo existir na tela.

Sintaxe
~~~~~~~

.. code-block:: ts

   cy.getVsInput(controlName);

Exemplo
~~~~~~~

.. code-block:: ts

   cy.getVsInput('myControlName').click().type('some text');

cy.validateVsInput
^^^^^^^^^^^^^^^^^^

Esse comando valida o conteúdo do elemento ``input`` associado a um ``controlName``\ , se o mesmo existir na tela.

Sintaxe
~~~~~~~

.. code-block:: ts

   cy.validateVsInput(controlName, expectedValue);

Exemplo
~~~~~~~

.. code-block:: ts

   cy.validateVsInput('myControlName', 'some text');

cy.typeAndValidateVsInput
^^^^^^^^^^^^^^^^^^^^^^^^^

Esse comando digita um valor no elemento ``input`` associado a um ``controlName`` e valida o conteúdo dele, se o mesmo existir na tela.

Sintaxe
~~~~~~~

.. code-block:: ts

   cy.typeAndValidateVsInput(controlName, value, expectedValue);

Exemplo
~~~~~~~

.. code-block:: ts

   cy.typeAndValidateVsInput('cpfFormControl', '12345678900', '123.456.789-00');
