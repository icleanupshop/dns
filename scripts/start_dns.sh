#/bin/sh

/usr/sbin/named -c /etc/bind/named.conf
/opt/fluent-bit/bin/fluent-bit -c /etc/fluent-bit/fluent-bit.conf
