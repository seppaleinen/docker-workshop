#!/usr/bin/env bash

docker images | grep -E '^nginx';

docker run -p 8080:80 -d nginx && curl localhost:8080 | grep '<title>Welcome to nginx!</title>' && docker ps -aq | xargs docker rm -f;

docker run -p 8080:80 -d nginx &&
docker run -p 8080:80 -d nginx | grep 'port is already allocated' &&
docker ps -aq | xargs docker rm -f;


docker images;


docker run -e HEJ=HOJ -d nginx &&
docker ps -aq | xargs docker inspect | grep 'HEJ' &&
docker ps -aq | xargs docker rm -f;


docker run -d nginx &&
NGINX_PID=$( docker ps -aq );
docker exec -ti "$NGINX_PID" env | grep 'HEJ' &&
docker exec -ti "$NGINX_PID" ps -ef &&
docker exec -ti "$NGINX_PID" ps -ef | grep -i 'nginx' | awk '{print $0}' | xargs kill -9 &&
docker ps -aq | xargs docker rm -f;


docker ps -a;

docker ps -aq | xargs docker rm -f;