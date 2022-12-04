from ubuntu:20.04

RUN apt update
RUN apt -y install bind9 bind9utils bind9-doc bind9-host dnsutils gpg curl
RUN curl https://packages.fluentbit.io/fluentbit.key | gpg --dearmor > /usr/share/keyrings/fluentbit-keyring.gpg
COPY config_files/sources.list /etc/apt
RUN apt update
RUN apt-get -y install fluent-bit
COPY config_files/fluent-bit.conf  /etc/fluent-bit/fluent-bit.conf
RUN mkdir /var/log/named

COPY config_files /etc/bind

EXPOSE 53/tcp
EXPOSE 53/udp

COPY scripts/start_dns.sh /
RUN chmod 755 /start_dns.sh
ENTRYPOINT /start_dns.sh
