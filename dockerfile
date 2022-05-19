FROM ubuntu

LABEL MAINTAINER="Izaias Nascimento <izaiasenelly@gmail.com>"
LABEL APP_VERSION="1.0.0"

ENV NPM_VERSION=8 ENVIRONMENT=PROD

RUN apt update && apt install -y git nano

WORKDIR /usr/share/myapp

RUN npm build

COPY ./requirements.txt requirements.txt

ADD ./files.tar.gz ./

RUN useradd izaias

USER izaias

EXPOSE 8080

VOLUME [ "/data" ]

ENTRYPOINT [ "ping" ]

CMD ["localhost"]
