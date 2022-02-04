#!/bin/sh

chown -R netdata:netdata /var/lib/netdata \
                         /var/cache/netdata \
                         /etc/netdata

chmod og+r /etc/netdata
chmod og+r /host
