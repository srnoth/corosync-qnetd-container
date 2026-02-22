FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends corosync-qnetd && \
    rm -rf /var/lib/apt/lists/*

# Generate initial QNetd CA + server cert
RUN corosync-qnetd-certutil -i

# qnetd stores certs here — mount a persistent volume over this path
VOLUME ["/etc/corosync/qnetd"]

EXPOSE 5403/tcp

CMD ["corosync-qnetd", "-f"]
