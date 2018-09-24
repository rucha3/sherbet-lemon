#! /bin/bash

sbt clean test assembly
img=rucha3/sherbet-lemon-gocd-1.0."$GO_PIPELINE_COUNTER"
docker build -t $img .
docker images
echo $docker_usname1
echo $docker_pswd1
docker login -u $docker_usname1 --password $docker_pswd1
docker push $img