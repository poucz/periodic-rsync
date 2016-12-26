#!/bin/sh

# Check if tempdir has been given
if [ ! -z ${TEMPDIR} ]; then
  RSYNC_FILTER="--filter='P ${TEMPDIR}' --filter='H ${TEMPDIR}'"
  # Create tempdir and update the variable to be a absolute path
  RSYNC_TEMP="--temp-dir='$( cd /data ; mkdir -p "$TEMPDIR" ; cd "$TEMPDIR" ; pwd )'"
fi

rsync \
  -vrmlty --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} ${RSYNC_FILTER} \
  -e "/usr/bin/sshpass -p${PASSWORD} /usr/bin/ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} /data/ ${TARGET}
