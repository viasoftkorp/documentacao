Trial Nuvem - GoGlobal
======================

#. Solicitar ao cliente: 
    * 1.1 - Backup da base de dados.
    * 1.2 - Backup da base Auth_Legacy_Integration.
    * 1.3 - Quantidade de computadores que irão fazer parte do teste.

#. Disponibilizar os arquivos obtidos com o cliente em um servidor interno.

#. Solicitar a Advant:
    * 3.1 - Criação dos usuários de acordo com a quantidade de computadores que foi obtida no passo 1.3.
    * 3.2 - Criação da pasta para o Korp.
    * 3.3 - Restauração da base de dados do cliente obtido no passo 1.1.

#. Configurar o arquivo config.json dos serviços Delphi de acordo com a versão do cliente.

#. Gerar script de inserção a partir da base Auth_Legacy_Integration do cliente obtido no passo 1.2, das seguintes tabelas:
    * application_users.
    * user_tenants.
#. Em seguida inserir no Auth_Legacy_Integration da nuvem.

#. Script para inserção na tabela seed_histories na base Auth_Legacy_Integration da nuvem:  
  
    * .. code-block:: sql

        DECLARE @TENANTID VARCHAR(MAX)
        DECLARE @PRD_DBNAME VARCHAR(MAX)
        SET @TENANTID = ''
        SET @PRD_DBNAME = ''
        if (ISNULL(@TENANTID, '') = '') or (ISNULL(@PRD_DBNAME, '') = '')
        begin
            RAISERROR('ATENÇÃO!!! Configurar as variáveis TENANTID e PRD_DBNAME Cliente', 16, 1)
        end
        else
        begin
            INSERT INTO [dbo].[seed_histories]
                    ([start_time]
                    ,[end_time]
                    ,[is_running]
                    ,[forced_stopped]
                    ,[error_during_seed]
                    ,[problems]
                    ,[serialized_errors]
                    ,[tenant_id]
                    ,[database_name])
                VALUES
                    (GETUTCDATE()
                    ,GETUTCDATE()
                    ,0
                    ,0
                    ,0
                    ,''
                    ,''
                    ,@TENANTID
                    ,@PRD_DBNAME)
        end

#. Script para correção dos parâmetros de e-mail:

    * .. code-block:: sql

        DECLARE @URL_EMAIL VARCHAR(MAX)
        SET @URL_EMAIL = 'https://api-erp.korp.com.br/'
        DELETE FROM PARAMETROS WHERE SECAO = 'REST' AND CHAVE = 'Email'
        INSERT INTO PARAMETROS (SECAO, CHAVE, VALOR) VALUES ('REST', 'Email', @URL_EMAIL)