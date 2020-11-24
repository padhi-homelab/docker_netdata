FROM python:3.9.0-alpine3.12

LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"

RUN apk add --no-cache --update \
        curl \
        elfutils-dev \
        fping \
        g++ \
        jq \
        json-c \
        libmnl \
        libgcrypt \
        libprotobuf \
        libuuid \
        libuv \
        libvirt-daemon \
        lm_sensors \
        lz4 \
        lz4-libs \
        mongo-c-driver \
        netcat-openbsd \
        nodejs \
        openrc \
        openssl \
        shadow \
        snappy-dev \
        util-linux \
        zlib \
 && pip install \
        dnspython \
        pymongo[snappy] \
        pyyaml \
 && apk del --purge \
        g++ \
 && rm -rf /tmp/*

CMD ["bash"]
