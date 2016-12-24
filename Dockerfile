FROM alpine
MAINTAINER Sami Haahtinen <ressu@ressukka.net>

RUN apk add -U rsync sshpass \
      && rm -rf /var/cache/apk/*

ENV SCHEDULE="0 * * * *" \
  PASSWORD=Insecure

VOLUME /data /etc/crontabs

COPY entrypoint.sh rsync.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/crond", "-f"]
