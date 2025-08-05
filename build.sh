#!/bin/bash
docker build -t sharpishly .

# Permissions
sudo chmod +x /var/www/sharpishly/run.sh
sudo chown -R www-data:www-data /var/www/sharpishly
sudo chmod -R 755 /var/www/sharpishly
sudo chmod +x /var/www/sharpishly/build.sh /var/www/sharpishly/run.sh /var/www/sharpishly/start.sh
sudo ufw status