#!/bin/bash
# Remove existing container if exists
docker rm -f sharpishly-dev || true

# Run the container with proper port mapping and name
docker run -d -p 4000:4000 --name sharpishly-dev php-nginx

# Test localhost
curl http://localhost:4000

