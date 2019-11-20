---
author: gerolfziegenhain
comments: true
date: 2012-09-24 19:29:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/09/24/network-properties-simulation-using-qdisc/
slug: network-properties-simulation-using-qdisc
title: Network Properties Simulation Using qdisc
wordpress_id: 61
categories:
- Linux
- Network
---

If you ever want to simulate bad transmission conditions (packet loss, latency, bandwidth, ...) in a network: there is a module built-in to the linux kernel named _qdisc_. More information can be found on [tldp.org](http://tldp.org/HOWTO/Traffic-Control-HOWTO/components.html).


 




## Examples




### Add _delay_ 80ms






tc qdisc add dev eth0 root netem delay 80ms





### Add delay with +-10ms _jitter_







tc qdisc add dev eth0 root netem delay 80ms 10ms




NB: For very large jitter, package order will be changed by _netem_. In order to disable this:




tc qdisc add dev eth0 root handle 1: netem delay 10ms 100ms






tc qdisc add dev eth0 parent 1:1 pfifo limit 1000


### Add _loss_ etc





tc qdisc add dev eth0 root netem delay 10ms 1ms distribution normal loss 2% duplicate 0.1%









### _Show_ current parameters


tc qdisc show dev eth0tc filter show dev eth0 


### More complex example:


Consider you have a machine connected on eth1 and eth2 in your network, which will be used to simulate the network conditions:
d1=eth1






d2=eth2




tc qdisc add dev $d1 root netem delay 50ms 2ms distribution normal loss 0.5% duplicate 0.1%




tc qdisc add dev $d2 root handle 1:0 htb default 15




tc class add dev $d2 parent 1:0 classid 1:1 htb rate 400mbit ceil 400mbit




##  




## Reset




Once you are done you may want to remove the filters again:








tc qdisc del dev eth0 root




tc qdisc show
