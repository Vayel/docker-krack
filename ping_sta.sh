#!/bin/sh

if [[ -z "$1" ]]
then
    echo "Usage: ./ping_sta.sh <station-number>"
    exit 1
fi

i=$1
ping 10.0.0.$i
