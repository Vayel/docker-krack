#!/bin/bash

#i=$1
#host=10.0.0.$i
port=1234
#nc -l $port
python nc_server.py $port
