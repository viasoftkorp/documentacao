Atualização de Versão do ERP
----------------------------

**Informações dos Servidores**

* Servidor Go-Global:

  * G07: goglobal-07.korp.com.br

  * G08: goglobal-08.korp.com.br

  * G09: goglobal-09.korp.com.br

  * G10: goglobal-10.korp.com.br

  * G11: goglobal-11.korp.com.br

  * G12: goglobal-12.korp.com.br

* AWX

  * https://awx.korp.com.br/#/home

----

**AWX**

* Acessar AWX:

  * Realize login com seu usuário
   
  * Executar Workflow de Atualização
  
    * Localize o workflow: Atualização versão de Major do ERP GoGlobal

  * Configurar a Execução

    * Ambientes: 
      
      Selecione os ambientes que serão atualizados

    * Versão:
    
      Versão que será instalada. (Exemplo: 2023.3.0)

    * Desonectar usuários conectados: 
    
      Selecionar: ``SIM``
  
  * Executar Atualização

    * Confirme as informações

    * Clique em Launch

    * Aguarde a execução completa do workflow

    * Monitore logs para garantir que não houve falhas

* Validação da Atualização

  * Acessar os servidores Go-Global atualizados

  * Acesse o diretório: C:\Korp\ERP\Clientes

  * Testar acesso ao ERP

    * Conecte utilizando um usuário Master
    

