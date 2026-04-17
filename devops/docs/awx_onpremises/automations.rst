Automações
==========

Atualização de serviço
----------------------

Para realizar a atualização de um serviço, vamos usar o ``workflow`` "`Atualização de serviço em cliente onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/157/details>`_"

#. **Tenant**: Insira o Tenant Id do cliente;

#. **Serviço**: Insira o nome exato do serviço; Para encontrar o nome exato, pode ser usado o workflow:

	`Visualizar serviços ativos em cliente <get_service_names.html>`_

- Essa automação irá executar o script ``./containers_update.sh <service>`` no Tenant selecionado;

- Ao fim da execução, será exibida a versão atual e ID do commit do serviço. Cheque se a atualização foi bem-sucedida;
    .. image:: ./images/automation_output.png
        :width: 600


Execução de carga inicial
-------------------------

Para realizar a carga inicial, vamos usar o ``workflow`` "`Execução de script de carga de dados em clientes onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/58/details>`_"

#. **Tenant**: Insira o Tenant Id do cliente;

#. **Environment**: Insira o Environment Id do cliente;

#. **Tipo de log**: Escolha entre ``email`` ou ``terminal``

- Essa automação irá executar o script ``./carga_inicial_elt.sh environmentId="<environment_id>"`` no Tenant selecionado;

Aguarde a execução terminar e visualize os logs da forma selecionada;

.. note::
    #. Em todos os casos, sempre execute o template do tipo ``Workflow job template``:
        .. image:: ./images/workflow_job_template.png
            :width: 600

    #. É necessária aprovação para executar estes templates. 
