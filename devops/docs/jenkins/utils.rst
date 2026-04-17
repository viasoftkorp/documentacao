Utlidades do jenkins
====================

Clone por ssh
-------------

Por padrão, as imagens usadas para as builds já vem com a chave a SSH configurada, caso esse não sejá o caso, o repositório pode ser clonado da seguinte forma:

.. code-block::

    withCredentials([string(credentialsId: 'GitFetcher_Private-ssh-key', variable: 'ssh-key')]) {
        sh """
            mkdir ~/.ssh/
            echo '${ssh-key}' > ~/.ssh/id_rsa
            chmod 600 ~/.ssh/*
        """
    }

    checkout([$class: 'GitSCM',
        branches: scm.branches,
        doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
        extensions: [[$class: 'CloneOption', timeout: 30, noTags: true, shallow: false, depth: 0, reference: '']],
        userRemoteConfigs: [[credentialsId:  'git-server',
                            url: "jenkins@git.korp.com.br:repos/${repoName}.git"]
        ]
    ])