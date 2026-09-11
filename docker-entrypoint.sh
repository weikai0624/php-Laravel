#!/bin/sh
set -eu

application_dir="/var/www/html"
sqlite_database="${DB_DATABASE:-$application_dir/database/database.sqlite}"

mkdir -p \
    "$application_dir/storage/framework/cache" \
    "$application_dir/storage/framework/sessions" \
    "$application_dir/storage/framework/views" \
    "$application_dir/storage/logs" \
    "$application_dir/bootstrap/cache"

if [ "${DB_CONNECTION:-sqlite}" = "sqlite" ]; then
    mkdir -p "$(dirname "$sqlite_database")"
    touch "$sqlite_database"
fi

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

if [ "${DB_CONNECTION:-sqlite}" = "sqlite" ]; then
    php artisan migrate --force
fi

exec docker-php-entrypoint "$@"
