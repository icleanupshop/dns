from ubuntu

RUN apt update
RUN apt -y install bind9 bind9utils bind9-doc bind9-host dnsutils
RUN mkdir /var/log/named

COPY config_files /etc
COPY scripts/start_dns.sh /

RUN chmod 700 /start_dns.sh

EXPOSE 53/tcp
EXPOSE 53/udp


ENTRYPOINT /usr/sbin/named -c /etc/named.conf -f
