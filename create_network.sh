#!/bin/sh

sudo rm -f /var/run/wpa_supplicant/sta1-wlan0
sudo rm -f /var/run/wpa_supplicant/sta2-wlan0
sudo python krack-mininet-wifi.py
