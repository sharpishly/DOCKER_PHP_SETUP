#!/bin/bash
/usr/local/sbin/php-fpm --nodaemonize &
sleep 1
nginx -g 'daemon off;'