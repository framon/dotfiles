#!/bin/sh

iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -p tcp -d <define-ip-here> -j ACCEPT
iptables -A OUTPUT -m owner --gid-owner internet -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -j REJECT
