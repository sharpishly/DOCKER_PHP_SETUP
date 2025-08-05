#!/bin/bash

# f609a46f9e40   sharpishly-dev    "docker-php-entrypoi…"   4 minutes ago    Exited (1) 4 minutes ago                sharpishly-dev
docker stop 721bd456c86b
docker stop 2567aa5dca24
docker stop db12a83a0073
docker stop e3ee7dcc343c
docker stop f3354286fdae
docker stop 81675683cd91
docker stop 876821de2fbc

docker rm 721bd456c86b
docker rm 2567aa5dca24
docker rm db12a83a0073
docker rm e3ee7dcc343c
docker rm f3354286fdae
docker rm 81675683cd91
docker rm 876821de2fbc

