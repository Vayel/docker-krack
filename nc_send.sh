#!/bin/sh

i=$1
host=10.0.0.$i
port=1234
#nc $host $port
python nc_client.py $host $port "$2"
