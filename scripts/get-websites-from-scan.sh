#!/bin/bash
# get-websites-from-scan.sh
# Created on: Wed 25 Jun 2025 10:57:01 AM IST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#
if [[ -z $1 ]]; then
	echo "Please provide an interface"
	exit -1
fi
IFACE=$1

EXEC_PATH=$HOME/.termux/tasker/
LOOT_PATH=$HOME/loot/$(bash $EXEC_PATH/get-network.sh $IFACE | jq .subnet -r)/

if [ ! -f $LOOT_PATH/ips.txt ]; then
	echo "Error: ping sweep not done"
	exit -1
fi

PORT_HTTP=($(cat $LOOT_PATH/scans/*.gnmap | grep '80/open' | awk '$1=="80/open"{print $2}'))
PORT_HTTPS=($(cat $LOOT_PATH/scans/*.gnmap | grep '443/open' | awk '/open/{print $2}'))
# You might be able to do a better awk command for it to just do every http instance independant of the port
PORT_UNCOMMON=($(cat $LOOT_PATH/scans/*.gnmap | grep '8000/open' | awk '/open/{print $2}'))
PORT_UNCOMMONAGAIN=($(cat $LOOT_PATH/scans/*.gnmap | grep '8080/open' | awk '/open/{print $2}'))
for ip in ${PORT_HTTP[*]}; do
	echo -n "http://$ip/ "
done
for ip in ${PORT_HTTPS[*]}; do
	echo -n "https://$ip/ "
done
for ip in ${PORT_UNCOMMON[*]}; do
	echo -n "http://$ip:8000/ "
done
for ip in ${PORT_UNCOMMONAGAIN[*]}; do
	echo -n "http://$ip:8080/ "
done
