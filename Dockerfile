ARG ALPINE_VERSION=3.20

FROM alpine:${ALPINE_VERSION}

RUN apk update \
	&& apk upgrade --available --no-cache

RUN apk add --no-cache curl

CMD echo -e "*/5 * * * * curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/`echo $HEALTHCHECK_IO_ID`\n" > /etc/crontabs/root; crond -f -d 8
