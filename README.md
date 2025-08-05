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

# Change port in nginx.conf listen 4000

```
server {
    listen 4000;
    server_name localhost;

    root /var/www/sharpishly/sharpishly.com/website/public;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

# Check port

```

sudo ufw status

```

# Set port

```

sudo ufw allow 4000/tcp

```


# File permission

```

sudo chown -R www-data:www-data /var/www/sharpishly
sudo chmod -R 755 /var/www/sharpishly
sudo chmod +x /var/www/sharpishly/build.sh /var/www/sharpishly/run.sh /var/www/sharpishly/start.sh

```

# Build & Run

```
cd /var/www/sharpishly/ && git stash && git pull && git fetch
sudo chmod +x build.sh run.sh start.sh
./build.sh
./run.sh


```

# Install Certbot (on the host):

```

sudo apt-get update
sudo apt-get install -y certbot

```

