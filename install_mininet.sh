#!/bin/sh

sudo apt-get update
git clone https://github.com/intrig-unicamp/mininet-wifi
cd mininet-wifi
sudo util/install.sh -Wnfvl
