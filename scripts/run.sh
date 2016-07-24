#!/bin/sh

STAMP=$(date)

echo "oc:x:`id -u`:0:oc:/:/sbin/nologin" >> /etc/passwd

# set apache as owner/group
if [ "$FIX_OWNERSHIP" != "" ]; then
	chown -R `id -u`:0 /etc/asterisk /var/log/asterisk /var/run/asterisk /var/lib/asterisk /var/spool/asterisk
fi

echo "oc:x:`id -u`:0:oc:/:/sbin/nologin" >> /etc/passwd

echo "[${STAMP}] Starting daemon..."
# run asterisk daemon
/usr/sbin/asterisk -vvv
