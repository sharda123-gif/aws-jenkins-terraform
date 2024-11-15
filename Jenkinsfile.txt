pipeline {
    agent any
    
    environment {
        AWS_REGION = 'us-east-1'  // Specify the AWS region
    }

   // triggers {
    //pollSCM('* * * * *') 
//}

    stages {
        stage('create ec2 instance') {
            steps {
                script {
                    withCredentials([[
     $class: 'AmazonWebServicesCredentialsBinding',
      credentialsId: 'aws-jenkins-demo', 
      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
        dir('AWS-JENKINS-TERRAFORM')
                   {
                       sh 'terraform init'
                        sh 'terraform apply -auto-approve'

                        //sh 'aws ec2 describe-instances'
                    }
                }
            }
        }
    }
}
