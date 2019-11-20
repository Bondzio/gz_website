---
author: gerolfziegenhain
comments: true
date: 2013-03-02 13:35:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/03/02/start-vnc-server-on-osx-from-commandline/
slug: start-vnc-server-on-osx-from-commandline
title: Start VNC Server on OSX from Commandline
wordpress_id: 77
categories:
- Apple
- OSX
- VNC
---

The builtin VNC server can be started using commandline (i.e. with ssh). As root do:

cd /Library/Preferences
echo enabled > com.apple.ScreenSharing.launchd
touch /etc/ScreenSharing.launchd

