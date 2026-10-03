FROM alpine:3.18

RUN set -o pipefail; \
    echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories; \
    echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories; \
    apk add --no-cache -U \
    netdata@edge \
    tini

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["netdata", "-D"]

