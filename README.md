# docker-krack

Based on https://github.com/ramonfontes/reproducible-research/tree/master/mininet-wifi/krack-2017

## Install

* Install Virtualbox
* Install Vagrant
* Create the VM:

```bash
git clone https://github.com/Vayel/docker-krack
cd docker-krack
vagrant up

# Configuration commands running...
```

* Connect to the VM:

```bash
vagrant ssh
```

* Run the network (cf. https://www.youtube.com/watch?v=aA4notyZph0&feature=youtu.be&t=19s):

```bash
sudo python krack-mininet-wifi.py
```

* In the Mininet-Wifi console:

```bash
# Get AP ip (probably 10.0.0.101)
dump

# Open terminals on the station
xterm sta1 sta1

# Run the script to check the vulnerability
sta1 ./krack.py wpa_supplicant -Dnl80211 -i sta1-wlan0 -c sta1_0.staconf
```

* On `sta1` (in one of the two opened XTerm), ping the AP:

```bash
ping 10.0.0.101
```

* On `sta1`, in the second XTerm:

```bash
./roam.sh
# Observe the result in the Vagrant machine
```
