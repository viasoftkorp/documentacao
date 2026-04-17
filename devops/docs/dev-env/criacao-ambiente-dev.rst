Criação de Ambiente de Desenvolvedor
------------------------------------

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
