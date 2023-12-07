#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "root permission denied" 
   exit 1
fi

apt update
apt install bind9 bind9utils bind9-doc

wget -O/usr/share/dns/root.hints https://www.internic.net/domain/named.root

cat <<EOL > /etc/default/named
#
# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-u bind -4"
EOL

systemctl restart named
systemctl status named
