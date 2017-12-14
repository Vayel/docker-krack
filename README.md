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
xterm sta1 sta1 sta1 sta1 sta2 sta2
```

* On both `sta1` (in one of the opened XTerm) and `sta2`, connect to the AP:

```bash
./connect_wifi.sh N # N = 1 or 2 is the number of the station
```


* On `sta1`:

```bash
# Create a server to receive packets
./nc_listen.sh
```

* On `sta2`:

```bash
# Send "a message" to machine sta1
./nc_send.sh 1 "a message"
```

* On `sta1`:

```bash
# Launch a man-in-the-middle attack and print an alert when key is reused
./krack.sh 1
```

* Now send multiple messages from sta2 to sta1. If a key is used on m messages, after roam.sh is executed we will be available to display the content of 2m messages. Each key will have been used to encrypt 2 messages. So if you send m messages before the roam you will be able to 'see' m messages after the roam.
* On `sta1`:

```bash
# Reinitialise the message counter
./roam.sh 1
```

* Send some messages with netcat from `sta2` to `sta1`
* To reset the key, run on `sta1`:

```bash
./roam.sh 1
```

* Now, you can use the crib-dragging technique to recover messages that have been encrypted with the same key without knowing the wpa key. Refer to the [article](https://zestedesavoir.com/articles/2284/krack-attaques-contre-les-communications-wi-fi/) written by Vincent Lefoulon for more information on the technique.
