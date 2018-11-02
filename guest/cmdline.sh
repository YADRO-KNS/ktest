#!/bin/sh
dhcpconf=/etc/dhclient
dhcpifs=$(grep -oP 'ktest.dhcp=\K\S+' < /proc/cmdline | tr ',' ' ')
[ -n "$dhcpifs" ] && echo -n 'INTERFACES=' > $dhcpconf
for i in $dhcpifs; do
    echo -n "eth$i " >> $dhcpconf
done
