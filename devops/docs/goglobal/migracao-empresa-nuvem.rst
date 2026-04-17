Migração de cliente Local para GoGlobal - Nuvem
===============================================

#. Realizar backup das seguintes bases antes de iniciar

    * Base de dados do cliente, pode ser a de produção ou de homologação dependendo do que a Gestora solicitou.
    * Base Auth_Legacy_Integration
    * Arquivos do Storage
    
    A base de dados Auth_Legacy_Integration e os Arquivos do Storage deverão ser disponibilizados a Korp.

#. Configurar licenciamento do cliente
    
    * Configurar aba Configurações de Infraestrutura
        
        * Endereço de entrada = https://mobile-cloud.korp.com.br

    * Configurar aba Unidade Organizacional
        
        * Adicionar ambiente de Produção e Homologação
            
            * Apontar para o database de Produção e Homologação do Cliente

#. Ligar a VM com o nome ``SQLManager``.

    * Acessa o painel da Oracle Cloud.
    * Localizar a instância ``SQLManager`` e garantir que está ligada.
    * Verificar a coluna de Public IP pois essa VM está com IP externo não fixo.
    * **ATENÇÃO** Essa VM deve ser desligada logo após o procedimento ser finalizado. Não utilizar o Windows para desligar, fazer pelo console da Oracle.

#. Pegar backup da base do cliente

    * Exportar um backup (.bak) do database do cliente
    * Copiar o backup para o servidor ``SQLManager``.
    * Se o backup for de **produção**: Copiar o backup para a pasta compartilhada ``\\172.30.0.9\backup``. Essa pasta é a ``/opt/sql-backup/`` do SQLServer-PRD.
    * Se o backup for de **homologação**: Copiar o backup para a pasta compartilhada ``\\172.30.0.8\backupdb``. Essa pasta é a ``/opt/sql-backup/`` do SQL Server.     
    * Após criar os databases nos passos abaixo, apagar o .bak

#. Restaurar a base do cliente

    * Se o backup for de **produção**: Criar base PRD no servidor SQLServer-PRD, com as seguintes configurações
        
        * Recovery model - full
        * Compatiblity level - máxima

    * Se o backup for de **homologação**: Criar base HMLG no servidor SQLServer, com as seguintes configurações
        
        * Recovery model - simple
        * Compatiblity level - máxima

    * Adicionar o database na linha abaixo, e depois executar o script. O script deve ser rodado no servidor de produção e também de homologação, trocando o nome da base.

      .. code-block:: sql

        USE [master]

        IF OBJECT_ID('tempdb..#dbs') IS NOT NULL
          TRUNCATE TABLE #dbs
        else
          DECLARE @dbs TABLE (name VARCHAR(MAX))

        -- colocar as bases aqui, exemplo:
        -- INSERT INTO @dbs VALUES ('CLIENTE_PRD')
        INSERT INTO @dbs VALUES ('')

        DECLARE @nomedb VARCHAR(MAX)
        DECLARE @comando VARCHAR(MAX)
        DECLARE @usuario VARCHAR(MAX)
        DECLARE @owner VARCHAR(MAX)        

        IF OBJECT_ID('tempdb..#usuarios') IS NOT NULL
          TRUNCATE TABLE #usuarios
        else
          DECLARE @usuarios TABLE (usuario VARCHAR(MAX), owner VARCHAR(MAX))

        INSERT INTO @usuarios VALUES ('Octopus', 'T'), ('KorpServices', 'T'), ('KorpReporting', 'F'), ('KorpScheduler', 'T')

        DECLARE cursor_databases CURSOR FOR
        SELECT [name] FROM @dbs        
        OPEN cursor_databases
        FETCH NEXT FROM cursor_databases INTO @nomedb

        WHILE @@FETCH_STATUS = 0
        BEGIN

          DECLARE cursor_usuarios CURSOR FOR
          SELECT [usuario], [owner] FROM @usuarios
          OPEN cursor_usuarios
          FETCH NEXT FROM cursor_usuarios INTO @usuario, @owner

          WHILE @@FETCH_STATUS = 0
          BEGIN

            set @comando = '
              use ['+@nomedb+']

              DROP USER IF EXISTS ['+@usuario+']              
              CREATE USER ['+@usuario+'] FOR LOGIN ['+@usuario+']
              ALTER USER ['+@usuario+'] WITH DEFAULT_SCHEMA=[dbo]
              IF '''+@owner+''' = ''T''
                ALTER ROLE [db_owner] ADD MEMBER ['+@usuario+']
              ELSE
                ALTER ROLE [db_datareader] ADD MEMBER ['+@usuario+']                
            '

            exec (@comando)
            --print @comando

            FETCH NEXT FROM cursor_usuarios INTO @usuario, @owner
          END

          CLOSE cursor_usuarios
          DEALLOCATE cursor_usuarios

          FETCH NEXT FROM cursor_databases INTO @nomedb
        END

        CLOSE cursor_databases
        DEALLOCATE cursor_databases

