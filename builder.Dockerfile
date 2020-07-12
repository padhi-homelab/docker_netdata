FROM python:3.7-alpine


LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"


ARG JUDY_VERSION=1.0.5


ARG JUDY_SOURCE_TAR=http://downloads.sourceforge.net/project/judy/judy/Judy-${JUDY_VERSION}/Judy-${JUDY_VERSION}.tar.gz
ADD ${JUDY_SOURCE_TAR} /judy.tar.gz


RUN apk add --no-cache \
        alpine-sdk \
        autoconf \
        automake \
        bash \
        build-base \
        cmake \
        curl \
        jq \
        json-c-dev \
        libgcrypt-dev \
        libmnl-dev \
        libuuid \
        libuv-dev \
        lm_sensors \
        lz4-dev \
        netcat-openbsd \
        nodejs \
        openssl-dev \
        pkgconfig \
        util-linux-dev \
        zlib-dev \
 && pip install \
        psycopg2 \
        pyyaml \
 && cd / \
 && tar -zxf /judy.tar.gz \
 && rm judy.tar.gz \
 && cd /judy-${JUDY_VERSION} \
 && CFLAGS="-O2 -s" CXXFLAGS="-O2 -s" ./configure --prefix=/deps \
 && make \
 && make install


CMD ["bash"]