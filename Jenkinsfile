pipeline{
    agent any
    environment{
        registryDockerHub = "beatrizhc317/devops-jenkins"
        registryDockerHubCredentials = "dockerhub"
        project = "devops-jenkins"
        projectVersion = "1.0"
        repositoryGit = "https://github.com/BHC317/CICD_EOI.git"
        repositoryGitCredentials = "github"
    }
    stages{
        stage('Clean workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout code'){
           step{
            script{
                git branch: 'main',
                    credentialsId: repositoryGitCredentials,
                    url: repositoryGit
            }
           } 
        }
        stage('Build'){
            steps{
                script{
                    dockerImage = docker.build registryDockerHub
                }
            }
        }
        stage('Test'){
          steps{
            script{
                try{
                     sh 'docker run --name $project $registryDockerHub'

                }finally{
                    sh 'docker rm $project'
                }
            }
          }  
        }
        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('', registryDockerHubCredentials){
                        dockerImage.push()
                    }
                }
            }
        }
    }
    post{
        failure{
            echo 'El pipeline ha fallado.'
        }
    }
}