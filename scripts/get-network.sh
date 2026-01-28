#!/bin/bash
# get-network.sh
# Created on: Sat 07 Jun 2025 02:05:19 PM IST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#
if [[ -z $1 ]]; then
	echo "Please provide a interface"
	exit -1
fi

iface=$1

ip_address=$(ifconfig 2> /dev/null | grep -A 2 $iface | awk '/inet /{print $2}')
subnet=$(echo $ip_address | cut -d'.' -f1,2,3)

echo "{\"ip\":\"$ip_address\",\"subnet\":\"$subnet\"}"
