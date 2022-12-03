Basic BIND9 server to used as a recursive resolver

to build:
docker build --tag dns:latest dns

to run:
docker run -it -d --rm --name dns --publish target=53,published=127.0.0.1:53,protocol=tcp --publish target=53,published=127.0.0.1:53,protocol=udp dns
