#!/bin/bash
docker rm -f sharpishly 2>/dev/null || true
docker run -d -p 8000:8000 \
    --name sharpishly \
    sharpishly
curl --silent http://localhost:8000 || echo "App may not have started yet. Try again in a few seconds."