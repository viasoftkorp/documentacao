Sobrescrita de base
===================

Esta pagina aborda o passo a passo para a sobrescrita de bases de Homologação na Nuvem

A sobrescrita só pode ser feita utilizando como base uma base de produção, em cima de uma base de homologação.


#. Acessar os templates do AWX

#. Selection o ``Workflow Job Template`` "`Sobrescrita de base de homologação nuvem <https://awx.korp.com.br/#/templates/workflow_job_template/23/details>`_"

#. Clicar em ``Launch``

#. Selecione o nome do Banco de Dados utilizado de base (PRD)

#. Selecione o nome do Banco de Dados que será sobrescrito (HMLG)

#. Confirme o que os nomes das bases estão certos

#. Execute a tarefa

.. note:: 

    A primeira task do Workflow é um tarefa de aprovação. Isso quer dizer que a sobrescrita de base só irá iniciar após ser aprovada.

    .. image:: ./images/approve_db_overwrite1.png
        :width: 600    

    |

    Para solicitar que uma pessoa aprove o Workflow, abra a task de aprovação, e encaminhe seu link para alguém com permissão de aprovação (1).

    Para aprovar um Workflow, confira as variáveis utilizadas no camp ``Variables``, e clique em ``Approve`` (2)

    .. image:: ./images/approve_db_overwrite2.png
        :width: 600
