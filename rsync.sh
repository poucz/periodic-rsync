#!/bin/sh

export RSYNC_PASSWORD=${PASSWORD}

# Check if tempdir exists
if [ -d /data/.temp ]; then
  RSYNC_TEMP="--partial-dir=/data/.temp/ --temp-dir=/data/.temp/ --filter=P_/.temp --filter=H_/.temp"
fi

rsync \
  -vrmlty ${RSYNC_OPTIONS}  --delete-delay --delay-updates --delete-excluded \
  ${RSYNC_TEMP} \
  -rv  --perms --chmod=777  \
  ${SOURCE} ${TARGET}
