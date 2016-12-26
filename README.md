# Periodic rsync container

Due to a bug in Synology Active Backup, I created a container to sync a given
directory periodically.

# General

For this container to work, we need to mount the local data source to /data
and set either SOURCE or DESTINATION

```
docker run -v /storage:/data -e PASSWORD=Insecure -e SOURCE=user@server.net:/source ressu/periodic-rsync
```

# Environment

This container takes the following environment variables.

## SCHEDULE

This variable contains a standard cron schedule, for example `0 * * * *`

## PASSWORD

The SSH password used to login to the SSH server.

## SOURCE

Source address for rsync copy

## DESTINATION

Destination address to copy data to.

# Directory for temporary files

Sometimes it's needed to have temporary files outside of the transfer
directory. Mounting a directory at `/rsync-temp` will cause rsync to store
temporary files there during the transfer

