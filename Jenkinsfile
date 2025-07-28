pipeline {
  agent any

  options {
    skipDefaultCheckout()  // Avoid auto checkout, to control checkout explicitly
  }

  stages {
    stage('Checkout Code') {
      steps {
        // Add credentialsId only if repo is private
        git branch: 'main', url: 'https://github.com/Rahul917797/terraform-Jenkins-EC2-Latest', credentialsId: 'github-creds'
      }
    }

    stage('Terraform Deploy') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-creds'
        ]]) {
          sh 'terraform init -input=false -migrate-state'
          sh 'terraform validate'
          sh 'terraform plan -out=tfplan'
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }
  }
}
