FROM ubuntu

RUN apt update && apt install -y git nano

WORKDIR /usr/share/myapp

RUN npm build