FROM alpine:latest
LABEL maintainer="jbbodart@yahoo.com"

ENV REFRESH_INTERVAL=600
ENV SET_IPV4="yes"
ENV SET_IPV6="no"

RUN apk -U upgrade \
 && apk add curl openssl bind-tools \
 && rm -rf /var/cache/apk/*

COPY run.sh update_ip.sh /usr/local/bin/

WORKDIR /usr/local/bin/

RUN chmod +x run.sh update_ip.sh

CMD ["./run.sh"]
