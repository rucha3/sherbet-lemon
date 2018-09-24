#! /bin/bash

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
BUILD_USER=go

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})

    #addgroup is distribution specific

    addgroup -S -g ${DOCKER_GID} ${DOCKER_GROUP}
    addgroup  ${BUILD_USER} ${DOCKER_GROUP}
fi
sbt clean test assembly
img=rucha3/sherbet-lemon-gocd-1.0."$GO_PIPELINE_COUNTER"
docker build -t $img .
docker images
echo $docker_usname1
echo $docker_pswd1
docker login -u $docker_usname1 --password $docker_pswd1
docker push $img