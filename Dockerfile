FROM padhihomelab/netdata:builder AS builder

ARG NETDATA_VERSION=v1.23.2

ARG NETDATA_SOURCE_TAR=https://github.com/netdata/netdata/archive/${NETDATA_VERSION}.tar.gz
ADD ${NETDATA_SOURCE_TAR} /tmp/netdata.tar.gz

RUN tar -C /opt -zxf /tmp/netdata.tar.gz \
 && mv /opt/netdata* /opt/netdata.git \
 && cd /opt/netdata.git \
 && chmod +x netdata-installer.sh \
 && cp -rp /deps/* /usr/local/ \
 && ./netdata-installer.sh --disable-cloud \
                           --disable-telemetry \
                           --dont-start-it \
                           --dont-wait \
                           --enable-backend-prometheus-remote-write \
                           --stable-channel \
 && mkdir -p /app/usr/sbin/ \
             /app/usr/share \
             /app/usr/libexec \
             /app/usr/local \
             /app/usr/lib \
             /app/var/cache \
             /app/var/lib \
             /app/etc \
 && mv /usr/share/netdata         /app/usr/share/ \
 && mv /usr/libexec/netdata       /app/usr/libexec/ \
 && mv /usr/lib/netdata           /app/usr/lib/ \
 && mv /var/cache/netdata         /app/var/cache/ \
 && mv /var/lib/netdata           /app/var/lib/ \
 && mv /etc/netdata               /app/etc/ \
 && mv /usr/sbin/netdata          /app/usr/sbin/ \
 && mv /usr/sbin/netdata-claim.sh /app/usr/sbin/ \
 && mv /usr/sbin/netdatacli       /app/usr/sbin/ \
 && mv packaging/docker/run.sh    /app/usr/sbin/ \
 && cp -rp /deps/* /app/usr/local/ \
 && chmod +x /app/usr/sbin/run.sh


FROM padhihomelab/netdata:runtime

COPY --from=builder /app /
COPY --from=builder /opt/netdata.git/packaging/docker/health.sh /health.sh

ARG NETDATA_UID=201
ARG NETDATA_GID=201

ENV DOCKER_GRP=netdata \
    DOCKER_USR=netdata \
    DO_NOT_TRACK=1

RUN mv /usr/sbin/fping /usr/local/bin/fping \
 && chmod 4755 /usr/local/bin/fping \
 && mkdir -p /var/log/netdata \
 && addgroup -g ${NETDATA_GID} -S "${DOCKER_GRP}" \
 && adduser -S -H -s /usr/sbin/nologin -u ${NETDATA_GID} -h /etc/netdata -G "${DOCKER_GRP}" "${DOCKER_USR}" \
 && chown -R root:root \
          /etc/netdata \
          /usr/share/netdata \
          /usr/libexec/netdata \
 && chown -R netdata:root \
          /usr/lib/netdata \
          /var/cache/netdata \
          /var/lib/netdata \
          /var/log/netdata \
 && chown -R netdata:netdata \
          /var/lib/netdata/cloud.d \
 && chmod 0700 /var/lib/netdata/cloud.d \
 && chmod 0755 /usr/libexec/netdata/plugins.d/*.plugin \
 && chmod 4755 /usr/libexec/netdata/plugins.d/cgroup-network \
               /usr/libexec/netdata/plugins.d/apps.plugin \
 && find /var/lib/netdata /var/cache/netdata -type d -exec chmod 0770 {} \; \
 && find /var/lib/netdata /var/cache/netdata -type f -exec chmod 0660 {} \; \
 && ln -sf /dev/stdout /var/log/netdata/access.log \
 && ln -sf /dev/stdout /var/log/netdata/debug.log \
 && ln -sf /dev/stderr /var/log/netdata/error.log

EXPOSE 19999

ENTRYPOINT ["/usr/sbin/run.sh"]

HEALTHCHECK --interval=60s --timeout=10s --retries=3 \
        CMD /health.sh
