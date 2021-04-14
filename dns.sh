#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "This script must be run as root"
	exit 1
fi
clear
REGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
echo -n "Escrigui la primera direcció IP per al DNS: "
read DNS1
echo -n "Escrigui la segona direcció IP per al DNS: "
read DNS2

if [[ $DNS1 =~ $REGEX ]] && [[ $DNS2 =~ $REGEX ]]
then
	echo "# Generated by NetworkManager" > /etc/resolv.conf
	echo "search fjeclot.net" >> /etc/resolv.conf
	echo "nameserver $DNS1" >> /etc/resolv.conf
	echo "nameserver $DNS2" >> /etc/resolv.conf
else
	echo "Variable No Acceptada. El pograma es finalitzarà"
	exit 1
fi
exit 0