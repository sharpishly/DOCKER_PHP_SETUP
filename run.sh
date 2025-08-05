#!/bin/bash
# Stop and remove the existing container if it exists
docker rm -f sharpishly 2>/dev/null || true
# Run a new container using the built image
docker run -d -p 80:80 -p 443:443 \
    --name sharpishly \
    -v /etc/letsencrypt:/etc/letsencrypt:ro \
    sharpishly
# Test the app is reachable
curl --silent https://sharpishly.com || echo "App may not have started yet. Try again in a few seconds."