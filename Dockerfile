FROM node:20.18-alpine3.20@sha256:40cbd847a2db119ba716f2861b04076bcb575a0051923459271a18ff80944f7f

#LABEL org.opencontainers.image.description DESCRIPTION
#LABEL org.opencontainers.image.authors "Anjo KLABEL olk, anjo.kolk@gmail.com"
#LABEL org.opencontainers.image.created "2024-06-21 18:38:05+00:00"
#LABEL org.opencontainers.image.description "Open-source graphql-mesh interface for Solar Edge API,
#LABEL org.opencontainers.image.documentation": "https://www.home-assistant.io/docs/",
#LABEL org.opencontainers.image.licenses "Apache License 2.0",
#LABEL org.opencontainers.image.source "https://github.com/akolk/solar-mesh/core",
#LABEL org.opencontainers.image.title "Solar Mesh"
#LABEL org.opencontainers.image.url": "https://www.home-assistant.io/",
#LABEL org.opencontainers.image.version "2024.6.4"


# zorg dat sqlite later bij de yarn install een python executable kan vinden
RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip

WORKDIR /myapp
COPY package.json \
     .meshrc.yaml  .
     
COPY jsons  ./jsons

EXPOSE 80

RUN yarn install 
CMD yarn mesh dev
