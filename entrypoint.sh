#!/bin/sh

echo "$SCHEDULE flock -n /var/lock /rsync.sh" > /etc/crontabs/root

## Always run under tini, since we need to reap the leftovers
exec /sbin/tini -- "$@"
