#!/bin/sh

if [[ -z "$2" ]]
then
    echo "Usage: ./nc_send.sh <station-number> <message>"
    exit 1
fi

i=$1
host=10.0.0.$i
port=1234
#nc $host $port
python nc_client.py $host $port "$2"
