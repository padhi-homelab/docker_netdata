FROM python:3.7-alpine


LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"


RUN apk add --no-cache \
        curl \
        fping \
        jq \
        json-c \
        libmnl \
        libgcrypt \
        libuuid \
        libuv \
        libvirt-daemon \
        lm_sensors \
        lz4 \
        lz4-libs \
        netcat-openbsd \
        nodejs \
        openssl \
        shadow \
        util-linux \
        zlib \
 && pip install \
        psycopg2 \
        pymongo \
        pyyaml


CMD ["bash"]