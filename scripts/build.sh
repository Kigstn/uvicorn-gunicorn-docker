#!/usr/bin/env bash
set -e

use_tag="kigstn/uvicorn-gunicorn:$NAME"

DOCKERFILE="$NAME"

if [ "$NAME" == "latest" ] ; then
    DOCKERFILE="python3.10.2"
fi

docker buildx build --platform=linux/amd64,linux/arm64,linux/arm/v8 -t "$use_tag" --file "./docker-images/${DOCKERFILE}.dockerfile" "./docker-images/"
