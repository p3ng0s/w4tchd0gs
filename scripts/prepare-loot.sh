#!/bin/bash
# quick-wifi-scan.sh
# Created on: Mon 16 Jun 2025 10:25:05 PM IST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#  A script to setup the working folder in loot and to start a ping sweep
#
#:termux-dialog confirm -i $1

if [[ -z $1 ]]; then
	echo "Provide a interface"
	exit -1
fi
IFACE=$1

EXEC_PATH=$HOME/.termux/tasker
LOOT_PATH=$HOME/loot/$(bash $EXEC_PATH/get-network.sh $IFACE | jq .subnet -r)/

ls $EXEC_PATH

if [ ! -z $LOOT_PATH ]; then
	mkdir -p $LOOT_PATH
	if [ ! -z $LOOT_PATH/scans ]; then
		mkdir -p $LOOT_PATH/scans
	fi
fi
bash $EXEC_PATH/ping-sweep.sh $(bash $EXEC_PATH/get-network.sh $IFACE | jq .subnet -r) > $LOOT_PATH/ips.txt
