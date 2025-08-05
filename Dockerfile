# Use official PHP image with FPM
FROM php:8.2-fpm
# Install Nginx, MySQL client, cURL, certbot, and required PHP extensions
RUN apt-get update && apt-get install -y \
    nginx \
    default-mysql-client \
    curl \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    certbot \
    && docker-php-ext-install curl pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*
# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default
# Create web root and copy the index.php file
RUN mkdir -p /var/www/sharpishly_dev/sharpishly.com/website/public
COPY index.php /var/www/sharpishly_dev/sharpishly.com/website/public/index.php
# Set permissions
RUN chown -R www-data:www-data /var/www/sharpishly_dev && chmod -R 755 /var/www/sharpishly_dev
# Expose ports 80, 443, and 4000
EXPOSE 80 443 4000
# Copy startup script and make it executable
COPY start.sh /start.sh
RUN chmod +x /start.sh
# Start PHP-FPM and Nginx
CMD ["/start.sh"]