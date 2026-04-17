Instalando certificado de emissão de NFe no Viasoft
---------------------------------------------------

Os certificados devem ser importados no mesmo local onde está instalado o serviço de emissão de notas fiscais.

Importação do certificado: 
###########################

#. Acessar a máquina  ``Services_PRD``.

#. MMC - Console de Gerenciamento Microsoft:

    - Adicionar usuário: ServNfeCliente no grupo: Administrators

#.  Conectar na Services_PRD com o usuário: ServNfeCliente.

#. Copiar os certificados para o diretório do cliente em:  ``C:\Viasoft\CLIENTE\Certificados``.

#. Painel de Controle - Manage user certificates - Personal - Certificates - Importar certificado.

		- Usuário atual.
		- Selecione o arquivo.
		- Insira a senha fornecida pelo cliente junto ao certificado.
		- Marque a opção 'Marcar esta chave como exportável'.
		- Marque a opção 'Selecionar automaticamente...'.
		- Concluir.


Configurando Número de Série 
#############################

Configurar o número de série certificado informado no sistema Viasoft.

#. Acessar a máquina  ``Services_PRD``.

#. Painel de controle - Internet Properties

        - Content - certificates.
        - Pesonal - Localize o certificado que foi importano no passo a passo anterior e clique em 'Exibir'.
        - Aba 'Detalhes', selecione o campo 'Número de Série' e o valor poderá ser copiado.


#. Acessar o Viasoft - Módulo Vendas.

    - Menu Empresas - Configurações - Documentos Fiscais Eletrônicos.
    - Clique-duplo no registro de configuração de Documentos - Aba NF-e
    - 'Certificado', informar o número de série do certificado instalado.
    - 'Senha', informar a senha ultilizada para a importação no passo 6.

    .. note::
        Esta configuração deverá ser feita em todas as empresas que ultilizarão este certificado.


#. Conecte na máquina ``Services_PRD`` com o usuário administrador e reinicie o serviço.

    -   'ViasoftIndustriaServidorNotasCLIENTE'.

#. Acessar o Viasoft - Módulo Vendas.

        - Menu Vendas/Clien. - NFe - Status do Serviço.
        - Será exibido a confirmação do status do serviço.

           .. image:: ./images/importando-certificado/1.JPG
               :width: 200


.. note::
    Remover o grupo Administrators do usuário:  ServNfeCliente após finalizar "Configurando Número de Série"


