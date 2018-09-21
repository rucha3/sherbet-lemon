#! /bin/bash

sbt clean assembly
docker build -t rucha3/sherbet-lemon .
docker images
echo $docker_usname1
echo $docker_pswd1
docker login -u $docker_usname1 --password $docker_pswd1
docker push rucha3/sherbet-lemon
nam=`docker run -d -p 8000:8000 rucha3/sherbet-lemon`
docker ps -a
sleep 5
curl http://localhost:8000/health
curl http://localhost:8000/greet/voldy
docker inspect $nam | grep IPAddress