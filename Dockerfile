FROM redis:3-alpine

MAINTAINER Crossz (twitter.com/zhengxin)

ARG CLIENTPORT=6379
ARG PW=123
ARG MASTERPORT 
ARG MASTERHOST


ENV REQUIREPASS $PW
ENV CLIENTPORT $CLIENTPORT
ENV MASTERPORT $MASTERPORT
ENV MASTERHOST $MASTERHOST


## redis.conf: $CLIENTPORT also assigned here
ADD redis.conf /etc/redis.conf


ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE $CLIENTPORT

CMD [ "redis-server","/etc/redis.conf" ]
