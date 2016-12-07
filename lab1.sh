#!/usr/bin/env bash

echo 'STEP 1';
docker images | grep -E '^nginx';

echo 'STEP 2';
docker run -p 8080:80 -d nginx && curl localhost:8080 | grep '<title>Welcome to nginx!</title>' && docker ps -aq | xargs docker rm -f;

echo 'STEP 3';
docker run -p 8080:80 -d nginx &&
docker run -p 8080:80 -d nginx | grep 'port is already allocated' &&
docker ps -aq | xargs docker rm -f;

echo 'STEP 4';
docker images;

echo 'STEP 5';
docker run -e HEJ=HOJ -d nginx &&
docker ps -aq | xargs docker inspect | grep 'HEJ' &&
docker ps -aq | xargs docker rm -f;

echo 'STEP 6';
docker run -d nginx &&
docker exec -ti $( docker ps -aq ) env | grep 'HEJ' &&
docker exec -ti $( docker ps -aq ) ps -ef &&
docker exec -ti $( docker ps -aq ) ps -ef | grep -i 'nginx' | awk '{print $0}' | xargs kill -9 &&
docker ps -aq | xargs docker rm -f;

echo "STEP 7";
docker ps -a;

echo "STEP 8";
docker ps -aq | xargs docker rm -f;