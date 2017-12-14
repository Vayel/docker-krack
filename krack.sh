#!/bin/bash

if [[ -z "$1" ]]
then
    echo "Usage: ./krack.sh <station-number>"
    exit 1
fi

i=$1
./krack.py -i sta$i-wlan0
