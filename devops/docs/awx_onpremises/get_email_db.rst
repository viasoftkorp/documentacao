Obtenção de database do serviço de Email
========================================

Para obter a database de Email de um cliente onpremise, vamos usar o ``workflow`` "`Obter Database de Email de cliente onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/224/details>`_"

#. Abra o workflow e clique em ``Launch``;
#. Selecione o ``Tenand Id``, e execute a tarefa;

    .. image:: ./images/get_email_survey.png
        :width: 600

#. Verifique se a execução foi bem-sucedida. Ao fim, será enviado um email com o link de download do arquivo de Database, contendo também uma senha;
    .. image:: ./images/get_email_download.png
        :width: 600

#. Clique no link de download e use a senha obtida para descompactar o arquivo;

.. note::
    Durante a execução, o serviço ``Viasoft.Email`` é reiniciado no cliente;

