FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends corosync-qnetd libnss3-tools && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/etc/corosync/qnetd"]

EXPOSE 5403/tcp

ENTRYPOINT ["/entrypoint.sh"]
