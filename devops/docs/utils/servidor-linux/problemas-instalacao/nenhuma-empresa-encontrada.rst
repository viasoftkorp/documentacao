Nenhuma empresa encontrada
==========================

Rodar query nas bases do cliente:


.. code-block:: SQL

    SELECT IsDeleted, TenantId from EMPRESA

Caso não haja valor, ou esta nula, rodar o update:

.. code-block:: SQL

    UPDATE EMPRESA SET IsDeleted = 0, TenantId = <tenant_id>
