GO-Global
---------

----

Configuração do GO-Global
===================================

Este documento descreve o procedimento para criação de usuários e configuração de acesso ao **GO-Global 2019**.

Siga os passos abaixo para realizar a configuração.

1. **Criação de usuário no GO-Global (Windows)**

Servidor: **GoGlobal2019**  
IP: **192.168.1.49**

* Acesse o servidor **GoGlobal2019**.
* Abra o **MMC**.
* Navegue até **Usuários** → **Novo Usuário**.
* Preencha os campos:

  - ``Nome de usuário: nome.sobrenome``
  - ``Nome completo: nome.sobrenome``
  - ``Senha: 123qwe@``

* Ajuste as opções de senha:

  **Desmarcar:**

  - ``O usuário deve alterar a senha no próximo logon``

  **Marcar:**

  - ``O usuário não pode alterar a senha``
  - ``A senha nunca expira``

2. **Criação da pasta do usuário**


* Copie a pasta de um usuário existente (exemplo: **DEV**).
* Renomeie a pasta para ``nome.sobrenome``.

3. **Ajuste do arquivo ``config.json``**


* Dentro da pasta do usuário, edite o arquivo ``config.json`` e altere os campos abaixo:

  - ``ConnectionName: nome-sobrenome_BASE_ERP``
  - ``DatabaseName: nome-sobrenome_BASE_ERP``
  - ``GatewayIp: nome-sobrenome.com``

* Salve o arquivo após realizar as alterações.

4. **Conexão no ERP**


* Realize o login no ERP utilizando o usuário **ADMIN**.
* Valide o acesso à base configurada.

5. **Permissões de pasta**


* Conceda ao usuário ``nome.sobrenome`` permissão total sobre a pasta criada.

6. **Criação do atalho GO-Global (Windows)**

* No servidor **GoGlobal2019**, acesse:

  - **GO-Global Admin Console**
  - **GoGlobalRelay** → **Applications** → **Add…**

* Configure os campos:

  - **Location**
  - **Name**
  - **Start Directory**



