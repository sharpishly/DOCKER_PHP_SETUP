#!/bin/bash

# Stop and remove the existing container if it exists
docker rm -f sharpishly-dev 2>/dev/null || true

# Run a new container using the built image
docker run -d -p 4000:4000 --name sharpishly-dev sharpishly-dev

# Test the app is reachable
curl --silent http://localhost:4000 || echo "App may not have started yet. Try again in a few seconds."
