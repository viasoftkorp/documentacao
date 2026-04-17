Acesso SQL Server onpremise
===========================

Esta pagina aborda o passo a passo acessar o SQL Server de cliente onpremise.


#. Acessar os templates do AWX

#. Selecione o ``Workflow Job Template`` "`Liberação FRP para SQL Server Onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/313/details>`_"

#. Clicar em ``Launch``

#. Selecione os campos:

    - Selecione o Tenant em que será liberado o acesso:

#. Execute a tarefa

Configuração em servidor do cliente
###################################

Ao final da execução da tarefa, será escrito um log com as seguintes informações:

.. code-block::

    A porta aberta é <PORT>
    Faça o download script frpc em: https://cdn-korp.s3.sa-east-1.amazonaws.com/tools/v1/FRP/frpc.ps1

Para utilizar a ferramenta:

#. Faça o download de ``frpc.ps1``, pelo link fornecido, **NO SERVIDOR DO CLIENTE**.

#. Execute o script ``frpc.ps1``.

#. O Script irá solicitar a porta fornecida pelo log do workflow.

#. Na sua maquina local, acesse o SQL Server do cliente utilizando o endereço ``frps-sql-onpremise.korp.com.br,<PORT>``.

.. note::

    **A porta aberta é válida apenas até o final do dia**. Caso seja necessário acessar o SQL Server novamente, é necessário rodar o workflow novamente, re-executar ``frpc.ps1`` e fornecer a nova porta.
