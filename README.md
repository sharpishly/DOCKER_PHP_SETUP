### READ ME ###

# Address acces via the IP address:

```
http://144.126.195.100:4000/

```

# run.sh
* Change container name & port to match your requirments
```
#!/bin/bash
# Remove existing container if exists
docker rm -f sharpishly-dev || true

# Run the container with proper port mapping and name
docker run -d -p 4000:4000 --name sharpishly-dev php-nginx

# Test localhost
curl http://localhost:4000
```


