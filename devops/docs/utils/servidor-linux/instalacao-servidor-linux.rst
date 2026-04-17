Instalação de servidor Linux
============================


    ``<frontend-dns>`` = DNS do cliente, por padrão ``korp.local``

Essa documentação se refere a instalação e configuração de serviços em servidores Linux nos Clientes da korp

**Documentação fornecida para o cliente:** `Documentação Confluence`_ **.** 

Requisitos do servidor
----------------------

Para possibilitar a instalação, e suportar os apps instalados, o servidor deve cumprir as seguintes especificações:

- Linux Ubuntu Server versão 22.04.
- 4GB de memória RAM.
- Disco de boot no tamanhã de 30GB e disco de dados no tamanho 10GB.
- 2 cores de processamento.

*Estes requisitos são mínimos, sendo que poderá ser necessário maior capacidade da máquina dependendo do volume de dados de cada empresa.*

Informações fornecidas pelo cliente
-----------------------------------

- Forma de acesso.

    - "AnyDesk, VPN"

- Todas as bases do SQL utilizadas pelo Korp, separar por produção e homologação

    - COCA_COLA_PRD - Produção

    - COCA_COLA_HMLG - Homologação

    - PEPSI_PRD - Produção

- A razão social de cada empresa vinculada em cada base

    - COCA_COLA_PRD - Coca Cola Industrias Ltda

    - COCA_COLA_HMLG - Coca Cola Industrias Ltda

    - PEPSI_PRD - Pepsico do Brasil LTDA

    *Essas informações são necessárias para a integração do portal local com o portal nuvem.*

- Linux server:

    - IP do servidor

    - Login e senha:  "usuário administrador"

- Servidor de aplicações:

    - IP do servidor

- SQL Server

    - IP do SQL

- Sistema Korp

    - Login:  "E-mail administrador"

- Possui domínio próprio e IP fixo?

Passos para instalação
----------------------

.. _Pré instalação:

Pré instalação
``````````````

#. Verificar Banco de dados

    - Verificar versão do SQLServer

         .. code-block:: SQL

            USE <base>
            SELECT @@version
  
    - Verificar a versão das bases

        .. code-block:: SQL

            USE <base>
            SELECT * FROM parametros WHERE chave LIKE '%versao%'

        A versão retornada deve ser a mesma da que será feita a instalação no servidor linux.
        Caso ela seja menor, é  necessário que o cliente atualize a versão do KORP.
    
    - Verificar se não há DB de serviços que serão instalados no servidor Linux, caso haja, verificar se há dados no Banco.

        Caso tenha dados no banco, analisar qual será a estratégia adotada.

#. Verificar servidor Linux.

    - Nome de Usuário - Discos - Versão instalada

#. Verificar Aplicativos Licenciados 

        - Verificar aplicativos licenciados.
        - Verificar se a memória suficiente para instalar os aplicativos no servidor Linux. 

#. Gerar comando de instalação

    - Acessar ``portal.korp.com.br`` com o usuário administrador do cliente.

    - Acessar ``Monitor de Licenças`` > ``Configurações``.

    - Selecionar a versão desejada, e clicar em ``Copiar``.

    - Isso irá gerar o comando que deverá ser executado no servidor do cliente.

#. Autorização em SaltStack

    - Conectar no servidor ``Monitoring``.

    - Editar o arquivo ``/etc/salt/autosign_grains/tenant``, adicionando uma nova linha com o tenant do cliente.

.. _Instalação:

Instalação
``````````

#. Criar arquivo ``setup_config.ini``, contendo:

    .. code-block:: ini

        [OPTIONS]
        install_apps=<app1>,<app2>,...

    - ``appx`` são todos os aplicativos que devem ser instalados.


#. Executar comando de instalação (pego em  :ref:`Pré instalação`-1 )


.. _Pós Instalação:

Pós Instalação
``````````````

Todos os seguintes passos devem ser realizados no Servidor Windows

#. Corrigir CORS de LicenseServer
    
    - Editar arquivo ``C:\KORP\ViasoftKorpServices\Services\LicenseServer\LicenseServerSettings.json``.

    - Garantir configuração:

        .. code-block:: json

            "CORS": "https://<frontend-dns>"

        .. note::

            Caso a propriedade ``CORS`` já exista, adicionar o valor seguido de ``,``, dentro da mesma string.

            Exemplo: ``"CORS": "<cors1>,<cors2>,https://<frontend-dns>"``


