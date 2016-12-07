#!/usr/bin/env bash

docker images | grep -E '^nginx';

docker run nginx