#! /bin/bash

img=rucha3/sherbet-lemon-gocd-1.0."$GO_PIPELINE_COUNTER"
nam=`docker run -d -p 8000:8000 $img`
docker ps -a
sleep 5
curl http://localhost:8000/health
curl http://localhost:8000/greet/voldy
docker inspect $nam | grep IPAddress