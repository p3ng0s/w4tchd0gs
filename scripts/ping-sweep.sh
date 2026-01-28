#!/bin/bash
# ping-sweep.sh
# Created on: Fri 13 Jun 2025 02:48:11 PM CEST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#  This script is super slow and kinda shitty but it works for now.
#  This is not supposed to be done fast it's supposed to be done slowly

if [[ -z $1 ]]; then
	echo "Provide an ip range"
	exit -1
fi

for ip in $(seq 1 254);do
	bash -c "ping -c 1 $1.$ip" | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 &
done
