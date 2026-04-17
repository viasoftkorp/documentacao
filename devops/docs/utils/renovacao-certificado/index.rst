Renovação de Certificado \*.korp.com.br
---------------------------------------


Informações gerais
##################

Os arquivos de certificados são salvos no  `Vaultwarden <https://vaultwarden.korp.com.br/#/vault?collectionId=2930323c-f9ce-463d-bc0f-d7e37bce6c4c>`_.

O arquivo PFX deve ser gerado todos os anos, pois ele contém o .crt + korp-key.pem. Ele é utilizado pelo ``Viasoft.Authentication`` para geração de tokens, e é **necessário** gerar o PFX com senha. Para gerar ele executar utilizar o comando:

.. code:: 

    openssl pkcs12 -export -out cert.pfx -inkey korp-key.pem -in cert.crt

O arquivo chain é nada mais do que o certificado korp.com.br + o certificado intermediário (literalmente concatenados, o do domínio em cima e o intermediário embaixo). O nosso intermediário foi pego de https://support.globalsign.com/ca-certificates/intermediate-certificates/alphassl-intermediate-certificates (no caso foi o AlphaSSL CA - SHA256 - G4).


Testando certificado
####################

antes de subir em produção, adicionar certificado em ambiente interno, e testar pelo site: https://www.ssllabs.com/ssltest/analyze.html

Lugares para atualizar certificado
##################################

Interno
^^^^^^^
    
    - Nginx-interno
    - VMs utilizadas pelo awx (QAs e Goglobal 2019)


Produção
^^^^^^^^

    - Nginx services 1 e 2
    - Nginx monitoring
    - Nginx services (sera removido)
    - Load Balancer OCI
    - GoGlobals (uso awx)
    - Viasoft.Authentication
    - AWS Certificate Manager
    - frp (container OCI)

Detalhes
########

- Nginx:

    #. alterar cert-chain.crt

    #. Executar:

        .. code::

            nginx -s reload

- WinRm

    #. Importar ``cert.pfx``

    #. Executar em powershell administrador:

        .. code:: powershell

            $ipv4 = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress

            Remove-WSManInstance -ResourceUri winrm/config/Listener -SelectorSet @{
                Address   = "IP:$ipv4"
                Transport = 'https'
            }

            $dominio = "\*.korp.com.br"
            $certificate_thumb_print = Get-ChildItem -Path Cert:\LocalMachine\My | 
                Where-Object { $_.Subject -match "CN=$dominio" } | 
                Sort-Object -Property NotAfter -Descending | 
                Select-Object -First 1 | 
                Select-Object -ExpandProperty Thumbprint

            New-Item -Path WSMan:\localhost\Listener\ -Transport HTTPS  -CertificateThumbPrint "$certificate_thumb_print" -Port 50987 -Address IP:$ipv4 -Force

            Restart-Service WinRM

- AWS:

    #. Tela `List Certificates <https://us-east-1.console.aws.amazon.com/acm/home?region=us-east-1#/certificates/list>`_
    #. Encontrar o certificado atual
    #. Reimportar pelo botão Reimport
    #. Certificate chain é o cert-chain.crt (certificado + intermediate)

- Authentication:

    #. Alterar arquivo .pfx (gerar usando a mesma senha que está no KV no Viasoft.Authentication) em ambas as services

    #. Reiniciar serviço

    #. Executar no Redis:

    .. code:: 

        redis-cli -a <redis_auth_pass> --scan --pattern '*-ClientSecret' | xargs redis-cli -a <redis_auth_pass> DEL
