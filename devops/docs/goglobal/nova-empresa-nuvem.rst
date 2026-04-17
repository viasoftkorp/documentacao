Nova Empresa GoGlobal - Nuvem
=============================

#. Criar licenciamento do cliente


    * Configurar aba Configurações de Infraestrutura

      * Endereço de entrada = https://mobile-cloud.korp.com.br

    * Configurar aba Unidade Organizacional

      * Adicionar ambiente de Produção e Homologação

        * Apontar para o database de Produção e Homologação do Cliente

#. Executar Workflow "`Nova Empresa Nuvem <https://awx.korp.com.br/#/templates/workflow_job_template/22/details>`_"


    * Acessar `AWX`_ e executar template 'Nova Empresa Nuvem'
    * Inserir `Tenant Id` do cliente e `quantidade de usuários` a serem criados
    * Validar que job foi executado com sucesso

    .. note::

        O Workflow irá:
          - Coletar informações do licenciamento
          - Criar databases nos servidores HMLG e PRD
          - Fazer instalação do ERP nas máquinas GoGlobal
          - Criar usuários iniciais
          - Configurar Connection Strings
          - Fazer sincronismo de usuários no ERP
          - Garantir permissões para o usuário administrador da empresa no ERP

#. Adicionar base ao config.json dos Serviços Delphi


    * Acessar o servidor Services,
    * Adicionar os novos databases aos config.json da pasta C:\\ProgramData\\Korp\\{VERSÃO}\\Services\\, adicionando-os na versão instalada em diante.
    * Se existir serviços em versões maiores que a base sendo criada, será necessário adicionar as bases em ambos os config.json.
    * Reiniciar todos os serviços Delphi das versões alteradas. !! SÓ PODE SER FEITO APÓS AS 22 HORAS !!

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

#. Adicionar os ambientes (produção e homologação) na GO-GlobalRelay


    * GO-Global Admin Console
    * GoGlobalRelay -> Apllications - Add...
    * Location - Name - Start Directory

.. _AWX: https://awx.korp.com.br/


.. #. Pegar backup da versão mais recente

..     * Exportar um backup (.bak) do database que começa com o nome BASE_CLIENTE_PRODUCAO no servidor 192.168.1.11.
..     * Copiar o backup para o servidor ``SQLManager``.
..     * Copiar o backup para a pasta compartilhada ``\\172.30.0.226\backup``. Essa pasta é a ``/opt/sql-backup`` do SQLServer-PRD.
..     * Copiar o backup para a pasta compartilhada ``\\172.30.0.196\backup``. Essa pasta é a ``/opt/sql-backup`` do SQLServer-HMLG.     
..     * Após criar os databases nos passos abaixo, apagar o .bak

.. #. Solicitar a Advant novos databases

..     * Criar base PRD no servidor SQLServer-PRD, com as seguintes configurações
        
..         * Recovery model - full
..         * Compatiblity level - máxima

..     * Criar base HMLG no servidor SQLServer-HMLG, com as seguintes configurações
        
..         * Recovery model - simple
..         * Compatiblity level - máxima

..     * Adicionar o database na linha abaixo, e depois executar o script. O script deve ser rodado no servidor de produção e também de homologação, trocando o nome da base.

..       .. code-block:: sql

..         USE [master]

..         IF OBJECT_ID('tempdb..#dbs') IS NOT NULL
..           TRUNCATE TABLE #dbs
..         else
..           DECLARE @dbs TABLE (name VARCHAR(MAX))

..         -- colocar as bases aqui, exemplo:
..         -- INSERT INTO @dbs VALUES ('CLIENTE_PRD')
..         INSERT INTO @dbs VALUES ('')

..         DECLARE @nomedb VARCHAR(MAX)
..         DECLARE @comando VARCHAR(MAX)
..         DECLARE @usuario VARCHAR(MAX)
..         DECLARE @owner VARCHAR(MAX)        

..         IF OBJECT_ID('tempdb..#usuarios') IS NOT NULL
..           TRUNCATE TABLE #usuarios
..         else
..           DECLARE @usuarios TABLE (usuario VARCHAR(MAX), owner VARCHAR(MAX))

..         INSERT INTO @usuarios VALUES ('Octopus', 'T'), ('KorpServices', 'T'), ('KorpReporting', 'F'), ('KorpScheduler', 'T')

..         DECLARE cursor_databases CURSOR FOR
..         SELECT [name] FROM @dbs        
..         OPEN cursor_databases
..         FETCH NEXT FROM cursor_databases INTO @nomedb

..         WHILE @@FETCH_STATUS = 0
..         BEGIN

..           DECLARE cursor_usuarios CURSOR FOR
..           SELECT [usuario], [owner] FROM @usuarios
..           OPEN cursor_usuarios
..           FETCH NEXT FROM cursor_usuarios INTO @usuario, @owner

..           WHILE @@FETCH_STATUS = 0
..           BEGIN

..             set @comando = '
..               use ['+@nomedb+']

..               DROP USER IF EXISTS ['+@usuario+']              
..               CREATE USER ['+@usuario+'] FOR LOGIN ['+@usuario+']
..               ALTER USER ['+@usuario+'] WITH DEFAULT_SCHEMA=[dbo]
..               IF '''+@owner+''' = ''T''
..                 ALTER ROLE [db_owner] ADD MEMBER ['+@usuario+']
..               ELSE
..                 ALTER ROLE [db_datareader] ADD MEMBER ['+@usuario+']                
..             '

..             exec (@comando)
..             --print @comando

..             FETCH NEXT FROM cursor_usuarios INTO @usuario, @owner
..           END

