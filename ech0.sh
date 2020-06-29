#!/bin/sh
sudo iptables -F
while :
do
    sudo iptables -F
    sudo iptables -A INPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A INPUT -s 127.0.1.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.1.1 -j ACCEPT

    sudo iptables -A INPUT -j DROP
    sudo iptables -A OUTPUT -j DROP
    echo '[+] TORIFY THE SYSTEM [+]'
    echo '[+] Press ENTER to route everything through tor'
    read choice
    sudo iptables -F
    sudo iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.1.1 -j ACCEPT
    sudo iptables -A INPUT -d 127.0.0.1 -j ACCEPT
    sudo iptables -A INPUT -d 127.0.1.1 -j ACCEPT
	    echo '[+] TORBRIDGE MODE'
	    sudo torbridge -c status
	    sudo torbridge -c changemac
	    sudo torbridge -c start
	    sudo torbridge -c status
	echo '[+] Press ENTER to stop'
	read choice
	sudo torbridge -c stop
	sudo torbridge -c revertmac
	sudo torbridge -c status
done
