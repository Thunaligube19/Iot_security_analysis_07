#!/bin/bash
#
read -p "Enter your ip address: " network
read -p "enter your report name:" name
touch $name
echo "[1] starting iot security analysis"
echo "[2] scanning iot security analysis"
echo "======== IoT security analysis script ========"
echo "Scanning network range: $NETWORK_RANGE"
echo "scan started: $(date +%d-%m-%Y)"
#step 1: Discover Devices
echo "[+] Discovering devices on network..."
rar=$(nmap -V | grep Nmap | awk '{print $3}') 
if [ "$rar" == "7.95" ]; then
	echo "Nmap tool is present"
 
else
	echo "Nmap not found"
	sudo apt install nmap -y
	echo "Nmap install successfully"
fi

#nmap -sn "$NETWORK_RANGE" -oG - | awk '/Up$/{print $2}'
nmap $network -o $name.txt

