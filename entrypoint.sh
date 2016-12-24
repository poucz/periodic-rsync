#!/bin/sh

echo "$SCHEDULE /rsync.sh" > /etc/crontabs/root

exec "$@"
