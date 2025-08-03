#!/bin/bash
docker rm -f php-nginx-container || true
docker run -d -p 1000:1000 --name php-nginx-container php-nginx
