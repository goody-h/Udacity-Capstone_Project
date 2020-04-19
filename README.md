# Udacity Capstone Project

This is my final Udacity project. It provides the means of deploying a sample nginx application.

## Demo
Load Balancer public DNS: a96038234679a4ccd90d04c539201676-951865754.us-west-2.elb.amazonaws.com

## Setup
### Jenkins setup
- Install jenkins on a server
- Download the Blue Ocean and aws pipeline plugin
- Rolling deployment is implemented as per [this](./manifests/deployment.yml) manifest file

### Kubernetes setup
Provision AWS kubernetes cluster (eks) using cloudformation scripts
```
# Create network infrastructure first
./create.sh udacity network

# After network stack has been created provision eks cluster
./create.sh udacity eks
```

### Pipeline setup
The pipeline is setup using Blue Ocean and connected to the Github repository
- A [Jenkinsfile](./Jenkinsfile) describes the tasks in the pipeline
- A Linting stage checks for errors in the Dockerfile and html files
- A build stage builds the docker image and pushes to docker hub
- A deployment stage rolls out the deployment to aws kubernetes cluster

## Result

- The linting stage was tested to be functional: [Failing lint](results/Screenshot-01-failed-linting-stage.png) | [Successful lint](results/Screenshot-02-passed-linting-stage.png)
- Deployment to kubernetes was successful: [Successful Jenkins Deployment](results/Screenshot-03-successful-jenkins-deployment.png)
- Update rollout was captured using `kubectl describe deployments` on the terminal with screenshot provided: [Successful update rollout](results/Screenshot-04-successful-jenkins-rollout-update.png)