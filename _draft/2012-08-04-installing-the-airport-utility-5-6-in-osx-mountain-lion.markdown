---
author: gerolfziegenhain
comments: true
date: 2012-08-04 14:16:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/08/04/installing-the-airport-utility-5-6-in-osx-mountain-lion/
slug: installing-the-airport-utility-5-6-in-osx-mountain-lion
title: Installing the AirPort Utility 5.6 in OSX Mountain Lion
wordpress_id: 51
categories:
- Apple
- OSX
- Workaround
---

Some of the older AirPort devices will not work with current versions of the AirPort Utility and old versions cannot be installed on OSX Mountain Lion (yet).  The old version can be installed manually in parallel to the new version:

cd ~/Downloads
wget http://support.apple.com/downloads/DL1482/en_US/AirPortUtility56.dmg
hdiutil attach AirPortUtility56.dmg
pkgutil --expand /Volumes/AirPortUtility/AirPortUtility56.pkg ~/Downloads/AirPortUtility56
gunzip -c < ~/Downloads/AirPortUtility56/AirPortUtility56Lion.pkg/Payload |  tar -xvf -
sudo mv Applications/Utilities/AirPort\ Utility\ 5.6.app /Applications/Utilities/




