#!/bin/sh

# Check if tempdir exists
if [ -d /data/.temp ]; then
  RSYNC_TEMP="--partial-dir=/data/.temp/ --temp-dir=/data/.temp/ -f 'P /.temp' -f 'H /.temp'"
fi

rsync \
  -vrmlty --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} \
  -e "/usr/bin/sshpass -p${PASSWORD} /usr/bin/ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} /data/ ${TARGET}
