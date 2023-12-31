#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "root permission denied" 
   exit 1
fi

apt update
sudo apt install bind9 bind9utils bind9-doc

wget -O/usr/share/dns/root.hints https://www.internic.net/domain/named.root

systemctl start bind9
systemctl enable bind9
systemctl status bind9

echo "BIND9 installed"
