#!/bin/bash

set -x 
export RSYNC_PASSWORD=${PASSWORD}
export R_O='--include=*/ --perms --chmod=777 --include=*.mp3 --exclude=*'

# Check if tempdir exists
if [ -d /data/.temp ]; then
  RSYNC_TEMP="--partial-dir=/data/.temp/ --temp-dir=/data/.temp/ --filter=P_/.temp --filter=H_/.temp"
fi


if [ -z "${RS_FULL}" ]; then
rsync \
  -rv ${RSYNC_OPTIONS}  \
  ${RSYNC_TEMP} \
   --perms --chmod=777  \
  ${SOURCE} ${TARGET}

else
	eval $RS_FULL
fi
