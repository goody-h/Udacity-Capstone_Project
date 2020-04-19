pipeline {
	agent any
	stages {
		stage('Lint HTML and Docker') {
			steps {
				sh 'tidy -q -e ./app/*.html'
				sh 'hadolint Dockerfile'
			}
		}

		stage('Upload docker Image') {
			steps {
				sh 'docker build . --tag=goodhopeordu/capstoneproject:v1'
				withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'username', passwordVariable: 'password')]) {
					sh 'docker login -u $username -p $password'
				}
				sh 'docker push goodhopeordu/capstoneproject:v1'
			}
		}

		stage('deploy to AWS kubernetes') {
			steps {
				withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
					sh 'aws eks --region=us-west-2 update-kubeconfig --name udacity-eks'
					sh 'kubectl apply -f manifests/deployment.yml,manifests/service.yml'
				}
			}
		}
	}
}