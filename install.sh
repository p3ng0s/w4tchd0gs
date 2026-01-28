#!/bin/bash
# install.sh
# Created on: Wed 28 Jan 2026 09:37:08 AM CET
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#  w4tchd0gs install scripts. w4tchd0gs is a collection of scripts / tools built
#  for work on android systems using tasker to automate testing and termux for
#  running commands. This scripts is made to be used with the tasker project.
#

if [[ -z "$PREFIX" ]]; then
	echo "[!] Please run inside of a termux environment"
	exit -1
fi
