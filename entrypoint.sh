#!/bin/sh

echo "$SCHEDULE /rsync.sh" > /etc/crontabs/root

## Always run under tini, since we need to reap the leftovers
exec tini -- "$@"
