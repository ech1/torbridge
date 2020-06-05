sudo pacman -Syyu
sudo pacman -S macchanger polipo tor
cd /opt/
sudo git clone https://github.com/neoslabdev/torbridge
sudo chmod +x /opt/torbridge/torbridge
sudo ln -s /opt/torbridge/torbridge /usr/local/bin/torbridge
