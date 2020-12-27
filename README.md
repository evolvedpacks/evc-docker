# Evolved Combat Server Docker Image

The Dockerfile in this directory provides a full Docker image to set up an Evolved Combat server based on OpenJDK 8 and Alpine Linux as base image.

## Build the Image

To build the image, first clone this repository and change to this directory.

```
$ git clone https://github.com/evolvedpacks/evc-docker.git . --depth 1
```

Then, build the image. You can pass the desired server version as build argument `VERSION`. The value `latest` will always refer to the latest release version of the server.

```
$ docker build . -t evc --build-arg VERSION=latest
```

## Pre-built Image

You can also use the prebuilt image which can be found on Docker Hub:  
https://hub.docker.com/r/zekro/evc

> Please do not consider this pre-built image to be always up-to-date.

```
$ docker pull zekro/evc:latest
```

## Running the Image

It is recommendet to use docker-compose to run this image. You can use the following service configuration for that.

```yaml
version: "3"

services:
  evi:
    image: "zekro/evc:latest"
    environment:
      - "XMS=1G"
      - "XMX=4G"
    ports:
      - "25565:25565" # minecraft port
      - "25575:25575" # rcon port
    volumes:
      - "./evi/world:/var/server/world"
      - "./evi/config:/var/server/config"
      - "./evi/server.properties:/var/server/server.properties"
      - "./evi/white-list.json:/var/server/white-list.json"
      - "./evi/ops.json:/var/server/ops.json"
    restart: on-failure
```