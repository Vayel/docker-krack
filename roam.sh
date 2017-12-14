#!/bin/bash

if [[ -z "$1" ]]
then
    echo "Usage: ./roam.sh <station-number>"
    exit 1
fi

i=$1
wpa_cli -i sta$i-wlan0 <<EOF
roam 02:00:00:00:00:01
EOF
