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
	stage('Build image') {
            steps {
                sh ("docker build -f Dockerfile -t simple-java-maven-app .")
                sh ("docker tag simple-java-maven-app:latest namasumanth/simple-java-maven-app:latest")
            }
        }
    }
}
