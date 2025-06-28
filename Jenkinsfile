pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }


         stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sunnnyyk/terraform-k8s.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('php') {
                    sh 'terraform init'
                }
            }
        }

        stage('Validation & Security Scanning') {
            parallel {
                stage('Terraform Validate') {
                    steps {
                        dir('php') {
                            sh 'terraform validate'
                        }
                    }
                }

                stage('Credential Scanning') {
                    steps {
                        script {
                            try {
                                sh 'gitleaks detect --no-git -v'
                            } catch (e) {
                                echo "Gitleaks scan failed: ${e.getMessage()}"
                            }
                        }
                    }
                }

                stage('Static Code Analysis (TFLint)') {
                    steps {
                        dir('php') {
                            script {
                                try {
                                    sh 'tflint --format json > tflint_report.json'
                                } catch (e) {
                                    echo "TFLint failed: ${e.getMessage()}"
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('php') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply / Destroy') {
            steps {
                dir('php') {
                    script {
                        def USER_INPUT = input(
                            message: 'Please select the required input',
                            parameters: [
                                [$class: 'ChoiceParameterDefinition',
                                 choices: ['Nothing', 'Apply', 'Destroy'].join('\n'),
                                 name: 'input',
                                 description: 'Menu - select box option']
                            ]
                        )

                        echo "The answer is: ${USER_INPUT}"

                        if (USER_INPUT == 'Apply') {
                            sh 'terraform apply -auto-approve'
                        } else if (USER_INPUT == 'Destroy') {
                            sh 'terraform destroy -auto-approve'
                        } else {
                            echo 'No action selected.'
                        }
                    }
                }
            }
        }
    }
