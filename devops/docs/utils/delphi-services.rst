Serviços delphi-services
========================

Criação de novo serviço
-----------------------

Quando um novo serviço delphi é criado, ele precisa ser referenciado nos seguintes arquivos:

- `awx <https://github.com/viasoftkorp/awx/blob/master/roles/delphi_services_operations/vars/main.yaml>`_
- `KorpSetupLinux <https://github.com/viasoftkorp/KorpSetupLinux/blob/master/roles/infrastructure-desktop/vars/main.yml>`_
- `infrastructure-setup-dev <https://github.com/viasoftkorp/infrastructure-setup-dev/blob/master/roles/infrastructure-desktop/vars/main.yml>`_
- `erp <https://bitbucket.org/viasoftkorp/erp/src/develop/Servicos.Jenkinsfile>`_
- `korpsetup <https://bitbucket.org/viasoftkorp/korpsetup/src/master/delphi_services/services.py>`_

Deploy
------

Quando um novo serviço foi adicionado é necessário fazer deploy dele na nuvem:

#. Edite `InsertKorpServicesOauth <https://bitbucket.org/viasoftkorp/tools/src/bb8b9653d52e49b5bafc98cc10c77c6bd7750017/Utils/InsertKorpServicesOauth.py>`_ alterando o `SERVICE_NAME` pelo nome do seu serviço

#. Execute o script

Esse script irá:
    
    - Inserir uma KV no consul de produção

    - Imprimir uma query de inserção de client oauth

- Execute a query printada pelo script no SQL Server de produção
