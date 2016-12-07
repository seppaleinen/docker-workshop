#!/usr/bin/env bash

echo "STEP 1";
docker build --rm -t static_web_server static_web_server;

docker run -p 8080:80 -d static_web_server;

curl localhost:8080;

docker ps -aq | xargs docker rm -f;
