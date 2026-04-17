Ambiente de Desenvolvedor
------------------------------------

----

Criação de Ambiente de Desenvolvedor
====================================

.. note::
    * É possível executar novamente o workflow para o **mesmo e-mail** em caso de falhas.
    * As etapas já concluidas não serão afetadas e as restantes executadas.

Informações
============

.. note::
    O workflow irá:

    * Criar conta Office365 com email informado.
    * Criar usuário no Portal - ``nome.sobrenome``
    * Criar vm no proxmox com nome ``dev-nome.sobrenome`` e ``mac`` fornecido na configuração manual.
    * Anviar arquivos de estado e registro de novo host gerados para o repositório git - ``viasoftkorp/iac``
    * Executar o setup de desenvolvedor (opcional)

.. warning::
    O **e-mail** do colaborador será a base para toda lógica de informações/gerenciamento do ambiente.
    
    Será usado para criar **dns**, **nome da vm**, **diretório para armazenamento de estado** e outras informações da role.

Configuração de Rede (Manual)
==============================

.. important::
    A configuração de rede deve ser realizada **manualmente** antes de executar o workflow de criação do ambiente.

Siga os passos abaixo para configurar a rede:

1. **Busca de IP**
   
   * Encontre um IP livre no range ``192.168.1.50`` a ``192.168.1.99``.
   * Verifique se o IP está disponível antes de prosseguir.

2. **Geração de MAC**
   
   * Gere um endereço MAC aleatório que **DEVE** começar com o prefixo ``a2`` e ser gerado em **minúsculo**.
   * Formato: ``a2:00:00:00:00:00`` (exemplo: ``a2:b4:c6:d8:e0:f2``).
   * Ferramenta de auxílio: https://dnschecker.org/mac-address-generator.php

3. **Criação de DNS**
   
   * Criar os DNS com base no e-mail do colaborador:
     
     - ``nome-sobrenome.com``
     - ``nome-sobrenome-api.com``
     - ``nome-sobrenome-cdn.com``

4. **Fixação de IP/MAC**
   
   * Configure o IP livre encontrado para ser fixo com o MAC gerado.
   * Anote o endereço MAC gerado, pois será necessário para os próximos passos.

5. **Acesso VPN**
   
   * Crie o acesso VPN no formato ``nome.sobrenome``.

.. note::
    **Importante:** Anote o endereço MAC gerado durante o processo, pois ele será necessário para a configuração da VM no Proxmox.

Criando ambiente pelo workflow
==============================

Workflow: **Criação de ambiente de desenvolvedor**
  
* Informe o e-mail do colaborador: ``nome.sobrenome@korp.com.br``
* Endereço MAC gerado (formato: ``a2:00:00:00:00:00``)
* Quantidade memória ram ``GB``
* Quantidade cores
* Storage que será usado para montar o volume (``NVME01`` / ``NVME02``)
* Tamanho do volume em ``GB``
* Deseja executar o setup do desenvolvedor (``Sim`` / ``Não``)

  * Caso ``Sim``: É obrigatório os campos: ``Versão`` e ``Ip Windowns``.
  * Caso ``Não``: Será criada apenas a máquina e suas configurações de rede, não é necessário informar ``Versão``, ``Apps`` ou ``Ip Windowns``.

.. note::
    A execução do playbook pode levar alguns minutos, podemos acompanhar os logs e ver eventuais erros; 
    
    Na etapa de execução de playbook já é possível estabelecer uma conexão na máquina provisionada.

* Logs de execução do playbook: ``/home/korp/setup_dev.log``
  
  * Ver/acompanhar logs: ``cat /home/korp/setup_dev.log`` ou ``tail -f /home/korp/setup_dev.log``

----

Remoção de Ambiente de Desenvolvedor
====================================

.. note::
    * É possível executar novamente o workflow para o **mesmo e-mail** em caso de falhas.
    * As etapadas já concluidas não serão afetadas e as restantes executadas.
    * Caso o ``ip`` já tenha sido removido ele aparecerá como ``'None'`` nas mensagens de remoção.

.. warning::
    Para remoção o **e-mail é a chave principal**, todo estado criado é associado ao e-mail pelo workflow de Criação de ambiente de desenvolvedor.

Etapas Remoção 
==============

1. **Será validada as informações:**

* E-mail do colaborador: ``nome.sobrenome@korp.com.br``
* Deseja executar o setup do desenvolvedor (``Sim`` / ``Não``)

  * Caso ``Sim``: É obrigatório informar o ``Ip Windowns``, será executado full reset e destruida a vm associada ao e-mail.
  * Caso ``Não``: O full reset não será executado e a vm associada ao e-mail será destruida.

.. warning::
    Será exibida uma mensagem para **confirmação**:

    "Será destruida a vm ``dev-nome.sobrenome``, dns: [ ``nome-sobrenome.com``, ``nome-sobrenome-api.com``, ``nome-sobrenome-cdn.com`` ] e liberado o ip: ``192.168.x.xx`` ou ``'None``"

2. **Após Aprovação**

.. note::
    O workflow irá:
    
   * Executar o playbook do desenvolvedor com a opção **full reset** , caso ``Sim``, caso contrario não será executado.
   * Será removido o ``ip`` alocado para vm **associado ao e-mail**.
   * Será removido os ``dns`` **associado ao e-mail**.
   * Desabilitar o acesso a VPN (existe opção remover).
   * Remover a conta Office 365 **associada ao e-mail**.
   * Remover o acesso ao bitbucket **associado ao e-mail**.
   * Será destruida a vm no proxmox **associado ao e-mail**.
   * Será enviada as alterações para o repositório de gerenciamento de estado das vms.

Etapas que devem ser feitas manuais
===================================

* remover licença jetbrains

----