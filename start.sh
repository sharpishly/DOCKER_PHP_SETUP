#!/bin/bash
/usr/local/sbin/php-fpm --nodaemonize &
nginx -g 'daemon off;'
