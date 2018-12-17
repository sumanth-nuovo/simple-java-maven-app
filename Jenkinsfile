pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
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
	stage('Docker build') {
            steps {
                sh 'docker build -t simple-java-maven-app .'
                sh 'docker tag simple-java-maven-app:latest namasumanth/simple-java-maven-app:latest'
            }
        }
    }
}
