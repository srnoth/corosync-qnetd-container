FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends corosync-qnetd libnss3-tools && \
    rm -rf /var/lib/apt/lists/*

RUN corosync-qnetd-certutil -i

VOLUME ["/etc/corosync/qnetd"]

EXPOSE 5403/tcp

CMD ["corosync-qnetd", "-f"]
