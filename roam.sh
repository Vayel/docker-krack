#!/bin/sh

#status=`wpa_cli <<EOF
#status
#EOF`
# bssid=TODO: parse status output

wpa_cli <<EOF
roam 02:00:00:00:00:01
EOF
