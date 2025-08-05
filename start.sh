#!/bin/bash

# Start php-fpm in the background
/usr/local/sbin/php-fpm --nodaemonize &

# Wait briefly to avoid race conditions
sleep 1

# Start Nginx in the foreground to keep container alive
nginx -g 'daemon off;'

