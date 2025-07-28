pipeline {
  agent any


  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-creds').username
    AWS_SECRET_ACCESS_KEY = credentials('aws-creds').password
}

  stages {
    stage('checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/Rahul917797/terraform-Jenkins-EC2-Latest'
            }
         }

    stage('Terraform init') {
      steps {
        sh 'terraform init'
      }
    }  

    stage('Terraform validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform plan') {
      steps {
        sh 'terraform plan'
      }
   }


    stage('Terraform apply') {
      steps {
        sh 'terraform apply -auto-approve'
            }
        }
     }
  }
