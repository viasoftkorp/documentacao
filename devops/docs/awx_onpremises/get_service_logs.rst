Obtenção de logs
================

Para obter logs de um serviço rodando na máquina de cliente onpremise, vamos usar o ``workflow`` "`Obter logs de serviço de cliente onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/163/details>`_"

#. Abra o workflow e clique em ``Launch``

    .. image:: ./images/get_logs_survey.png
        :width: 600


Acessar o AWX e executar o template 'Obter logs de serviço de cliente onpremise'. Será necessário fornecer as seguintes informações:

#. **Tenant**: Insira o Tenant Id do cliente;

#. **Serviço**: Insira o nome exato do serviço; Para encontrar o nome exato, pode ser usado o workflow:

	`Visualizar serviços ativos em cliente <get_service_names.html>`_

#. **Tipo de log**: Escolha entre ``email`` ou ``terminal``

.. note::

    #. Caso escolha ``email``, ao fim da execução, será enviado um email com o arquivo de logs do container anexado;
        .. image:: ./images/get_logs_email.png
            :width: 600

    #. Caso escolha ``terminal``, ao fim da execução, será exibido um output (limitado a 200 linhas) no terminal. Para conseguir visualizar, faça da mesma forma que é feito em `Visualizar serviços ativos em cliente <get_service_names.html>`_ :
        .. image:: ./images/get_logs_output3.png
            :width: 600
