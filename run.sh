#!/bin/bash
docker rm -f sharpishly-dev 2>/dev/null || true
docker run -d -p 8001:8001 \
    --name sharpishly-dev \
    sharpishly-dev
curl --silent http://localhost:8001 || echo "App may not have started yet. Try again in a few seconds."