Atualização Serviços Nuvem Fiscal
---------------------------------

**Informações do Servidor**

* Servidor: Services_PRD 144.22.132.196

* Todos os procedimentos abaixo serão feitos neste servidor.

----

**Atualização do Emissor NFe**

* Acessar a pasta do serviço:
   
  ``C:\Korp\REST\Faturamento\NotaFiscal\NFe``

* Verificar a versão atual do executável:

  * Clique com o botão direito em EmissorNFeServer.exe
      
  * Selecione Properties → Details → File version

* Renomear o executável atual:

  ``EmissorNFeServer.exe → EmissorNFeServer.VERSAO.old``

* Copiar o novo executável enviado na tarefa para a pasta acima.

* Reiniciar o serviço:

  * Nome do serviço: Nuvem Fiscal - Emissor NFe

* Verificar logs após reinício:

  ``C:\Korp\REST\Faturamento\NotaFiscal\NFe\Log\Log\EmissorNFeServer_VERSAO.log``

----

**Atualização do Emissor NFSe**

* Acessar a pasta do serviço:

  ``C:\Korp\REST\Faturamento\NotaFiscal\NFSe``

* Verificar a versão atual do executável:

  * Clique com o botão direito em EmissorNFSeServer.exe

  * Properties → Details → File version

* Renomear o executável atual:

  ``EmissorNFSeServer.exe → EmissorNFSeServer.VERSAO.old``

* Copiar o novo executável enviado na tarefa para a pasta acima.

* Reiniciar o serviço:

  * Nome do serviço: Nuvem Fiscal - Emissor NFSe

* Verificar logs após reinício:

  ``C:\Korp\REST\Faturamento\NotaFiscal\NFSe\Log\EmissorNFSeServer_VERSAO.log``

----

**Atualização do GeradorCnabAcbr**

* Acessar a pasta do serviço:

  ``C:\Korp\REST\Financeiro\CnabAcbr``

* Verificar a versão atual do executável:

  * Clique com o botão direito em GeradorCnabAcbrServer.exe

  * Properties → Details → File version

* Renomear o executável atual:

  ``GeradorCnabAcbrServer.exe → GeradorCnabAcbrServer.VERSAO.old``

* Copiar o novo executável enviado na tarefa para a pasta acima.

* Reiniciar o serviço:

  * Nome do serviço: Nuvem Fiscal - GeradorCnabAcbr

* Verificar logs após reinício:

  ``C:\Korp\REST\Financeiro\CnabAcbr\Log\GeradorCnabAcbrServer_VERSAO.log``
