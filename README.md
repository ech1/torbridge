# TORBRIDGE

![alt text](https://raw.githubusercontent.com/ech1/torbridge/master/onion.png)

#### DESCRIPTION

Script to redirect all traffic through TOR Network including DNS queries for anonymizing entire system based on [Torctl](https://github.com/BlackArch/torctl) which is available on **BlackArch** but few optimizations were made and Polipo has added to minimize latency.

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
sudo cp torbridge.service /etc/systemd/system/
sudo systemctl start torbridge
sudo systemctl status torbridge
sudo systemctl enable torbridge
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
