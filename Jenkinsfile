pipeline {
    agent any
    stages {
        stage('Stage1: Git Clone') {
            steps {
                git url: "https://github.com/Vishal1017597145/wisecow.git", branch: "main"
            }
        }
        stage('Stage2: dockerfile creation') {
            steps {
                sh "docker build -t vishal1017/wisecow:latest ."
            }
        }
        stage('Stage3: Push to dockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh"docker login -u vishal1017 -p ${dockerhubpwd}"
                }
                sh "docker push vishal1017/wisecow:latest"
            }
        }
        stage('Stage5: deployment creation') {
            steps {
                sh "kubectl --kubeconfig=/root/.kube/config apply -f wisecow-deployment.yml"
            }
        }
        stage('Stage6: Service creation') {
            steps {
                sh "kubectl --kubeconfig=/root/.kube/config apply -f wisecow-service.yml"
            }
        }
        stage('Stage7: return the output on console') {
            steps {
                sh "curl -I 192.168.49.2:30000"
            }
        }
    }
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
