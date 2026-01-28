#!/bin/bash
# get-iface.sh
# Created on: Sun 15 Jun 2025 07:29:35 PM IST
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:

iface_array=( $(ifconfig | grep -o '^[a-zA-Z0-9]\+:' | sed 's/:$//') )

echo ${iface_array[@]}

#echo "{\"ifaces\":["
#for iface in ${iface_array[@]}; do
#
#	last_index=$(( ${#iface_array[@]} - 1 ))
#	last_element="${iface_array[$last_index]}"
#
#	if [[ "$iface" = "$last_element" ]]; then
#		echo "\"$iface\""
#	else
#		echo "\"$iface\","
#	fi
#done
#echo "]}"
