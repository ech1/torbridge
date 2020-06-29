sudo pacman -Syyu
sudo pacman -S macchanger polipo tor
cd /opt/
sudo git clone https://github.com/ech1/torbridge
sudo chmod +x /opt/torbridge/torbridge
sudo ln -s /opt/torbridge/torbridge /usr/local/bin/torbridge

cd torbridge
sudo cp /opt/torbridge/torbridge.service /etc/systemd/system/
sudo systemctl start torbridge
sudo systemctl status torbridge
sudo systemctl enable torbridge
