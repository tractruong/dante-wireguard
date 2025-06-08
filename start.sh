#!/bin/sh

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Bring up WireGuard interface
wg-quick up wg0

# Start Dante server in foreground with debug level 1
exec sockd -f /etc/danted.conf -N 1
