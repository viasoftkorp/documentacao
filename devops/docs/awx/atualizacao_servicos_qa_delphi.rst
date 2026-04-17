Atualização de serviços QA Delphi
=================================

Esta pagina aborda o passo a passo para a atualização de serviços QA Delphi

A atualização de serviços QA Delphi só pode ser realizada nos ambientes da Qualidade.


#. Acessar os templates do AWX

#. Selection o ``Workflow Job Template`` "`Atualização de serviços QA Delphi <https://awx.korp.com.br/#/templates/workflow_job_template/116/details>`_"

#. Clicar em ``Launch``

#. Selecione os campos:

    - Selecione o ambiente QA
    - Selecione os serviços Delphi a serem atualizados

#. Confirme o ambiente QA e serviços Delphi estão certos

#. Execute a tarefa

.. note:: 

    Selecione o ambiente QA e serviços Delphi a serem atualizados e clique em ``Next``

    .. image:: ./images/atualizacao_servicos_qa_delphi1.jpg
        :width: 600    

    |

    Confirme o ambiente QA e serviços Delphi estão certos e clique em ``Launch``

    .. image:: ./images/atualizacao_servicos_qa_delphi2.jpg
        :width: 600

Verificar Versão/Build dos Serviços
-----------------------------------

#. Aguardar a Execução do Workflow
	
    - Certifique-se de que o Workflow foi executado antes de prosseguir para o próximo passo.

    .. image:: ./images/atualizacao_servicos_delphi1.jpg
        :width: 600    


#. Selecionar o Job Template
	
    - Localize e selecione o ultimo nó "Reinicialização de Serviços Delphi QA".

    .. image:: ./images/atualizacao_servicos_delphi2.jpg
        :width: 600 

#. Verificar o Output
	
    - Role até o final do log e encontre a task chamada "[update_korp_services : Debug de tabela]".

    .. image:: ./images/atualizacao_servicos_delphi3.jpg
        :width: 600 

#. Visualizar Detalhes da Task
	
    - Clique sobre a task "[update_korp_services : Debug de tabela]" para exibir mais informações.

#. Exibir Host Details em JSON
	
    - Escolha a opção para exibir os detalhes no formato JSON.

    .. image:: ./images/atualizacao_servicos_delphi4.jpg
        :width: 600 

#. Analisar "result.table"
	
    - A coluna SERVIÇO exibe o nome do serviço.
	
    - A coluna VERSÃO ATUAL exibe a versão atual do serviço.
	
    - A coluna OCORREU ATUALIZAÇÃO indica a versão anterior e a versão atual.
