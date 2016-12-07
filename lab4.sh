#!/usr/bin/env bash

./gradlew -b db-service/build.gradle clean build;

docker-compose -f db-service/docker-compose.yml up -d --build;

sleep 5;
curl http://localhost:8080/person/list;

docker-compose -f db-service/docker-compose.yml down;