=================================================
Execução de Queries em Nuvem | Ambientes Internos
=================================================

Esta página fornece um passo a passo para a execução de consultas SQL através do AWX.

1. No painel principal, encontre e selecione um dos seguintes ``Workflow Job Template``:

   - Workflow "`Executar query em base de nuvem <https://awx.korp.com.br/#/templates/workflow_job_template/39/details>`_". 
    
   - Workflow "`Executar query em ambiente interno <https://awx.korp.com.br/#/templates/workflow_job_template/46/details>`_". 

.. warning::

    Certifique-se de selecionar um template do tipo ``Workflow Job Template``.

    .. image:: ./images/select_workflow.png
        :width: 600


2. Clique em ``Launch``

3. Escolha o nome do banco de dados no qual deseja executar a query

4. No campo designado, escreva a query que deseja executar na base de dados selecionada

5. Revise todas as informações fornecidas, incluindo o banco de dados, o número do ticket ERP e a query. Certifique-se de que tudo esteja correto antes de prosseguir

6. Após confirmar todas as informações, execute a tarefa.

.. note::
    
    - Caso o workflow selecionado seja **Executar Query em Base de Nuvem**, será necessário informar o TicketERP relacionado ao processo ou à tarefa que requer a execução da query.
        
    - Caso o workflow selecionado seja **Executar Query em Ambiente Interno**, será necessário informar o motivo da execução da query.

.. note::

    O primeiro passo do workflow é uma tarefa de aprovação. Isso significa que a execução da query só começará após ser aprovada.

    .. image:: ./images/approve_db_query1.png
        :width: 600

    Para solicitar a aprovação, abra a tarefa de aprovação (clicando nela) e compartilhe o link com alguém que tenha a autorização de aprovação (1).

    Para aprovar o workflow, verifique as variáveis utilizadas no campo ``Variables`` e clique em ``Approve`` (2).

    .. image:: ./images/approve_db_query2.png
        :width: 600

    - Visualização de resultados

      Após aprovação e execução, no output do workflow, você pode ver se a execução da query foi bem-sucedida. 

      .. image:: ./images/exec_db_query1.png
         :width: 600


