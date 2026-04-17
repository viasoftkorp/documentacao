.. role:: raw-html-m2r(raw)
   :format: html


Grid
====

:raw-html-m2r:`<span style="background: rgba(38, 128, 235, 0.1); padding: 2rem; width: 100%; display: block; text-align: center;">Esta página está incompleta.</span>`

``<vs-grid>`` é o componente de tabela utilizado para visualizar uma grande quantidade de dados.

----

Quantidade total de itens
-------------------------

A propriedade ``VsGridOptions.showTotalCount`` habilita a visualização da quantidade total de itens, disponível no canto inferior direito da grid.

Quantidade total de itens
-------------------------

A propriedade ``VsGridOptions.manualRequest`` faz com que a grid espere até que o usuário clique um botão para carregar os dados.

Alinhamento
-----------

Nas colunas, a propriedade ``VsGridColumnSettings.align`` pode ser definida como ``'none' | 'left' | 'right'`` para alinhar o cabeçalho e o conteúdo ao centro, esquerda ou direita, respectivamente.

Reordenação das colunas
-----------------------

A propriedade ``VsGridColumnSettings.reorderCols`` define se as colunas podem ou não terem sua ordem alterada.

Largura das colunas
-------------------

A propriedade ``VsGridColumnSettings.resizeCols`` define se as colunas podem ou não terem suas larguras alteradas.

Cache persistente
-----------------

A propriedade ``VsGridColumnSettings.persistentCache`` pode ser desabilitada para que a grid descarte o cache ao haver mudança nas colunas.
