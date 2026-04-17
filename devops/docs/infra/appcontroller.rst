Comando AppControler para Go-Global
-----------------------------------

----

**ERP** 		

1. Acesso ERP Clientes Nuvem

  - ``"C:\Program Files (x86)\GraphOn\AppController\AppController.exe" -h erpcloud.korp.com.br -c -u EMPRESA_01 -p SENHA123``


2. Inicia direto o Korp com a base escolhida **-ac all**

  - ``"C:\Program Files (x86)\GraphOn\AppController\AppController.exe" -h erpcloud.korp.com.br -c -u EMPRESA_01 -p SENHA123 -a BASE_PRD``

----

**Movimentação de tela**

Problema na movimentação de tela **ERP**.

1. **dfw 0**

  - ``"C:\Program Files (x86)\GraphOn\AppController\AppController.exe" -h erpcloud.korp.com.br -c -dfw 0 -u EMPRESA_01 -p SENHA123``


2. **dfw 1**

  - ``"C:\Program Files (x86)\GraphOn\AppController\AppController.exe" -h erpcloud.korp.com.br -c -dfw 1 -u EMPRESA_01 -p SENHA123``
	
----

**Impressoras**

Força a identifica impressora compartilhadas em Rede **-ac all**

  - ``"C:\Program Files (x86)\GraphOn\AppController\AppController.exe" -h erpcloud.korp.com.br -c -u EMPRESA_01 -p SENHA123 -ac all``

----