#!/bin/bash

# Start php-fpm in the background
/usr/local/sbin/php-fpm --nodaemonize &

# Wait for PHP-FPM to start properly (optional but helps avoid race conditions)
sleep 1

# Start nginx in the foreground
nginx -g 'daemon off;'