#. Verificar se há arquivos do ViasoftKorpObjectStorage.

    - Executar:

        .. code-block:: powershell

            nssm edit ViasoftKorpStorageServer


        A tela que irá abrir contém o diretório de arquivos, sendo geralmente ``C:/Korp/Storage``.

    - Abrir diretório de arquivos.

    - Caso haja arquivos, eles deveram ser exportados para o servidor linux no momento de migração dos servidores.


#. Verificar se há arquivos do ViasoftKorpEmail.

    - Executar:

        .. code-block:: powershell

            nssm edit ViasoftKorpEmail


        A tela que irá abrir contém o diretório de arquivos, sendo geralmente ``C:/Korp/Storage/email``.

    - Abrir diretório de arquivos.

    - Caso haja arquivos, eles deveram ser exportados para o servidor linux no momento de migração dos servidores.


#. Configuração de licenciamento

    - Rodas a query em todas as bases.

        .. code-block:: SQL

            USE <base>
            SELECT * FROM parametros WHERE chave LIKE '%versao%'

    - Encaminhar print do retorno para Kewin.

    - Pedir para Kewin atualizar as bases no licenciamento do cliente.

    - Após a adição, reiniciar os seguintes serviços nessa ordem, separadamente:

        - Viasoft.Tenantmanagement

        - Viasoft.Administration

#. Instalar Korp Services

    - Fazer download do arquivo ``KorpSetup_Installer_<versão>.exe``, que pode ser encontrado na `Área do Cliente`_ no Portal Korp.

        .. warning:: 

            Fique atento para fazer o download da versão correta!


    - Execute o KorpSetup no servidor

    - Após a instalação, verifique o  arquivo ``C:\ProgramData\Korp\<versao>\Services\config.json``.
    
        O arquivo deve conter apenas bases licenciadas (pegas no passo 3).

        Caso falte alguma base, adicione. Caso sobre, remova.

        Caso o arquivo seja editado, reiniciar todos os serviços ``korp*<versao>``.

            .. warning:: 

                Peça autorização do cliente antes de reiniciar os serviços, pois isso irá derrubar os clientes que estão utilizando o korp.

            Para reiniciar o os serviços de forma fácil, os seguintes comandos podem ser executados no PowerShell, alterando a versão:

            .. code-block:: powershell

                Get-Service *Korp*2022_2* | stop-service
                Get-Service *Korp*2022_2* | start-service

#. Anexar ``ca-cert.crt`` no Issue de Implantação.
   
#. Encaminhar informações no grupo **Implantações servidor Linux** no Teams.

    - Nome da Empresa
    - IP Servidor Linux 
    - ``ca-cert.crt`` compactado como ``.zip``

#. Configurar parâmetros Aplicativos WEB

    - Proposta Comercial Web	-	VEN27


Validação
---------

#. Acesso ao portal

    - Editar o arquivo ``C:\Windows\System32\drivers\etc\hosts``, adicionando:

        .. code-block:: 

                <linux-server-IP> <frontend-dns>
                <linux-server-IP> korp-api.local
                <linux-server-IP> korp-cdn.local

    - Importar certificado

        - Copiar o arquivo ``/etc/korp/certs/ca-cert.crt`` do servidor linux para a pasta ``C:\temp\``

        - Importar certificado executando o comando:

            .. code-block:: powershell

                certutil.exe -addstore root C:\temp\ca-cert.crt

    - Acessar ``https://<frontend-dns>``

        - Validar que todos os apps instalados estão funcionando.

#. Teste do Korp Desktop

    - Copiar config.json atual para uma nova pasta qualquer, alterando:

        - `GatewayIp` para o IP do servidor linux

        - `GatewayPort` para `9999`

    - Instalar o KorpDesktop nessa pasta. `KorpRelease-<versão>.exe`

    - Teste de apps:

    Abrir o KorpDesktop e se conectar com um Login administrador, testa o seguinte app:

        -  AuditTrail:

            Configurações -> Parâmetros -> Pesquisa em linha (fazer qualquer pesquisa)

#. Validar que servidor está registrado no zabbix e no salt.

.. _Documentação Confluence: https://confluence.korp.com.br/pages/viewpage.action?pageId=2276720985
.. _Área do Cliente: https://portal.korp.com.br/customer-area/files
