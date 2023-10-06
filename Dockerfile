FROM quay.io/ukhomeofficedigital/hocs-base-image:4.1.6

USER 0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y squid && \
    apt-get clean

USER 10000

ENTRYPOINT exec /usr/sbin/squid -N
