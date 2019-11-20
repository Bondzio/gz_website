---
author: gerolfziegenhain
comments: true
date: 2013-04-06 09:20:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/04/06/time-machine-local-snapshots/
slug: time-machine-local-snapshots
title: Time Machine & Local Snapshots
wordpress_id: 81
categories:
- Apple
- OSX
- Time Machine
---

Time machine can keep _local snapshots_. While this feature is useful if you travel and don't have access to your Time Capsule, the local snapshots can consume a lot of the local disk space in /.MobileBackups. There is a complex [Removal Algorithm](http://support.apple.com/kb/PH11394) for old local snapshots based on the remaining free disk space.

To find out how much space your local snapshots consume ([Local Snapshots](http://support.apple.com/kb/HT4878)):



	
  * Apple-Logo → About This Mac → Further Information → Storage: Backup == Local Snapshot Space

	
  * Alternatively from commandline:
test -d /.MobileBackups && du -hcs /.MobileBackups


It is useful to control the behavior of the local snapshots yourself ([Controlling Local Snapshots](http://blog.pythonaro.com/2012/09/free-disk-space-by-removing-timemachine.html)) using tmutil disablelocal and tmutil enablelocal.
