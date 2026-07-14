pipeline {
    agent {
        node { label "AGENT-1" }
    } 

    options{
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    // this is build section 
    stages {
        stage("Build") {
            steps {
                sh "echo 'Build stage'"
            }
        }
        stage("Test") {
            steps {
                sh "echo 'Test stage'"
            }
        }
        stage("Deploy"){
            steps{
                sh "echo 'Deploy stage'"
            }
        }
    }
    post {
        always{
            sh "echo 'this will be run always'"
            cleanWs()
        }
    }
}