#!/bin/bash

set -e

if [ "$1" = 'unifi' ]; then
    # create our folders
    mkdir -p /app/run

    # create symlinks for data
    [[ -L /usr/lib/unifi/data && ! /usr/lib/unifi/data -ef /app/data ]] && unlink /usr/lib/unifi/data
    [[ -L /usr/lib/unifi/logs && ! /usr/lib/unifi/logs -ef /app/logs ]] && unlink /usr/lib/unifi/logs
    [[ -L /usr/lib/unifi/run && ! /usr/lib/unifi/run -ef /app/run ]] && unlink /usr/lib/unifi/run
    [[ ! -L /usr/lib/unifi/data ]] && ln -s /app/data /usr/lib/unifi/data
    [[ ! -L /usr/lib/unifi/logs ]] && ln -s /app/logs /usr/lib/unifi/logs
    [[ ! -L /usr/lib/unifi/run ]] && ln -s /app/run /usr/lib/unifi/run

    chown -R unifi /usr/lib/unifi /app

    exec gosu unifi /usr/bin/java ${JVM_OPTS} -jar /usr/lib/unifi/lib/ace.jar start
fi

exec "$@"
