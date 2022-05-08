FROM padhihomelab/alpine-base:edge

LABEL maintainer="Saswat Padhi saswat.sourav@gmail.com"

COPY entrypoint-scripts \
     /etc/docker-entrypoint.d/99-extra-scripts

ENV DO_NOT_TRACK=1 \
    ENTRYPOINT_RUN_AS_ROOT=1

RUN chmod +x /etc/docker-entrypoint.d/99-extra-scripts/*.sh \
 # curl and jq are required by cgroup-name.sh plugin
 && apk add --update --no-cache \
            curl \
            jq \
            netdata=1.34.1-r0 \
 # Opt out of telemetry
 && touch /etc/netdata/.opt-out-from-anonymous-statistics \
 # The server only binds to localhost by default on Alpine
 && sed -i 's;^\s*bind to = .*$;;g' /etc/netdata/netdata.conf \
 # Disable Netdata cloud entirely
 && mkdir -p /var/lib/netdata/cloud.d \
 && echo -e "[global]\n  enabled = no" > /var/lib/netdata/cloud.d/cloud.conf

EXPOSE 1234

# Runs as `netdata` user created during installation.
CMD ["netdata", "-D", "-p", "1234", "-s", "/host"]

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
        CMD [ "wget", "-qSO", "/dev/null", "http://localhost:1234" ]
