#!/bin/bash
set -e

# Initialize the QNetd certificate database on first run
if [ ! -f /etc/corosync/qnetd/nssdb/qnetd-cacert.crt ]; then
    echo "First run: initializing QNetd certificate database..."
    corosync-qnetd-certutil -i
    echo "Certificate database initialized."
fi

echo "Starting corosync-qnetd..."
exec corosync-qnetd -f "$@"
