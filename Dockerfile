FROM openjdk:8-alpine

ARG VERSION=release/latest

ENV XMS=1G
ENV XMX=3G

RUN apk add curl

WORKDIR /var/server

RUN curl -X GET -L \
        -o server.tar.gz \
        https://cdn.zekro.de/modpacks/evolved-combat/${VERSION}/server.tar.gz && \
    tar -xzf server.tar.gz &&\
    rm -f server.tar.gz

COPY ./scripts/run.sh ./run.sh

RUN mv forge-* forge.jar

RUN mv ./config ./_config &&\
    mkdir config

EXPOSE 25565 25575

ENTRYPOINT ["bash", "./run.sh"]
