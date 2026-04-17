.. role:: raw-html-m2r(raw)
   :format: html


Tooltip
=======

Tooltips são balões de dica mostrados a passar o mouse sobre o component. Para utilizar tooltips, basta definir um texto na propriedade ``tooltip`` da seguinte maneira:

.. code-block:: html

   <any-component tooltip="Texto de Dica"></any-component>

Exemplo de tooltip aplicado a um `\ ``<vs-icon>`` <../icon>`_\ :


.. image:: ./_images/tooltip.png
   :target: ./_images/tooltip.png
   :alt: Tooltip demonstration


Posição do tooltip
------------------

Por padrão, o balão de dica aparece sempre abaixo do component. Para alterar isso, a propriedade ``tooltipPosition`` deve ser utilizada da seguinte maneira:

.. code-block:: html

   <any-component
       tooltip="Texto de Dica"
       tooltipPosition="<POSITION>"
   ></any-component>

Onde ``<POSITION>`` é a posição desejada. A tabela a seguir demonstra todas as posições disponíveis:

.. list-table::
   :header-rows: 1

   * - Posição
     - Descrição
   * - ``above``
     - Sempre mostrar acima do componente
   * - ``below``
     - Sempre mostrar abaixo do componente
   * - ``left``
     - Sempre mostrar à esquerda do componente
   * - ``right``
     - Sempre mostrar à direita do componente
   * - ``before``
     - Mostrar à esquerda em layouts LTR\ :raw-html-m2r:`<sup>[[1]](#anotacoes)</sup>` e à direita em layouts RTL\ :raw-html-m2r:`<sup>[[2]](#anotacoes)</sup>`
   * - ``after``
     - Mostrar à direita em layouts LTR\ :raw-html-m2r:`<sup>[[1]](#anotacoes)</sup>` e à esquerda em layouts RTL\ :raw-html-m2r:`<sup>[[2]](#anotacoes)</sup>`


----

:raw-html-m2r:`<b id="anotacoes">Anotações</b>`


#. LTR (left-to-right): Layout utilizado em regiões com escrita da esquerda à direita, como o inglês e o português
#. RTL (right-to-left): Layout utilizado em regiões com escrita da direita à esquerda, como o árabe e o hebraico
