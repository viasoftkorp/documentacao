Postgre SQL
===========

Criação de usuário
------------------

Usuário com permissão "SELECT" em "schema"
``````````````````````````````````````````

Executar query no DataBase desejado.

Query::

	CREATE USER "<company>.<user>" WITH ENCRYPTED PASSWORD '<password>';
	GRANT USAGE ON SCHEMA "<schema>" TO "<company>.<user>";
	GRANT SELECT ON ALL TABLES IN SCHEMA "<schema>" TO "<company>.<user>";

Parâmetros da query:

	``<company>`` = Empresa

	``<user>`` = nome do usuário

	.. warning:: 

		Como padrão todos os usuários devem seguir o padrão ``<company>.<user>``
		
		Ex::

			viasoft.bi
			korp.usuario

	``<password>`` = senha gerada aleatoriamente para cada role

	``<schema>`` = schema em que terá permissão.

.. note::

	Caso o usuário deva ter permissão em mais de um DataBase, a query deve ser executada em todos os DBs, removendo a primeira linha(``CREATE USER``)

