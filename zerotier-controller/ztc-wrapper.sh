#!/bin/bash
set -e

ZTC=/usr/bin/ztc
HOME_DIR=/var/lib/zerotier-one
AUTH_TOKEN_FILE=$HOME_DIR/authtoken.secret

export ZTC_AUTHTOKEN=$(cat $AUTH_TOKEN_FILE)

exec $ZTC "$@"
