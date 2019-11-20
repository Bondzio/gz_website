---
author: gerolfziegenhain
comments: true
date: 2013-04-13 16:13:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/04/13/raspi-as-wspr-transmitter/
slug: raspi-as-wspr-transmitter
title: Raspi As WSPR Transmitter
wordpress_id: 85
categories:
- Ham Radio
- QRP
- Raspi
- WSPR
---

Recently the [Raspberry Pi (Raspi)](http://www.raspberrypi.org/) has gained much interest in the Ham Radio community. One interesting things is: the I/O pins provide access to a clock signal (GPCLK0) and it is possible to modulate this clock signal via software. This has motivated Guido Ten Dolle (PE1NZZ) to implement a [WSPR](http://wsprnet.org/drupal/) transmitter and to publish the sources under GPL. Within the last days I have made some minor modifications to the [WsprryPi](https://github.com/8cH9azbsFifZ/WsprryPi) sources, built a [30m QRP filter](http://www.gqrp.com/harmonic_filters.pdf) using the ugly method and connected everything to my [doublet antenna](http://www.norcalqrp.org/files/NorCalDoubletAntenna.pdf).
<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://gerolfziegenhain.files.wordpress.com/2013/04/3ee88-img_1521.jpg)](http://3.bp.blogspot.com/-mdpcbdJ_x1Q/UWl9mIZ87_I/AAAAAAAAyx8/bQxm3s3GBD0/s1600/IMG_1521.JPG)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >Raspi as WSPR Transmitter
</td>
</tr>
</tbody>
</table>
Immediately my 10mW have been received in 743km distance by G6HUI ([WSPR Spots](http://wsprnet.org/drupal/wsprnet/spots)):
<table style="background-color:white;border-collapse:collapse;color:black;font-family:Arial, Verdana, sans-serif;font-size:13px;line-height:16px;" >
<tbody style="border:none;" >
<tr >
Timestamp
Call
MHz
SNR
Drift
Grid
Pwr
Reporter
RGrid
km
az
</tr>
<tr >

<td align="right" > 2013-04-13 15:30
</td>

<td align="left" > DG6FL
</td>

<td align="right" > 10.140199
</td>

<td align="right" > -16
</td>

<td align="right" > -1
</td>

<td align="left" > JO40cb
</td>

<td align="right" > 0.01
</td>

<td align="left" > G6HUI
</td>

<td align="left" > IO81wl
</td>

<td align="right" > 743
</td>

<td align="right" > 286
</td>
</tr>
</tbody>
</table>
<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://gerolfziegenhain.files.wordpress.com/2013/04/828f3-wspr_dg6fl_us.png)](http://1.bp.blogspot.com/-A0-cBH19YVU/UXVjNVPmCbI/AAAAAAAAy9M/isTdCAehaBI/s1600/wspr_dg6fl_us.png)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >7869km with 10mW
</td>
</tr>
</tbody>
</table>






<table style="background-color:white;border-collapse:collapse;color:black;font-family:Arial, Verdana, sans-serif;font-size:13px;line-height:16px;" >
<tbody style="border:none;" >
<tr >
Timestamp
Call
MHz
SNR
Drift
Grid
Pwr
Reporter
RGrid
km
az
</tr>
<tr >

<td align="right" > 2013-04-22 05:02
</td>

<td align="left" > DG6FL
</td>

<td align="right" > 10.140238
</td>

<td align="right" > -21
</td>

<td align="right" > 1
</td>

<td align="left" > JO40cb
</td>

<td align="right" > 0.01
</td>

<td align="left" > W4AC
</td>

<td align="left" > EL86
</td>

<td align="right" > 7869
</td>

<td align="right" > 289
</td>
</tr>
</tbody>
</table>
Information on how to do this yourself can be found in the [WsprryPi](https://github.com/8cH9azbsFifZ/WsprryPi) repository.

