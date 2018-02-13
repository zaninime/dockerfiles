#!/bin/bash
set -eo pipefail

BASE_DIR=/var/lib/zerotier-one
AUTH_TOKEN_FILE=$BASE_DIR/authtoken.secret

if [[ -f $AUTH_TOKEN_FILE ]]; then
    export ZTC_AUTHTOKEN=$(cat $AUTH_TOKEN_FILE)
else
    export ZTC_AUTHTOKEN=$(tr -cd '[:alnum:]' < /dev/urandom | head -c24)
    echo -n $ZTC_AUTHTOKEN > $AUTH_TOKEN_FILE
fi

exec "$@"
