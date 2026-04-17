Gerenciamento de Acesso para Colaborador
=========================================

Visão Geral
-----------

Esses workflows são responsáveis por automatizar o processo de criação e remoção de acessos para colaboradores em três plataformas principais:

    - **Office 365**: Criação de contas de email corporativo
    - **Portal Korp**: Criação de usuários no portal interno
    - **Bitbucket**: Concessão de acesso aos repositórios de código

Criação de Acesso para Colaborador
-----------------------------------

.. note::
    * É possível executar novamente o workflow para o **mesmo e-mail** em caso de falhas.
    * As etapas já concluídas não serão afetadas e as restantes executadas.

Informações
^^^^^^^^^^^

.. note::
    O workflow irá:

    * Criar conta Office 365 com email informado e aplicar licença "Microsoft 365 Business Basic".
    * Criar usuário no Portal Korp com login ``nome.sobrenome`` e permissões básicas.
    * Enviar convite para acesso ao Bitbucket (opcional) no workspace ``viasoft-korp``.
    * Enviar credenciais por email para administradores (Office 365) e para o colaborador (Portal).

.. warning::
    O **e-mail** do colaborador será a base para toda lógica de criação de contas.
    
    Será usado para criar **login**, **identificação única** e outras informações necessárias para os sistemas.

Pré-requisitos
^^^^^^^^^^^^^^

.. important::
    Antes de executar o workflow, certifique-se de que:

* O email do colaborador segue o padrão ``nome.sobrenome@korp.com.br``
* Há licenças Office 365 disponíveis no tenant

Criando acesso pelo workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Para criar o acesso de um novo colaborador, execute o workflow **Configuração de Novo Colaborador** no AWX.

**Parâmetros Obrigatórios**

* **Nome completo**: Informe o nome completo para conta Office 365 (formato: ``Nome Sobrenome Sobrenome``)
* **Email do colaborador**: Informe o email no formato ``nome.sobrenome@korp.com.br``
* **Acesso ao Bitbucket**: Selecione ``Sim`` ou ``Não`` conforme necessário

**Parâmetros Condicionais**

* **Grupo do Bitbucket**: Obrigatório apenas se "Acesso ao Bitbucket" = ``Sim``
  
  - ``qualidade``: Para equipe de QA e testes
  - ``developers``: Para desenvolvedores

.. warning::
    Não execute o workflow múltiplas vezes simultaneamente para o mesmo colaborador, pois isso pode causar conflitos.

Remoção de Acesso de Colaborador
---------------------------------

.. note::
    * É possível executar novamente o workflow para o **mesmo e-mail** em caso de falhas.
    * As etapas já concluídas não serão afetadas e as restantes executadas.

Informações
^^^^^^^^^^^

.. note::
    O workflow irá:

    * Remover todas as licenças associadas ao usuário no Office 365.
    * Remover completamente a conta do usuário no Office 365.
    * Remover o usuário do Portal Korp.
    * Remover acesso aos repositórios do Bitbucket.

.. warning::
    A **remoção é irreversível**. Certifique-se de que:
    
    * O colaborador não precisa mais de acesso aos sistemas
    * Todos os dados importantes foram salvos/transferidos
    * A remoção foi aprovada pelos responsáveis

Pré-requisitos
^^^^^^^^^^^^^^

.. important::
    Antes de executar o workflow, certifique-se de que:

* O email do colaborador está correto e existe nos sistemas
* A remoção foi devidamente autorizada
* Dados importantes foram salvos ou transferidos
* Não há processos críticos dependendo do usuário

Removendo acesso pelo workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Para remover o acesso de um colaborador, execute o workflow **Remoção de Colaborador** no AWX.

**Parâmetros Obrigatórios**

* **Nome completo**: Nome completo do colaborador (para confirmação)
* **Email do colaborador**: Email no formato ``nome.sobrenome@korp.com.br``
* **Remoção do Bitbucket**: Selecione ``Sim`` ou ``Não`` para remover acesso ao Bitbucket

.. warning::
    **A remoção é irreversível**. Não é possível recuperar:
    
    * Emails e dados do Office 365
    * Configurações personalizadas do Portal
    * Histórico de atividades no Bitbucket