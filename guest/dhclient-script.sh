#!/bin/sh
log=/var/log/dhclient-script.log
case $reason in
    PREINIT|PREINIT6)
        echo "dhcp: $reason $interface up"
        ip li set dev $interface up
        ;;
    BOUND)
        echo "dhcp: $reason $interface"
        if [ -n "$new_ip_address" ]; then
            ip a add $new_ip_address/$new_subnet_mask dev $interface
        fi
        if [ -n "$new_routers" ]; then
            ip ro add default via "$new_routers"
        fi
        if [ -n "$new_domain_name_servers" ]; then
            cat > /etc/resolv.conf <<EOF
nameserver $new_domain_name_servers
EOF
        fi
        ;;
    *)
        echo "Unkown reason $reason" >> $log
        export >> $log
        ;;
esac
