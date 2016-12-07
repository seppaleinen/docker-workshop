FROM debian:jessie

RUN apt-get update -y && apt-get install -y cowsay

ADD silly.sh /silly.sh

RUN /silly.sh
