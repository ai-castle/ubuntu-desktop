#!/bin/bash

rm -f /var/run/dbus/pid /var/run/xrdp/xrdp-sesman.pid

# start
service dbus restart
/usr/lib/systemd/systemd-logind &
service xrdp restart

# monitering
while true; do
    if ! pgrep -x "dbus-daemon" > /dev/null; then
        echo "dbus is not running. Restarting dbus..."
        service dbus restart
    fi
    if ! pgrep -x "xrdp" > /dev/null; then
        echo "xrdp is not running. Restarting xrdp..."
        service xrdp restart
    fi
    if ! pgrep -x "systemd-logind" > /dev/null; then
        echo "systemd-logind is not running. Restarting systemd-logind..."
        service systemd-logind restart
    fi
    sleep 10
done