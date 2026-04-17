Atualização de Repositórios Versionados com o ERP
=================================================

Acessando o Workflow
~~~~~~~~~~~~~~~~~~~~~~~

Para iniciar o processo, acesse o workflow **"Atualização de repositórios versionados com o ERP"** através do link:
`Atualização de repositórios versionados com o ERP <https://awx.korp.com.br/#/templates/job_template/330/details>`_

Iniciando a Execução
~~~~~~~~~~~~~~~~~~~~~~

* Clique no botão **Launch** para iniciar o processo de atualização
* No formulário exibido, insira a versão desejada para atualização dos repositórios

Especificação da Versão
~~~~~~~~~~~~~~~~~~~~~~~~~

A versão deve seguir estritamente o formato: ``AAAA.N.N.x``

Exemplo: ``2020.1.0.x``

.. note::
   Caso o formato esteja errado, o workflow falhará. Apesar de serem feitas diversas verificações, ainda é possível resultados como: "3033.3.2.x", portanto, cuidado ao declarar a versão.

Processamento e Verificação
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Após iniciar o workflow:

* O workflow identificará automaticamente todos os repositórios versionados que contêm o arquivo ``version.yaml``, cada repositório sem o arquivo ``version.yaml`` e cada repositório que não versionado.
* Cada repositório será atualizado para a versão especificada, caso o repositório esteja na mesma versão, nada acontecerá.