#!/bin/bash

# Build the Docker image
docker build -t sharpishly-dev .

sudo chown -R www-data:www-data /var/www/sharpishly_dev
sudo chmod -R 755 /var/www/sharpishly_dev
sudo chmod +x /var/www/sharpishly_dev/build.sh /var/www/sharpishly_dev/run.sh /var/www/sharpishly_dev/start.sh
