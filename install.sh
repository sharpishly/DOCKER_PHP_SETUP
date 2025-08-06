#!/bin/bash
# File: install.sh
# Create Let's Encrypt challenge directories
sudo mkdir -p /var/www/letsencrypt/sharpishly-challenge
sudo mkdir -p /var/www/letsencrypt/dev-challenge
# Set permissions for Nginx
sudo chown -R www-data:www-data /var/www/letsencrypt
sudo chmod -R 755 /var/www/letsencrypt
# Output confirmation
echo "Let's Encrypt challenge directories created and permissions set:"
ls -ld /var/www/letsencrypt/*
# Set Nginx conf
sudo cp sharpishly.com /etc/nginx/sites-available/
sudo cp dev.sharpishly.com /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/sharpishly.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/sharpishly.com /etc/nginx/sites-enabled/

