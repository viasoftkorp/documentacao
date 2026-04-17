Configuração de ambiente para consultor
=======================================


`Video explicando configurações para acesso ao portal local`_

#. Copiar .zip para ``C:\temp`` 

#. Descompactar o arquivo zip

#. Abrir ``cmd`` como administrador

#. Executar:

    .. code-block:: powershell

        certutil.exe -addstore root C:\temp\ca-cert.crt


#. Editar ``C:\Windows\System32\drivers\etc\hosts`` com o notepad++, adicionando

    .. code-block:: 

        <ip-servidor-linux> korp.local
        <ip-servidor-linux> korp-api.local
        <ip-servidor-linux> korp-cdn.local

#. Reiniciar navegador

#. Acessar https://korp.local


.. _video explicando configurações para acesso ao portal local: https://web.microsoftstream.com/video/e371c169-540f-490c-8d3f-11ef297876a5