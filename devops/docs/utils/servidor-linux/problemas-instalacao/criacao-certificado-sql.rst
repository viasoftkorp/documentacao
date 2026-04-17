Adição de certificado ao SQL Server
===================================

Caso os serviços apresentem o seguinte log de erro: 

.. code-block:: 

    Microsoft.Data.SqlClient.SqlException (0x80131904): A connection was successfully established with the server, but then an error occurred during the pre-login handshake. (provider: SSL Provider, error: 31 - Encryption(ssl/tls) handshake failed)

É necessário adicionar um certificado ao SQL server. Para isso, siga os passos:

#. Gerar certificado

    - Na sua maquina local, execute os script `create certificate`_, substituindo `<server-name>` pelo nome do servidor

        O nome pode ser pego executando o seguinte comando no servidor.

            .. code-block:: powershell

                [System.Net.Dns]::GetHostByName($env:computerName)

    - Após a criação do certificado, é necessário exporta-lo:

        - Acesse o serviço ``mmc.exe``

        - ``File`` -> ``Add/Remove Snap-in`` -> ``Certificates`` -> ``Computer account`` -> ``Next`` -> ``Finish`` -> ``OK``

        - Na aba de certificados, haverá um certificado com o nome da servidor, com a data de expiração para daqui 60 anos (a data de expiração deve ser alta)

        - Exportar certificado:

            - Clique com o botão direito no certificado -> ``All Tasks`` -> ``Export``

            - Exporte a chave privada (private key), selecionando os seguintes:

                .. code-block::

                    [o] Personal Information Exchange - PKCS
                        [x] Include all certificates in the certification path if possible
                        [ ] Delete the private key if the expert is successful
                        [x] Export all extended properties
                        [x] Enable certificate privacy

            - Crie uma senha qualquer, de preferencia com a criptografia ``TripleDES-SHA1``.

    - Importe o certificado no servidor do cliente:

        - Acesse o serviço ``mmc.exe``

        - ``File`` -> ``Add/Remove Snap-in`` -> ``Certificates`` -> ``Computer account`` -> ``Next`` -> ``Finish`` -> ``OK``

        - Clique com o botão direito em qualquer lugar vazio -> ``All Tasks`` -> ``Import`` -> selecione o certificado criado no passo anterior -> coloque a senha, e prossiga.

#. Adicionar permissão ao usuário do SQL server

    - Abrir ``services`` do windows -> abrir as propriedades de ``SQL Server`` -> ``Log On`` -> caso esteja selecionado ``This account``, copiar o nome da conta, e seguir esse passo, caso contrário pular para próximo passo

    - Acesse o serviço ``mmc.exe``

    - ``File`` -> ``Add/Remove Snap-in`` -> ``Certificates`` -> ``Computer account`` -> ``Next`` -> ``Finish`` -> ``OK``

    - Clicar com botão direito no certificado importado -> ``All Tasks`` -> ``Manage Private Keys`` -> ``Security`` -> adicionar novo elemento com o nome copiado do passo anterior.

    - Garantir todas as permissões para o usuário adicionado.

#. Adicionar certificado no SQL Server

    - Abra o ``SQL Server Configuration Manager`` no servidor do cliente.

    - ``SQL Server Network Configuration`` -> clique com o botão direito em ``Protocols for MSSQLSERVER`` -> ``Properties`` ->  ``Certificate`` -> Selecione o certificado importado anteriormente. Ainda não reinicie o SQL.

#. Configuração de TLS no servidor

    - Faça o download da ferramenta `IIS Crypto`_

    - Em ``Schannel``, Garanta que ``TLS 1.2`` está habilitado. (check box deve estar marcada)

    - Em ``Cipher Suites`` adicione:

        - TLS_AES_256_GCM_SHA384

        - TLS_CHACHA20_POLY1305_SHA256

        - TLS_AES_128_GCM_SHA256

    **Caso as outras opções sejam desmarcadas durante a criação das acima, as marque novamente!**

    - Aplique as configurações

        O programa irá pedir reiniciar a maquina. **Pedir autorização do cliente, pois o KORP irá ficar fora.**

        Caso não seja possível reiniciar o servidor no momento, marcar um horário com cliente.


---

Documentação utilizada de base: https://learn.microsoft.com/en-US/sql/database-engine/configure-windows/configure-sql-server-encryption?view=sql-server-ver16


.. _create certificate: https://bitbucket.org/viasoftkorp/devops/src/master/docs/utils/create-sql-certificate.ps1

.. _IIS Crypto: https://www.nartac.com/Products/IISCrypto/Download