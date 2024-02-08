#!/bin/sh

# Check if tempdir exists
if [ -d /data/.temp ]; then
  RSYNC_TEMP="--partial-dir=/data/.temp/ --temp-dir=/data/.temp/ --filter=P_/.temp --filter=H_/.temp"
fi

rsync \
  -vrmlty ${RSYNC_OPTIONS}  --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} \
  -e "/usr/bin/sshpass -p${PASSWORD} /usr/bin/ssh ${SSH_OPTIONS--Tx} -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} ${TARGET}
