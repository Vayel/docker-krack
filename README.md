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

* Run the network:

```bash
./create_network.sh
# Sometimes:
# Would you like to shut down the controller right now? (y/n)
# yes
```

* In the Mininet-Wifi console:

```bash
# Open terminals on stations
xterm sta1 sta1 sta1 sta2 sta2

# Run the script to check the vulnerability
sta1 ./krack.py wpa_supplicant -Dnl80211 -i sta1-wlan0 -c sta1_0.staconf
```

* On both `sta1` (in one of the opened XTerm) and `sta2`, connect to the AP:

```bash
./connect_wifi.sh N # N = 1 or 2 is the numero of the station
```

* On `sta1`:

```bash
./krack.py -i sta1-wlan0
```

* On `sta2`:

```bash
ping 10.0.0.1
```

* On `sta1`:

```bash
./roam.sh
# Observe the result in the Vagrant machine
```
