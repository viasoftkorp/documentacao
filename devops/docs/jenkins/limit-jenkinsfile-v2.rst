Customização Limit no Jenkinsfile
=================================

.. warning::
  
  Erro ``killed`` - erro por falta de recurso

  - Quando uma build falhar com o erro **"killed"** quer dizer que o limite de recursos configurados na jenkinsfile são insuficientes, e precisam ser alterados.
  - Observe também que o **exit code 137** é status diretamente relacionado à falta de memória.

  .. image:: ./images/erro_killed_recurso_137.png
      :width: 600

Customização
------------

Possibilidade de customização de consumo de recursos para realização de build, onde:

ResourcesMemoryRequest
^^^^^^^^^^^^^^^^^^^^^^

- Aguardará o servidor possuir quantidade livre de memória solicitada para iniciar o build.
- Por default e sugerido : ``3Gi``.

ResourcesMemoryLimit
^^^^^^^^^^^^^^^^^^^^

- Responsável por limitar o consumo, caso ultrapasse o valor determinado o build terminará imediatamente, com o erro ``killed``.
- Por default e sugerido : ``6Gi``.


.. warning::
  - Os valores do ``resourcesMemoryRequest`` e ``resourcesMemoryLimit`` devem possuir um embasamento pois impacta diretamente nos **recursos do servidor** e consequentemente em outros build e aplicações.
  - É ideal utilizar sempre um valor **mínimo** de recurso para iniciar o build.
  - É ideal utilizar sempre um valor aceitável de limite visando não ultrapassar limites normais de consumo de recursos.


Customizando jenkinsfile
------------------------

Para alterar os valores padrões adicione as linhas na jenkinsfile:

  Adicionar as definição de variáveis:

    - ``def resourcesMemoryRequest = "" // OPCIONAL - default "3Gi"``
    - ``def resourcesMemoryLimit = "" // OPCIONAL - default "6Gi"``

  Adicionar no objeto ``data``:

    - ``"resourcesMemoryRequest": "${resourcesMemoryRequest}"``
    - ``"resourcesMemoryLimit": "${resourcesMemoryLimit}"``

Recomendação de valores
-----------------------

Recomendamos que utilize sempre **valores mínimos** e siga a progressão da tabela para definição de ``resourcesMemoryRequest`` e ``resourcesMemoryLimit`` , onde cada projeto terá um valor empírico.

.. list-table::
   :widths: 20 20
   :header-rows: 1
   
   * - resourcesMemoryRequest
     - resourcesMemoryLimit

   * - **"3Gi"** default
     - **"6Gi"** default
   * - **"4Gi"**
     - **"8Gi"**
   * - **"5Gi"**
     - **"10Gi"**
   * - **"6Gi"**
     - **"12Gi"**
   * - **...**
     - **...**

.. warning::
    * Para os projetos que fazem uso da funcionalidade, é necessário consultar a equipe de DevOps para definir os valores a serem utilizados **caso fujam dos valores "normais" apresentados na tabela de recomendação**.
    
    * Valores arbitrários poderão causar inconsistências durante builds no Jenkins para todos os projetos.
