#!/bin/sh

rsync \
  -qrmltyP --delete-delay --delay-updates --delete-excluded \
  -e "/usr/bin/sshpass -p${PASSWORD} ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no" \
  ${SOURCE} /data/ ${TARGET}
