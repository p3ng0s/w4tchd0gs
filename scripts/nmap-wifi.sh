#!/bin/bash
# nmap-wifi.sh
# Created on: Wed 25 Jun 2025 10:42:10 AM IST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#
if [[ -z $1 ]]; then
	echo "Provide a network interface"
	exit -1
else
	IFACE=$1
fi

EXEC_PATH=$HOME/.termux/tasker/
LOOT_PATH=$HOME/loot/$(bash $EXEC_PATH/get-network.sh $IFACE | jq .subnet -r)/

if [ ! -f $LOOT_PATH/ips.txt ]; then
	echo "Error: ping sweep not done"
	exit -1
fi

cat $LOOT_PATH/ips.txt | xargs -I {} nmap -n -Pn -sC -sV -oN "$LOOT_PATH/scans/small_scan_{}.nmap" -oG "$LOOT_PATH/scans/small_scan_{}.gnmap" -vvv {}
