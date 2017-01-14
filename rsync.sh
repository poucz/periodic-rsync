#!/bin/sh

# Check if tempdir has been mounted
if [ -d /rsync-temp ]; then
  RSYNC_TEMP="--partial-dir=/rsync-temp"
fi

rsync \
  -vrmlty --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} \
  -e "/usr/bin/sshpass -p${PASSWORD} /usr/bin/ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} /data/ ${TARGET}
