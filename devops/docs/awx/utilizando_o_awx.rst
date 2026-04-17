Utilizando o AWX
================

Acessando o AWX
---------------

O acesso ao AWX pode ser feito pelo endereço https://awx.korp.com.br/

O usuário será o início do email do colaborador.

    Ex: ``nome.colaborador@korp.com.br`` terá o usuário ``nome.colaborador``

Executando Templates
--------------------

Toda tarefa que será executada pelo AWX é um template, quando um template é executado, ele cria um **job**.

O Job é a tarefa que será executada, e contem um ID único, o nome de quem iniciou executou o template, o horário, entre outras informações.

#. Para executar um Template, clique em ``Templates``

#. Am seguida clique em cima do template que vocês deseja executar

    .. image:: ./images/templates.png
        :width: 600


#. Clique em ``Launch``

    .. image:: ./images/exec_template.png
        :width: 600

#. Alguns templates campos que necessitam ser preenchidos antes de executados, outros não.

    .. image:: ./images/launching_template.png
        :width: 600

#. Uma vez que um job foi executado, ele pode ser visualizado na aba ``Jobs``

    .. image:: ./images/jobs_list.png
        :width: 600

    .. note::

        Cada job tem um ID diferente, mas seus nomes são os mesmos dos templates que criaram eles, por isso garanta que vocês está selecionando o job certo

---

.. note::

    Alguns templates precisam ser aprovados antes de iniciarem, para isso:
    
    Abra a tarefa de aprovação (clicando nela) e compartilhe o link (1) com alguém que tenha a autorização de aprovação.

    .. image:: ./images/permissao_dbreader_4_aprovacao.png
        :width: 600

.. note::

    Para aprovar o templates, verifique as variáveis utilizadas no campo ``Variables`` e clique em ``Approve``.

    .. image:: ./images/permissao_dbreader_5_iconevar.png
        :width: 600
