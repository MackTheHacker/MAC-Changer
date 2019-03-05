#!/bin/bash 
# A simple shell script that changes your MAC address. 
# The name of the device must be provided as a command line argument in order to change its MAC address (you can use ifconfig to see your devices) 
# Also, this script will only work if run as root. It will fail if not done so.  
# By default, it sets your MAC address to 00:11:22:33:44:55. You can change this to whatever value you want. If you want a randomly assigned one, then use the other shell script. 

if [ -z "$1" ]; then 
	(>&2 printf "ERROR: You must provide the name of the device in order to change its MAC address.\nGet your device name by using \"ifconfig\"\n")
else	
	ifconfig $1 down 
	ifconfig $1 hw ether 00:11:22:33:44:55
	service network-manager restart
fi 
