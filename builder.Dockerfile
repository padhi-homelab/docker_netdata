FROM python:3.9-alpine3.15
ARG TARGETARCH

LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"

RUN apk add --no-cache --update \
        alpine-sdk \
        autoconf \
        automake \
        bash \
        build-base \
        cmake \
        curl \
        elfutils-dev \
        jq \
        json-c-dev \
        libgcrypt-dev \
        libmnl-dev \
        libtool \
        libuuid \
        libuv-dev \
        lm_sensors \
        lz4-dev \
        mariadb-dev \
        mongo-c-driver-dev \
        musl-dev \
        netcat-openbsd \
        nodejs \
        openssl-dev \
        pkgconfig \
        postgresql-dev \
        protobuf-dev \
        snappy-dev \
        util-linux-dev \
        zlib-dev \
 && pip install --upgrade \
        pip \
        pyyaml


CMD ["bash"]