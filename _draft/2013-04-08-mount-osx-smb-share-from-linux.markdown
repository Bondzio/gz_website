---
author: gerolfziegenhain
comments: true
date: 2013-04-08 18:03:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/04/08/mount-osx-smb-share-from-linux/
slug: mount-osx-smb-share-from-linux
title: Mount OSX SMB Share From Linux
wordpress_id: 82
categories:
- OSX
---

A small reminder for all the options:
mount.cifs //1.2.3.4/public /mnt/public -o user=myusername,password=mypassword,nounix,sec=ntlmssp,noperm,rw

