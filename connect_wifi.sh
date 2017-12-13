#!/bin/sh

i=$1
wpa_supplicant -Dnl80211 -i sta$i-wlan0 -c sta$1_0.staconf
