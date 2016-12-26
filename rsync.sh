#!/bin/sh

# Check if tempdir has been given
if [ ! -z TEMPDIR ]; then
  # Create tempdir and update the variable to be a absolute path
  TEMPDIR="$( cd /data ; mkdir -p "$TEMPDIR" ; cd "$TEMPDIR" ; pwd )"
  RSYNC_TEMP="--temp-dir='$(TEMPDIR)'"
fi

rsync \
  -vrmlty --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} \
  -e "/usr/bin/sshpass -p${PASSWORD} /usr/bin/ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} /data/ ${TARGET}
