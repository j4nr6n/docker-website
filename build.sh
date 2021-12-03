#!/bin/sh

case "${@}" in
    'dev'|'')
        echo "Building Development Image...\n============================"
        docker build -t symfony-app:local-dev \
            --build-arg APP_ENV=dev \
            --build-arg APP_DEBUG=1 \
            .
        docker build -t symfony-web:local-dev \
            --build-arg ASSET_IMAGE=symfony-app:local-dev \
            -f docker/nginx/Dockerfile \
            .

        ;;
    'prod')
        echo "Building Production Image...\n============================"
        docker build -t symfony-app:local .
        docker build -t symfony-web:local \
            -f docker/nginx/Dockerfile \
            .

        ;;
    *)
        echo "Unknown build environment: ${@}\n"
        ;;
esac
