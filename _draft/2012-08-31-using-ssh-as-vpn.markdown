---
author: gerolfziegenhain
comments: true
date: 2012-08-31 21:53:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/08/31/using-ssh-as-vpn/
slug: using-ssh-as-vpn
title: Using SSH as VPN
wordpress_id: 53
categories:
- Linux
- OSX
---

One of the not so commonly known features of SSH is: you may use it for a poor man's VPN.


My Network 1   ---   Client   <---SSH--->   Server   --- My Network 2





**Conventions**


USER = username




HOST = ip of the server host




IDENTITY = ssh key file





**Preparation of the Server Side**
Edit the daemon configuration file and restart the sshd afterwards
#/etc/ssh/sshd_config
PermitTunnel yes
**
****Open the SSH session from the client side:**
sudo ssh -i $IDENTITY -F /home/$USER/.ssh/config -vvvw any:any root@$HOST true &





**Prepare the local tunnel and configure the routes on the client:**







sudo modprobe tun




sudo tunctl -t tun0 -u $USER




sudo ifconfig tun0 10.0.0.2 pointopoint 10.0.0.1




sudo route add -net 192.168.1.0 netmask 255.255.255.0 dev tun0




** **




**Prepare the remote tunnel and configure iptables on the server:**




cat << eof | ssh root@$HOST




modprobe tun




tunctl -t tun0 -u $USER




ifconfig tun0 10.0.0.1 pointopoint 10.0.0.2




echo 1 > /proc/sys/net/ipv4/ip_forward




iptables -t nat -A POSTROUTING -s 10.0.0.2 -j SNAT --to-source $SERVER_IP




iptables -A FORWARD -d 10.0.0.2 -j ACCEPT




eof
















## The whole script:










#!/bin/bash




 




HOST=




SERVER_IP=




USER=




IDENTITY=/home/$USER/.ssh/id_dsa




 




sudo ssh -i $IDENTITY -F /home/$USER/.ssh/config -vvvw any:any root@$HOST true &




sleep 5




tid=$(ps aux | awk '/ssh -i/{print$2;exit}')




 




echo "Prepare local tunnel"




sudo modprobe tun




sudo tunctl -t tun0 -u $USER




#sudo ifconfig tun0 up 10.0.23.2 netmask 255.255.255.252




sudo ifconfig tun0 10.0.0.2 pointopoint 10.0.0.1




sudo route add -net 192.168.1.0 netmask 255.255.255.0 dev tun0




 




echo "Prepare remote tunnel"




cat << eof | ssh root@$HOST




modprobe tun




tunctl -t tun0 -u $USER




#ifconfig tun0 up 10.0.23.1 netmask 255.255.255.252




ifconfig tun0 10.0.0.1 pointopoint 10.0.0.2




echo 1 > /proc/sys/net/ipv4/ip_forward




#iptables -t nat -A POSTROUTING -s 10.0.23.2 -j SNAT --to-source $SERVER_IP




#iptables -A FORWARD -d 10.0.23.2 -j ACCEPT




iptables -t nat -A POSTROUTING -s 10.0.0.2 -j SNAT --to-source $SERVER_IP




iptables -A FORWARD -d 10.0.0.2 -j ACCEPT




eof




 




echo "Press any key to kill (tid:$tid)"




read




sudo kill -KILL $tid




sudo rmmod tun




cat << eof | ssh root@$HOST 




rmmod tun




iptables -F




echo 0 > /proc/sys/net/ipv4/ip_forward




eof






