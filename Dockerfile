# Use official PHP image with FPM
FROM php:8.2-fpm

# Install Nginx and necessary tools
RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Create and copy the index.php file
RUN mkdir -p /var/www/html
COPY index.php /var/www/html/index.php

# Expose port 1000
EXPOSE 1000

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start PHP-FPM and Nginx
CMD ["/start.sh"]
