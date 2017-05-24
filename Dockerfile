FROM alpine:3.5
MAINTAINER charley <2555085@gmail.com>

ENV MDWREL 0.6.2

RUN mkdir -p /usr/src/mdwiki
RUN set -ex \
    && apk add --no-cache darkhttpd unzip ca-certificates openssl && update-ca-certificates && wget https://github.com/Dynalon/mdwiki/releases/download/$MDWREL/mdwiki-$MDWREL.zip && unzip mdwiki-$MDWREL.zip && cp mdwiki-$MDWREL/* /usr/src/mdwiki

VOLUME /md-app
WORKDIR /md-app

EXPOSE 80

CMD CMD cp -f /usr/src/mdwiki/mdwiki.html /md-app/index.html && darkhttpd /md-app -port 80