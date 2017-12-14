#!/bin/bash

if [[ -z "$1" ]]
then
    echo "Usage: ./connect_wifi.sh <station-number>"
    exit 1
fi

i=$1
wpa_supplicant -Dnl80211 -i sta$i-wlan0 -c sta$1_0.staconf
