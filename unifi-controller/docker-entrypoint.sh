#!/bin/bash

set -ex

# create our folders
mkdir -p /data/{data,logs,run}

# create symlinks for data
[[ -L /usr/lib/unifi/data && ! /usr/lib/unifi/data -ef /data/data ]] && unlink /usr/lib/unifi/data
[[ -L /usr/lib/unifi/logs && ! /usr/lib/unifi/logs -ef /data/logs ]] && unlink /usr/lib/unifi/logs
[[ -L /usr/lib/unifi/run && ! /usr/lib/unifi/run -ef /data/run ]] && unlink /usr/lib/unifi/run
[[ ! -L /usr/lib/unifi/data ]] && ln -s /data/data /usr/lib/unifi/data
[[ ! -L /usr/lib/unifi/logs ]] && ln -s /data/logs /usr/lib/unifi/logs
[[ ! -L /usr/lib/unifi/run ]] && ln -s /data/run /usr/lib/unifi/run

exec /usr/bin/java ${JVM_OPTS} -jar /usr/lib/unifi/lib/ace.jar "$@"
