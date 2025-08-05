#!/bin/bash
# Stop and remove the existing container if it exists
docker rm -f sharpishly 2>/dev/null || true
# Run a new container using the built image
docker run -d -p 8080:80 -p 443:443 -p 4000:4000 \
    --name sharpishly \
    -v /etc/letsencrypt:/etc/letsencrypt:ro \
    sharpishly
# Test the app is reachable
#curl --silent http://localhost:4000 || echo "App may not have started yet. Try again in a few seconds."