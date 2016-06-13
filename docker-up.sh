#!/bin/sh

docker build -t my-fantastic-app .
docker run --name my-fantastic-app -p 8080:3000 -d my-fantastic-app