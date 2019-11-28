#!/bin/bash

# https://jenkins.io/doc/book/installing/#downloading-and-running-jenkins-in-docker
# -u root: Allow Jenkins to run as root to spawn docker containers to execute in your pipelines
# --rm: remove container
# -p 8080:8080: map local 8080 port (1st) to 8080 (2nd) in Jenkins container
# -v "$pwd/jenkins-data":/var/jenkins_home: Create a docker volume in the current subdirectory "jenkins-data" to persist the state of the /var/jenkins_home of the container
# -v /var/run/docker.sock:/var/run/docker.sock: Allows Jenkins to communicate to the (host) docker daemon to instantiate docker containers
# -v "$HOME":/home: map local home to jenkins home. TODO: not sure if that's needed/useful...
# --name jenkins-test: name the container for ease of use
# jenkinsci/blueocean: the docker image to use (will download if needed)
docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  -v "$(pwd)/jenkins-data":/var/jenkins_home \
  -v "$(pwd)/git":/home/ubuntu/git \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins-test \
  jenkinsci/blueocean
