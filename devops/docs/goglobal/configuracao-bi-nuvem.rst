Configurando BI
---------------

Informações fornecidas:

    - Nome da empresa

#. Mapear as seguintes informações:

    - tenant_id
    - environment_id
    - db_name
    - token


#. Executar carga em cliente:

    - Clientes nuvem:

        .. code:: bash

            curl --location --request POST 'https://gateway.korp.com.br/2024.2.0/ELT/carga-inicial' \
            --header 'TenantId: <tenant_id>' \
            --header 'EnvironmentId: <environment_id>' \
            --header 'DatabaseName: <db_name>' \
            --header 'Authorization: Bearer <token>'

    - Clientes onpremise:

        Executar o ``workflow`` "`Execução de script de carga de dados em clientes onpremise <https://awx.korp.com.br/#/templates/workflow_job_template/58/details>`_"

        Verificar valor `CourtYear` no KV de `korp.legacy.elt`. esse valor deve ser um ano próximo do atual.

#. Conectar no banco ``129.151.32.61`` pelo https://pgadmin.korp.com.br/browser/

#. Criar role cliente com a query:

    .. code-block:: sql

        CREATE ROLE "<usuário>" WITH
            LOGIN
            NOSUPERUSER
            NOCREATEDB
            NOCREATEROLE
            INHERIT
            NOREPLICATION
            CONNECTION LIMIT -1
            PASSWORD '<senha_aleatória>';

    Onde ``<usuário>`` é o nome da empresa concatenado com ``.bi``

    Onde ``<senha_aleatória>`` é uma senha gerada para cada cliente.
    
        - Por exemplo, a empresa 'LECLAIR INDUSTRIA E COMERCIO DE PERFUMES E COSMETICOS LTDA', tem o usuário ``leclair.bi``

#. Alterar permissões do usuário criado nos bancos ``viasoft_elt``, ``viasoft_vendas_elt`` com a query:

    .. code-block:: sql

        GRANT USAGE ON SCHEMA "<environment_id>" TO "<usuário>";
        GRANT SELECT ON ALL TABLES IN SCHEMA "<environment_id>" TO "<usuário>";
        GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA "<environment_id>" TO "<usuário>";

    Query deve ser rodada nos 2 bancos, uma vez para cada ``EnvironmentId`` do cliente.

#. Configurar PBIX conforme vídeo `configuração PBIX`_, importando eles do repositório `Viasoft.ELT.BI`_ 


#. Compartilhar o Workspace do PowerBI com o cliente `vídeo`_

#. A query de `DRE`_ deve ser executada na base de dados do cliente (base do Korp).

.. note::
    
    Link adicionar: https://teams.microsoft.com/l/meetingrecap?driveId=b%21NctC0YGV306mvaK_McObrPZCL-U1aptDkp-PhMb03aEqcZ_9-oDCRqAWp02HRU2g&driveItemId=01HTNXNNGF4L56KL6WWNAI7VKJX24GVRM7&sitePath=https%3A%2F%2Fkorpinformatica-my.sharepoint.com%2F%3Av%3A%2Fg%2Fpersonal%2Fkewin_robetti_korp_com_br%2FEcXi--Uv1rNAj9VJvrhqxZ8BbkgpGRddLSw6aF6MUAAUJA&fileUrl=https%3A%2F%2Fkorpinformatica-my.sharepoint.com%2Fpersonal%2Fkewin_robetti_korp_com_br%2FDocuments%2FGrava%25C3%25A7%25C3%25B5es%2FDeploy%2520Analytics-20250430_100904-Meeting%2520Recording.mp4%3Fweb%3D1&iCalUid=040000008200E00074C5B7101A82E0080000000087AA2AACBCB3DB01000000000000000010000000624969DE31CA9049A6F52B57564A28B2&threadId=19%3Ameeting_ZjVmMjc4YTYtMTBkNC00NGM0LTllOWUtYjRkMzBiYjY4ZGU0%40thread.v2&organizerId=557b915e-aee5-464c-8011-7466164b0641&tenantId=e24d5dd3-8827-42f9-887b-143fb07a74ac&callId=782eb358-dcb3-476c-b32b-7c8dc8d1a9a6&threadType=Meeting&meetingType=Scheduled&subType=RecapSharingLink_RecapCore

.. _configuração PBIX: https://bitbucket.org/viasoftkorp/devops/src/master/docs/goglobal/videos/PBIX
.. _Viasoft.ELT.BI: https://bitbucket.org/viasoftkorp/viasoft.elt.bi/src/master/
.. _vídeo: https://korpinformatica.sharepoint.com/:v:/s/PortaldeVideos/EZzaCv1xhqFFsUUOkISQTqsB6faayki6yGcAH5Va7gDXuw?e=MGMIZm
.. _DRE: https://bitbucket.org/viasoftkorp/viasoft.elt.bi/src/master/SQL/DRE_POWER_BI.sql