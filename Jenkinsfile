pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
	stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    stage('Docker version') {
                steps {
                    sh 'echo "sumanth" | sudo -S -k docker version'
                }
            }
	stage('Build image') {
            steps {
                sh 'echo "sumanth" | sudo -S -k docker build -f Dockerfile -t simple-java-maven-app .'
                sh 'echo "sumanth" | sudo -S -k docker tag simple-java-maven-app:latest namasumanth/simple-java-maven-app:latest'
                sh 'echo "sumanth" | sudo -S -k docker push namasumanth/simple-java-maven-app:latest'
            }
        }
    }
}
