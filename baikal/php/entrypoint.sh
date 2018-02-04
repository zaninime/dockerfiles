#!/usr/bin/env sh
DATA_DIR="/var/lib/baikal"
DB_FILE="$DATA_DIR/db.sqlite"
INITIAL_DB_FILE="/var/www/db.sqlite"

if [ ! -f $DB_FILE ]; then
    cp $INITIAL_DB_FILE $DB_FILE
fi

chown -R www-data:www-data /var/lib/baikal

exec php-fpm "$@"
