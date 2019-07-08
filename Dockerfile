FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    sox \
    rtl-sdr \
    ezstream \
    icecast2 \
    mime-support \
    --no-install-recommends
ADD . /app
WORKDIR /app
RUN mkdir -pv /var/log/icecast2/ && \
    touch /var/log/icecast2/access.log && \
    touch /var/log/icecast2/error.log && \
    chmod 777 -R /var/log/icecast2/ && \
    chown nobody:nogroup -R /var/log/icecast2

RUN rm -rf /var/lib/apt/lists/*
EXPOSE 80
CMD ["/bin/bash", "entrypoint.sh"]
