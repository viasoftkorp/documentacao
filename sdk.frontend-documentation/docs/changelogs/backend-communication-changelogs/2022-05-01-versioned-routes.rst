Atualizar chamadas à serviços Golang/Delphi
===========================================

**Chamadas com versionamento estão vigentes a partir do dia 01/05/2022**

Os seguintes passos devem ser realizados para suportar chamadas versionadas à serviços **Golang/Delphi**.


Adicionar propriedade ao JSONs:
-------------------------------

	* appsettings.dev.json

	.. code-block:: json

		"appVersion": "development"

	* appsettings.json

	.. code-block:: json

		"appVersion": "!APP_VERSION"

Alteração de código:
--------------------

Adicionar código à ``app-consts.const.ts``, dentro da classe ``AppConsts`` 

	.. code-block:: js

		public static appVersion(): string {
			return environment['settings']['appVersion'];
		}

----

.. note::

	Para utilizar a versão nas chamadas http, chamar a função ``AppConsts.appVersion()``.
	Esta função retornará a versão atual do front, que deverá ser adicionada no início da rota da chamada http.

	Por exemplo:

	.. code-block:: js
		:caption: Rota Antiga
	
		const url = `https://gateway.korp.com.br/BFF/endpoint`

	.. code-block:: js
		:caption: Rota Nova

		const url = `https://gateway.korp.com.br/${AppConsts.appVersion()}/BFF/endpoint`