#. Na base do cliente, configurar os seguintes parâmetros

    .. code-block:: sql

        SET NOCOUNT ON
        USE [CLIENTE_PRD]
        -- Configuração TenantId
        declare @tenantid varchar(max)
        declare @cnpj varchar(max)

        set @tenantid = ''
        -- PRECISA estar com pontuação
        set @cnpj = '00.000.000/0000-00'

        if (ISNULL(@tenantid, '') = '') or (ISNULL(@cnpj, '') = '') or (ISNULL(@cnpj, '') = '00.000.000/0000-00')
        begin
          RAISERROR('ATENÇÃO!!! Configurar as variáveis TenantId e Cnpj do Cliente', 16, 1)
        end
        else
        begin
            UPDATE EMPRESA SET IsDeleted = 0, TenantId = @tenantid, CreationTime = GETUTCDATE()
            UPDATE PARAMETROS set VALOR = 'F' where CHAVE = 'UseLegacyAuthMode'

            if ((select count(*) from EMPRESA) = 1)
            begin
                UPDATE EMPRESA SET CGC = @cnpj
            end
            else
            begin
              print 'ATENÇÃO!! Existe mais que uma empresa cadastrada e portanto não atualizaremos o CNPJ'
            end

            IF not exists(select valor from parametros where secao = 'REST' and chave = 'TenantId')
            begin
                insert into parametros (secao, chave, valor) values ('REST', 'TenantId', @tenantid)
            end
            else
            begin
                update parametros set valor = @tenantid where secao = 'REST' and chave = 'TenantId'
            end
        end

        -- Configuração autenticação
        IF not exists(select valor from parametros where secao = 'OCTOPUS' and chave = 'UseLegacyAuthMode')
        begin
            insert into parametros (secao, chave, valor) values ('OCTOPUS', 'UseLegacyAuthMode', 'F')
        end
        else
        begin
            update parametros set valor = 'F' where secao = 'OCTOPUS' and chave = 'UseLegacyAuthMode'
        end

        -- Configuração envio de e-mail
        declare @url_email varchar(max)
        declare @valor_parametro_atual varchar(max)

        set @url_email = 'https://api-erp.korp.com.br/'
        select @valor_parametro_atual = valor from parametros where secao = 'REST' and chave = 'Email'

        IF ISNULL(@valor_parametro_atual, '') = ''
        begin
            insert into parametros (secao, chave, valor) values ('REST', 'Email', @url_email)
        end
        else if (@valor_parametro_atual != @url_email)
        begin
            RAISERROR('O valor do parâmetro de email está diferente do esperado. Valor atual %s, valor esperado %s', 16, 1, @valor_parametro_atual, @url_email)
            --delete from parametros where secao = 'REST' and chave = 'Email'
        end

        -- Configuração TEF
        declare @caminho_tef_parametro_atual varchar(max)
        declare @caminho_tef varchar(max)
        set @caminho_tef = CONCAT('\\172.30.1.3\tef\', DB_NAME(), '\')

        select @caminho_tef_parametro_atual = valor from parametros where secao = 'Faturamento' and chave = 'DiretorioTrabalhoTef'

        IF ISNULL(@caminho_tef_parametro_atual, '') = ''
        begin
            insert into parametros (secao, chave, valor) values ('Faturamento', 'DiretorioTrabalhoTef', @caminho_tef)
        end
        else
        begin
            update parametros set valor = @caminho_tef where secao = 'Faturamento' and chave = 'DiretorioTrabalhoTef'
        end

#. Configurar LegacyMode

    .. code-block:: sql

      use [Viasoft_TenantManagement]

      declare @tenantid varchar(max)
      set @tenantid = ''

      if (ISNULL(@tenantid, '') = '')
      begin
        RAISERROR('ATENÇÃO!!! Configurar a variável TenantId do Cliente', 16, 1)
      end
      else
      begin
          update Tenant set LegacyModeEnabled = 1 where Id = @tenantid
      end

#. Adicionar base ao config.json dos Serviços Delphi

    * Acessar o servidor Services,
    * Adicionar os novos databases aos config.json da pasta C:\\ProgramData\\Korp\\{VERSÃO}\\Services\\, adicionando-os na versão instalada em diante.
    * Se existir serviços em versões maiores que a base sendo criada, será necessário adicionar as bases em ambos os config.json.
    * Reiniciar todos os serviços Delphi das versões alteradas. !! SÓ PODE SER FEITO APÓS AS 22 HORAS !!

#. A partir do backup da base ``Auth_Legacy_Integration`` do cliente, gerar script de inserção das tabelas ``application_users`` e ``user_tenants``. Esse script pode ser gerado pela opção Tasks -> Generate Scripts... do SSMS. Executar na base ``Auth_Legacy_Integration`` do servidor 172.30.0.8.

#. Configurar TenantId no script abaixo, e executar no servidor 172.30.0.8

    .. code-block:: sql

      USE [Auth_Legacy_Integration]
      GO

      DECLARE @TENANTID VARCHAR(MAX)

      SET @TENANTID = ''

      if (ISNULL(@tenantid, '') = '')
      begin
        RAISERROR('ATENÇÃO!!! Configurar a variável TenantId do Cliente', 16, 1)
      end
      else
      begin
        if not exists (select 1 from [dbo].[seed_histories] where [tenant_id] = @tenantid)
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
                  ,@tenantid
                  ,NULL)
        end
      end
      GO

#. Adicionar Korp IAC

    * No repositório https://bitbucket.org/viasoftkorp/korp-iac/, navegar até a pasta /Oracle/Services/configs/. Depois de realizar as alterações abaixo, precisa subir um pull request

      * No arquivo LicenseServerSettings.json adicionar o seguinte JSON a propriedade TenantLegacyDatabaseMapping

        .. code-block::

          {
            "TenantId": "",
            "LicensedDatabases": [
                  ""
            ]
          }

    * No servidor 168.138.251.22 - (services no portainer), pegar o arquivo LicenseServerSettings.json e fazer o replace em /home/korp/configs/
    * Reiniciar o container viasoft.licenseserver-desktop em 168.138.251.22 - (services no portainer)
    * Ver nos logs se não há nenhum erro no console do serviço (dar um f5 na tela de containers do portainer pra ver se o container não parou logo depois)    

#. Configurar connection strings

  - Acessar `AWX`_ e executar template 'Nova Empresa Nuvem'

  - Validar que job foi executado com sucesso

.. _AWX: https://awx.korp.com.br/
