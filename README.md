# TORBRIDGE
* * *

![alt text](onionplusarch.png)

#### DESCRIPTION

Torbridge is a script to redirect all traffic through the TOR Network including DNS queries in order to anonymize entire system based on [Torctl](https://github.com/BlackArch/torctl) which is available on **BlackArch** but since neither the original version, nor the guy who made "a few optimizations" didn't satisfy me so i decided to fork it, and make it so that you can run an install script, which will make sure that everytime you log into your machine, there will be a service running to ensure your machine stays connected to the tor network.

The goal here is to run a script, for the arch linux user, which will then ensure that the system itself will always be using the tor network in order to mimick the TAILS operating system behavior(having tor activated by default)

You can verify if it is working by visiting the following links :

https://check.torproject.org/

https://dnsleaktest.com

https://ipleak.net

* * *

#### INSTALLATION (Automatic)

```bash
wget https://raw.githubusercontent.com/ech1/torbridge/master/install.sh 
sudo chmod +x install.sh
./install.sh
```

#### INSTALLATION (Manual)

```bash
sudo pacman -Syyu
sudo pacman -S macchanger polipo tor
cd /opt/
sudo git clone https://github.com/ech1/torbridge
sudo chmod +x /opt/torbridge/torbridge
sudo ln -s /opt/torbridge/torbridge /usr/local/bin/torbridge

cd torbridge
sudo cp /opt/torbridge/torbridge.service /etc/systemd/system/
sudo cp /opt/torbridge/torbridge_mac.service /etc/systemd/system/

sudo systemctl start torbridge
sudo systemctl start torbrige_mac

sudo systemctl status torbridge

sudo systemctl enable torbridge
sudo systemctl enable torbridge_mac
```

* * *

#### USAGE

```
$ torbridge

usage: torbridge [-c --command] or [-h --help] or [-v --version]

  -c      - Followed by the command to be executed by the script
  -h      - Display this help menu
  -v      - Display current version of TorBridge

  Commands:
  start          - Start redirecting all traffic through TOR
  stop           - Stop redirecting all traffic through TOR
  status         - Get TOR service status
  restart        - Restart TOR and traffic rules
  showip         - Display TOR IP address
  switchid       - Switch TOR identity
  changemac      - Change mac addresses of all interfaces
  revertmac      - Revert mac addresses of all interfaces
```
