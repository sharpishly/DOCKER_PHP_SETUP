#!/bin/bash
/usr/sbin/php-fpm8.2 --nodaemonize &
nginx -g 'daemon off;'
