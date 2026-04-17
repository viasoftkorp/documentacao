Liberação de serviços
=====================

Liberação de serviços Delphi
----------------------------

Esta pagina aborda o passo a passo para a liberação de serviço Delphi em determinada Release. O workflow irá:

- Criar uma ``tag`` no **último commit da Release selecionada**;
- Realizar a sincronização e build no Jenkins;

#. Acessar os templates do AWX;

#. Selecionar o ``Workflow Job Template`` `Liberação de serviços Delphi <https://awx.korp.com.br/#/templates/workflow_job_template/229/details>`_;

#. Clicar em ``Launch``;

#. Selecionar a Release em que será feita a liberação;

    .. image:: ./images/liberacao_servico_erp_survey.png
        :width: 600    

#. Execute a tarefa;

#. Aguarde a execução ser bem-sucedida;

    .. image:: ./images/liberacao_servico_erp_output.png
        :width: 600 

.. warning::
    O Workflow pode ter o tempo de execução mais elevado dependendo da disponibilidade das máquinas na fila do Jenkins;


Liberação de tag para Korp.AtualizacaoSistema
---------------------------------------------

Esta pagina aborda o passo a passo para a liberação de tag para o serviço Korp.AtualizacaoSistema em determinada Release. O workflow irá:

- Criar uma ``tag`` no **último commit da Release selecionada**;
- Realizar a sincronização e build no Jenkins;

#. Acessar os templates do AWX;

#. Selecionar o ``Workflow Job Template`` `Liberação de tag para Korp.AtualizacaoSistema <https://awx.korp.com.br/#/templates/workflow_job_template/293/details>`_;

#. Clicar em ``Launch``;

#. Selecionar a Release em que será feita a liberação;

    .. image:: ./images/liberacao_korp_atualizacaosistema.png
        :width: 600    

#. Execute a tarefa;

#. Aguarde a execução ser bem-sucedida;

.. warning::
    O primeiro passo do workflow é uma tarefa de aprovação. Isso significa que a liberação só começará após ser aprovada.
    - Mais detalhes em:
    `Utilizando o AWX <utilizando_o_awx.html>`_



