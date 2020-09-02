#!/bin/bash
# chown -R www-data:www-data .
php artisan config:cache
php artisan migrate
