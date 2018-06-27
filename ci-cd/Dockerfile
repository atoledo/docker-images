FROM gliderlabs/alpine:latest

RUN apk update
RUN apk add --no-cache bash curl jq rsync
RUN apk add ca-certificates wget && update-ca-certificates && apk add openssl

CMD ["/bin/sh"]
