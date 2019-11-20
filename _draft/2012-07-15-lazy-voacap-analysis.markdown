---
author: gerolfziegenhain
comments: true
date: 2012-07-15 16:33:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/07/15/lazy-voacap-analysis/
slug: lazy-voacap-analysis
title: Lazy VOACAP Analysis
wordpress_id: 43
categories:
- Ham Radio
- Voacap
---

If you want to save your time by not installing voacap on your computer, you still can use the online tool for coverage analysis ([voacap.com](http://www.voacap.com/coverage.html)). You can even automate this using a small shell script to build a PDF file with your HF propagation simulation.

Please note: The following script is provided for educational purpose only.


## Prerequisites








	
  * ImageMagick

	
  * wget







## Script





#!/bin/sh
tt=$(date -u +"%Y %m %H")
year=$(echo $tt | awk '{print$1}')
month=$(echo $tt | awk '{print$2}')
time=$(echo $tt | awk '{print$3}')
txlat=12.123
txlon=2.816
txname=myname
txmode=24 #24=cw 38=ssb 49=am
rxantenna=d10m.ant #txantenna=isotrope.ant
_get_txband ()
{
 tmp=out.html
 filename=$txname-$year-$month-$time-${txband}MHz-${txpower}kW.png
 echo $filename
 echo $filename>&2
 test -e $filename && return
 wget -k -O $tmp "http://www.voacap.com/area.php?year=$year&month=$month&time=$time&TDX=9999&txname=$txname&txlat=$txlat&txlon=$txlon&txantenna=$txantenna&txpower=$txpower&txmode=$txmode&es=noes&band=$txband&path=Short&rxantenna=$rxantenna" 2>/dev/null
 img_url=$(cat $tmp | grep img |sed 's/.*src="//;s/".*//g')
 wget -O $filename $img_url 2>/dev/null
 rm $tmp
}
# Some example loops for data extraction
_loop_outdoor ()
{
 txpower=0.005 #kW
 for time in 0 2 4 6 8 10 12 14 16 18 20 22; do
  txantenna=v14.ant
  for txband in 7.030 10.116 14.060; do #MHz
   files=$files" "$(_get_txband)
  done
 done
}
_loop_shack ()
{
 for txpower in 0.005 0.010 0.050; do #kW
  txantenna=d10m.ant
  for txband in 3.560 7.030 10.116 14.060 18.086 21.060 24.906 28.060; do #MHz
   files=$files" "$(_get_txband)
  done
 done
}
_loop_outdoor
pdfname="$txname-"$(echo $tt |sed 's/ /-/g')".pdf"
echo convert $(echo $files) $pdfname




