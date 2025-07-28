pipeline {
  agent any

  stages {
    stage('checkout-code') {
      steps {
        git branch: 'main', url: 'https://github.com/Rahul917797/terraform-Jenkins-EC2-Latest'
            }
         }

    stage('Terraform Deploy') {
      steps {
        withCredentials([
          [$class: 'AmazonServicesCredentialsBinding', credentialsId: 'aws-creds']
        ]) {
         sh 'terraform init'
         sh 'terraform validate'
         sh 'terraform plan'
         sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
        
        
