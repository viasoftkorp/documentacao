Certificado
-----------

Disponibilizando a CA nas estações de trabalho
==============================================

----

**On Premises**

O certificado deverá ser instalado em todas as estações de trabalho, ou seja, computadores que acessão o Korp ERP e korp WEB.

O certificado da CA pode ser obtido copiando o arquivo ``ca-cert.crt`` que está disponível na ``home`` do usuário que foi disponibilizado para instalação no servidor Linux.

Há duas opções disponíveis para a importação da CA:

 - O cliente tem AD e disponibiliza a CA via política
 
 - O cliente importa manualmente em cada estação de trabalho a CA via o comando ``certutil.exe -addstore root C:\temp\ca-cert.crt``

.. note:: 
  
  Após importar a CA, é necessário fechar completamente o navegador e recarregar a página caso a mesma abra sozinha novamente.

----

**Ambiente da Qualidade**

1. Arquivos disponível em:

  - ``\\192.168.1.10\Geral\CERTIFICADO\Qualidade``

2. Criar a pasta de destino
	- Acesse C:\
	- Se não existir, crie a pasta:
		C:\temp
	- Copie todos os arquivos .crt para dentro desta pasta.

3. Abrir o Prompt como Administrador
	- Clique no menu Iniciar
	- Digite cmd
	- Clique com o botão direito em Prompt de Comando
	- Selecione Executar como administrador

4. Instalar os certificados
	No Prompt aberto como Administrador, execute os comandos um por vez:
		certutil.exe -addstore root C:\temp\qa-hmlg-ca-cert.crt
		certutil.exe -addstore root C:\temp\qa-prd-ca-cert.crt
		certutil.exe -addstore root C:\temp\qa-dev-ca-cert.crt
		certutil.exe -addstore root C:\temp\sd-prd-ca-cert.crt

----

**Kubuntu**

1.  Abra o Google Chrome

2.  Acesse:

  ::

    chrome://certificate-manager/

3. Vá em **Instalados por você**

4. Selecione **Certificados Confiáveis**

5. Clique em **Importar**