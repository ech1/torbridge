#!/bin/sh
sudo iptables -F
while :
do
    clear
    sudo iptables -F
    sudo iptables -A INPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A INPUT -s 127.0.1.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.1.1 -j ACCEPT

    sudo iptables -A INPUT -j DROP
    sudo iptables -A OUTPUT -j DROP
    echo '[+] THE IP TABLER SCRIPT [+]'
    echo '0) IO Private addresses only'
    echo '1) HTB only'
    echo '2) Webbrowsing - Random       (ProtonVPN TCP 443)'
    echo '3) Webbrowsing - Fastest      (ProtonVPN TCP 443)'
    echo '4) Invisible Listener only'
    echo '9) Allow Everything           /!\ DANGEROUS /!\'
    echo ''
    read choice
    sudo iptables -F
    sudo iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
    sudo iptables -A OUTPUT -s 127.0.1.1 -j ACCEPT
    sudo iptables -A INPUT -d 127.0.0.1 -j ACCEPT
    sudo iptables -A INPUT -d 127.0.1.1 -j ACCEPT
    case $choice in
        0)
            echo '[+] PRIVATE NETWORK MODE'
            sudo iptables -A INPUT -m iprange --src-range 192.168.0.0-192.168.255.255 -j ACCEPT
            sudo iptables -A INPUT -m iprange --src-range 172.16.0.0-172.31.255.255 -j ACCEPT
            sudo iptables -A INPUT -m iprange --src-range 10.0.0.0-10.255.255.255 -j ACCEPT

            sudo iptables -A OUTPUT -m iprange --dst-range 192.168.0.0-192.168.255.255 -j ACCEPT
            sudo iptables -A OUTPUT -m iprange --dst-range 172.16.0.0-172.31.255.255 -j ACCEPT
            sudo iptables -A OUTPUT -m iprange --dst-range 10.0.0.0-10.255.255.255 -j ACCEPT

            sudo iptables -A INPUT -j DROP
            sudo iptables -A OUTPUT -j DROP

            echo 'Press enter to leave Private Network Mode'
            read ech0
            ;;
        1)
            echo '[+] HTB MODE'
            sudo iptables -A OUTPUT -p udp --dport 1337 -j ACCEPT
            sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
            sudo iptables -A INPUT -p udp --sport 1337 -j ACCEPT
            sudo iptables -A INPUT -p udp --sport 53 -j ACCEPT

            sudo iptables -A OUTPUT -p tcp --dport 9091 -j ACCEPT
            sudo iptables -A INPUT -p tcp --sport 9091 -j ACCEPT

            sudo iptables -A OUTPUT -o tun0 -j ACCEPT
            sudo iptables -A INPUT -i tun0 -j ACCEPT

            sudo iptables -A OUTPUT -j DROP
            sudo iptables -A INPUT -j DROP

            #sudo terminator -e 'sleep 10 && wireshark -i tun0 -k -z conv,ip,ip.src==10.10.10.0/24 -t r -Y "ip.src==10.10.10.0/24&&(tcp.flags.reset==0)"' &
            #sudo terminator -e 'cd /home/ech0/Documents/Github/blog/ && ifconfig | grep inet && python -m SimpleHTTPServer 9091'&
            alacritty -e sudo openvpn /home/nothing/Ech0777.ovpn
            ;;
        2)
            echo '[+] WEB BROWSING - RANDOM SERVER MODE'
            #sudo iptables -A INPUT -p tcp --sport 80 -j ACCEPT
            sudo iptables -A INPUT -p tcp --sport 443 -j ACCEPT
            sudo iptables -A INPUT -p udp --sport 53 -j ACCEPT

            #sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
            sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
            sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

            sudo iptables -A OUTPUT -j DROP
            sudo iptables -A INPUT -j ACCEPT
            sudo protonvpn c -r
            echo '[+] Press ENTER when you are done.'
            read ech0
            sudo protonvpn disconnect
            ;;
	3)
            echo '[+] WEB BROWSING - FASTEST SERVER MODE'
            #sudo iptables -A INPUT -p tcp --sport 80 -j ACCEPT
            sudo iptables -A INPUT -p tcp --sport 443 -j ACCEPT
            sudo iptables -A INPUT -p udp --sport 53 -j ACCEPT

            #sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
            sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
            sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

            sudo iptables -A OUTPUT -j DROP
            sudo iptables -A INPUT -j ACCEPT
            sudo protonvpn c -f
            echo '[+] Press ENTER when you are done.'
            read ech0
            sudo protonvpn disconnect
            ;;
        4)
            sudo iptables -A OUTPUT -j DROP
            sudo iptables -A INPUT -j ACCEPT
            echo '[+] Press enter to leave Invisible Listener Mode'
            read ech0
            ;;
        9)
            echo '[+] YOU ARE UNPROTECTED PRESS ENTER TO GO BACK TO SAFETY !'
            read ech0
            ;;
        *)
            echo '[+] PROMETHEUS'
            ;;
    esac
done
