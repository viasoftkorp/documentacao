Atualização versão de build do ERP GoGlobal - Interno
=====================================================

Esta pagina aborda o passo a passo para a atualização versão de build do ERP GoGlobal - Interno

A atualização versão de build do ERP GoGlobal - Interno só pode ser realizada nos ambientes da Qualidade.


#. Acessar os templates do AWX

#. Selection o ``Workflow Job Template`` "`Atualização versão de build do ERP GoGlobal - Interno <https://awx.korp.com.br/#/templates/workflow_job_template/38/details>`_"

#. Clicar em ``Launch``

#. Selecioneos campos:

    - Selecione os ambientes que serão atualizados
    - Desconectar usuários conectados? (Caso marcado como 'Não' e haja alguem conectado em um dos ambientes conectados, a atualização irá falhar)
    - Atualizar Bases após atualização?

#. Execute a tarefa

.. note:: 

    Selecione o ambiente QA e serviços Delphi a serem atualizados e clique em ``Next``

    .. image:: ./images/atualizacao_build_erp_interno1.jpg
        :width: 600    

    |

    Confirme o ambiente QA e serviços Delphi estão certos e clique em ``Launch``

    .. image:: ./images/atualizacao_build_erp_interno2.jpg
        :width: 600