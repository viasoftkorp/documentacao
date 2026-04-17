Alteração de Jenkinsfile antiga para suporte de compose versionado
------------------------------------------------------------------

**Esse caso se aplica apenas para serviços com a versão de korp.sdk menor que v1.1.32 e que não podem ser atualizados**

Já que Jenkinsfiles de projetos com o korp.sdk em versões antigas não podem ser atualizadas para suportar o versionamento de compose,
algumas alterações manuais devem ser feitas para possibilitar as mudanças nos composes.

.. note:: 

    Como as antigas Jenkinsfile não seguiam um padrão bem definido, pode acontecer que apenas fazendo as alterações sugeridas nessa página não viabilize o suporte de composes versionados.
    Nesses caso, peça ajuda de um membro da equipe de DevOps para fazer as devidas alterações.



#. Confirme que as variáveis ``composeName`` e ``composeNameProd`` contém o mesmo valor.

    Esse é o nome do compose que a Jenkinsfile irá usar para subir o serviço, sendo ``composeName`` usado em development e ``composeNameProd`` em production.

#. Substitua a função ``publishProdImage()`` pela seguinte:

    .. code-block:: 

        def publishProdImage(String repoName, String branchName) {
            def (v1, v2, v3) = branchName.tokenize( '\\.' )
            def buildVersion = "${repoName}:${v1}.${v2}.x"

            sh(returnStdout: true, script: 'docker build --no-cache -t korp/' + buildVersion + ' .').trim()
            sh(returnStdout: true, script: 'docker push korp/' + buildVersion).trim()
        }

#. Substitua a função ``reloadService()`` pela seguinte:

    .. code-block::

        def reloadService(String ip, String password, String serviceName, String repoName, String composeName, String version) {
            def (v1, v2, v3) = version.tokenize( '\\.' )
            def publish_version = "${v1}.${v2}"
    
            def remote = [:]
            remote.name = 'portal'
            remote.host = ip
            remote.user = 'korp'
            remote.password = password
            remote.allowAnyHosts = true

            sshCommand remote: remote, command: "sh reload-service-image-tag.sh ${serviceName}-${publish_version} ${repoName}:${publish_version}.x ${composeName}"
        }

#. Alterar chamadas da função ``reloadService()``

    A função é chamada duas vezes, cada vez os parâmetros passados devem ser diferentes.

    * Dento de ``if ( "${env.BRANCH_NAME}" =~ /\d+\.\d+\.\d/ )`` a chamada da função deve ser:
    
        ``reloadService("${env.IP_PROCESS_PROD}", "${env.PASS_PORTAL_PROD}", "${composeServiceName}", "${repoName}", "${composeNameProd}", env.BRANCH_NAME)``

    - Dento de ``else if("${env.BRANCH_NAME}".startsWith('release'))`` a chamada da função deve ser:

        ``reloadService("${env.IP_PORTAL_DEV}", "korp!4518", "${composeServiceName}", "${repoName}", "${composeName}", BETA_VERSION)``
        
#. Dentro de ``if ( "${env.BRANCH_NAME}" =~ /\d+\.\d+\.\d/ )``, subistitua:

    ``withDockerRegistry([credentialsId: 'dockerhubbeta', url: ""]) {``
    
    por
    
    ``withDockerRegistry([credentialsId: 'dockerhub', url: ""]) {``
