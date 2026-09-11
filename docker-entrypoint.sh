#!/bin/sh
set -eu

application_dir="/var/www/html"

mkdir -p \
    "$application_dir/storage/framework/cache" \
    "$application_dir/storage/framework/sessions" \
    "$application_dir/storage/framework/views" \
    "$application_dir/storage/logs" \
    "$application_dir/bootstrap/cache"

if [ "$(id -u)" = "0" ]; then
    chown -R www-data:www-data \
        "$application_dir/storage" \
        "$application_dir/bootstrap/cache"

    chmod -R ug+rwX \
        "$application_dir/storage" \
        "$application_dir/bootstrap/cache"

    if [ -d "$application_dir/database" ]; then
        chown -R www-data:www-data "$application_dir/database"
        chmod -R ug+rwX "$application_dir/database"
    fi
fi

exec docker-php-entrypoint "$@"