..           CLOSE cursor_usuarios
..           DEALLOCATE cursor_usuarios

..           FETCH NEXT FROM cursor_databases INTO @nomedb
..         END

..         CLOSE cursor_databases
..         DEALLOCATE cursor_databases

.. #. Nos dois databases novos, configurar os seguintes parâmetros


..     .. code-block:: sql

..         SET NOCOUNT ON
..         USE [CLIENTE_PRD]
..         -- Configuração TenantId
..         declare @tenantid varchar(max)
..         declare @cnpj varchar(max)

..         set @tenantid = ''
..         -- PRECISA estar com pontuação
..         set @cnpj = '00.000.000/0000-00'

..         if (ISNULL(@tenantid, '') = '') or (ISNULL(@cnpj, '') = '') or (ISNULL(@cnpj, '') = '00.000.000/0000-00')
..         begin
..           RAISERROR('ATENÇÃO!!! Configurar as variáveis TenantId e Cnpj do Cliente', 16, 1)
..         end
..         else
..         begin
..             UPDATE EMPRESA SET IsDeleted = 0, TenantId = @tenantid, CreationTime = GETUTCDATE()
..             UPDATE PARAMETROS set VALOR = 'F' where CHAVE = 'UseLegacyAuthMode'

..             if ((select count(*) from EMPRESA) = 1)
..             begin
..                 UPDATE EMPRESA SET CGC = @cnpj
..             end
..             else
..             begin
..               print 'ATENÇÃO!! Existe mais que uma empresa cadastrada e portanto não atualizaremos o CNPJ'
..             end

..             IF not exists(select valor from parametros where secao = 'REST' and chave = 'TenantId')
..             begin
..                 insert into parametros (secao, chave, valor) values ('REST', 'TenantId', @tenantid)
..             end
..             else
..             begin
..                 update parametros set valor = @tenantid where secao = 'REST' and chave = 'TenantId'
..             end
..         end

..         -- Configuração autenticação
..         IF not exists(select valor from parametros where secao = 'OCTOPUS' and chave = 'UseLegacyAuthMode')
..         begin
..             insert into parametros (secao, chave, valor) values ('OCTOPUS', 'UseLegacyAuthMode', 'F')
..         end
..         else
..         begin
..             update parametros set valor = 'F' where secao = 'OCTOPUS' and chave = 'UseLegacyAuthMode'
..         end

..         -- Configuração envio de e-mail
..         declare @url_email varchar(max)
..         declare @valor_parametro_atual varchar(max)

..         set @url_email = 'https://api-erp.korp.com.br/'
..         select @valor_parametro_atual = valor from parametros where secao = 'REST' and chave = 'Email'

..         IF ISNULL(@valor_parametro_atual, '') = ''
..         begin
..             insert into parametros (secao, chave, valor) values ('REST', 'Email', @url_email)
..         end
..         else if (@valor_parametro_atual != @url_email)
..         begin
..             RAISERROR('O valor do parâmetro de email está diferente do esperado. Valor atual %s, valor esperado %s', 16, 1, @valor_parametro_atual, @url_email)
..             --delete from parametros where secao = 'REST' and chave = 'Email'
..         end

..         -- Configuração TEF
..         declare @caminho_tef_parametro_atual varchar(max)
..         declare @caminho_tef varchar(max)
..         set @caminho_tef = CONCAT('\\172.30.1.3\tef\', DB_NAME(), '\')

..         select @caminho_tef_parametro_atual = valor from parametros where secao = 'Faturamento' and chave = 'DiretorioTrabalhoTef'

..         IF ISNULL(@caminho_tef_parametro_atual, '') = ''
..         begin
..             insert into parametros (secao, chave, valor) values ('Faturamento', 'DiretorioTrabalhoTef', @caminho_tef)
..         end
..         else
..         begin
..             update parametros set valor = @caminho_tef where secao = 'Faturamento' and chave = 'DiretorioTrabalhoTef'
..         end

.. #. Fazer login no database de produção do cliente com o usuário MASTER, então o sistema abrirá uma tela de "Inconsistências na sincronização de usuários". Marcar "Não sincronizar" nos usuários ADMIN e MASTER.

.. #. Navegar até https://portal.korp.com.br e fazer login com o e-mail do cliente no ambiente de Produção. A senha padrão é 123qwe ou korp.


..     * Abrir o aplicativo "Admin" e localizar o usuário com o e-mail que acabou de logar.
..     * Clicar sobre a linha do usuário e copiar o campo "Login". Ele será utilizado a seguir.

.. #. Fazer login nos dois database (produção e homologação) do Korp com o usuário MASTER e realizar os seguintes passos:


..     * Clicar no menu Configurações -> Gerenciador do Sistema
..     * Na barra da esquerda, clicar sobre a seta de "Usuários"
..     * Localizar o Login no painel "Usuários do sistema" que foi descoberto no passo 10.
..     * Arrastar o mesmo para o grupo "ADMINISTRADORES"
..     * Fazer logout e login com o usuário descoberto no passo 10, com a senhas padrões e ver que os menus do Korp aparecem

.. #. Configurar LegacyMode


..     .. code-block:: sql

..       use [Viasoft_TenantManagement]

..       declare @tenantid varchar(max)
..       set @tenantid = ''

..       if (ISNULL(@tenantid, '') = '')
..       begin
..         RAISERROR('ATENÇÃO!!! Configurar a variável TenantId do Cliente', 16, 1)
..       end
..       else
..       begin
..           update Tenant set LegacyModeEnabled = 1 where Id = @tenantid
..       end