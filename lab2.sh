#!/usr/bin/env bash

echo "STEP 1";
docker build --rm -t silly_server silly_server;

docker run silly_server;

docker ps -aq | xargs docker rm -f;
