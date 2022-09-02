FROM quay.io/ukhomeofficedigital/hocs-base-image as builder

USER 0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y squid && \
    apt-get clean

USER 10000

CMD ["/usr/sbin/squid", "-N"]
