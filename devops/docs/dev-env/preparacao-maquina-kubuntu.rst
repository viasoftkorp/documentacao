Preparação Maquinas Kubuntu
----------------------

Configuração de Ambiente de Desenvolvimento
===========================================

Este documento descreve a instalação e configuração das principais ferramentas
utilizadas no ambiente de desenvolvimento em **KUBUNTU**.

1. **Instalação do Microsoft Teams**

* O **Microsoft Teams** está disponível diretamente na loja **Discover**.
* Basta abrir o Discover, pesquisar por **Teams** e realizar a instalação.

2. **Instalação do .NET SDK**

Execute os comandos abaixo para instalar o **.NET SDK 6.0**:

::

  wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
  curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
  chmod +x ./dotnet-install.sh
  ./dotnet-install.sh --channel 6.0

Configure as variáveis de ambiente:

::

  echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/.dotnet/:$HOME/.dotnet/tools/' >> ~/.bashrc
  source ~/.bashrc

Valide a instalação:

::

  dotnet --version

Instale a ferramenta Entity Framework:

::

  dotnet tool install --global dotnet-ef

3. **IDE Rider**

* A loja **Discover** disponibiliza o Rider na versão **2025.2**.
* Caso sua licença seja **2023.2**, é necessário:

  - Desinstalar o Rider pela loja Discover
  - Baixar a versão correta em:
    https://www.jetbrains.com/rider/download/other.html#

Instalação manual do Rider:

* Extraia o arquivo ``.tar.gz``.
* Execute os comandos:

::

  sudo mv JetBrains\ Rider-* /opt/rider
  cd /opt/rider/bin
  ./rider.sh

Adicione o Rider ao PATH:

::

  echo 'export PATH="/opt/rider/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc

Criação do atalho (1 único comando):

::

  cat > ~/.local/share/applications/rider.desktop << EOF
  [Desktop Entry]
  Version=1.0
  Type=Application
  Name=Rider
  Icon=/opt/rider/bin/rider.png
  Exec=/opt/rider/bin/rider.sh
  Comment=.NET IDE
  Categories=Development;IDE;
  Terminal=false
  EOF

4. **NVM e Node.js (Frontend)**

Instalação do **NVM**:

::

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  source ~/.bashrc

Instalação do Node.js:

::

  nvm install 20.12.2

5. **Golang**

Instalação do Golang:

* Siga a documentação oficial:
  https://go.dev/doc/install

Configuração para projetos da **Korp**:

::

  go env -w GOPRIVATE=bitbucket.org/viasoftkorp/

Ajuste de resolução DNS:

* Edite o arquivo:

::

  vim /etc/nsswitch.conf

* Localize a linha:

::

  hosts: files mdns4_minimal dns

* Altere para:

::

  hosts: files dns mdns4_minimal

Reinicie o serviço:

::

  systemctl restart systemd-resolved

6. **IDE GoLand**

* A versão **GoLand 2023.2** deve ser baixada em:
  https://www.jetbrains.com/pt-br/go/download/other.html

Instalação:

* Extraia o arquivo ``.tar.gz``.
* Execute:

::

  sudo mv GoLand-* /opt/goland
  cd /opt/goland/bin
  ./goland.sh

Adicione ao PATH:

::

  echo 'export PATH="/opt/goland/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc

Criação do atalho (1 único comando):

::

  cat > ~/.local/share/applications/goland.desktop << EOF
  [Desktop Entry]
  Version=1.0
  Type=Application
  Name=GoLand
  Icon=/opt/goland/bin/goland.png
  Exec=/opt/goland/bin/goland.sh
  Comment=Go IDE
  Categories=Development;IDE;
  Terminal=false
  EOF

7. **Desativar IPv6**

Execute os comandos abaixo:

::

  sudo tee -a /etc/sysctl.conf > /dev/null <<EOF
  net.ipv6.conf.all.disable_ipv6 = 1
  net.ipv6.conf.default.disable_ipv6 = 1
  net.ipv6.conf.lo.disable_ipv6 = 1
  EOF

Aplique as alterações:

::

  sudo sysctl -p

8. **Configuração de Variáveis de Ambiente (Dev-Env)**

Configure as variáveis utilizadas no ambiente de desenvolvimento:

::

  tee -a ~/.profile > /dev/null <<EOF
  export URL_CDN="https://seunome-cdn.com"
  export URL_CONSUL="http://seunome.com:8500"
  export URL_GATEWAY="https://seunome-api.com"
  export URL_LOADER="https://seunome.com"
  EOF

9. **Importação de Certificados**

Caso seja necessário importar certificados:

* Abra o Google Chrome
* Acesse:

  ::

    chrome://certificate-manager/

* Vá em **Instalados por você**
* Selecione **Certificados Confiáveis**
* Clique em **Importar**

10. **Instalação do navegador Opera**

* Instalador disponível em:

  - ``\\192.168.1.10\Geral\KUBUNTU\Opera``

* Comando de instalação:

  ::

    sudo dpkg -i /home/korp/Downloads/opera-stable_125.0.5729.49_amd64.deb

11. **Limitações Conhecidas**

* **SQL Server Management Studio** é exclusivo para Windows.
  - Alternativa: **DBeaver**, disponível na loja Discover
  - Conecta em SQL Server, PostgreSQL, entre outros
  - Não possui **Profiler**

* Para acesso remoto a máquinas Windows:
  - Alternativa ao RDP: **Remmina**
  - Disponível na loja Discover


Acesso ao ERP - GO-Global
==============================

1. Acesse o navegador Opera e informe o endereço:

   - http://192.168.1.49:491/

2. Na tela inicial, selecione **“Execute aplicativos em seu navegador”**.
3. Informe as credenciais de acesso:

   - ``Usuário: nome.sobrenome``
   - ``Senha: 123qwe@``

4. Após o login, escolha a base desejada para acesso ao sistema.
