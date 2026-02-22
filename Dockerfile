FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends corosync-qnetd libnss3-tools && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/corosync/qnetd"]

EXPOSE 5403/tcp

CMD ["/bin/bash", "-c", "test -f /etc/corosync/qnetd/nssdb/qnetd-cacert.crt || corosync-qnetd-certutil -i && exec corosync-qnetd -f"]
