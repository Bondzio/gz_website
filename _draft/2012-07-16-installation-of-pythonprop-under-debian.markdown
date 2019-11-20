---
author: gerolfziegenhain
comments: true
date: 2012-07-16 17:02:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/07/16/installation-of-pythonprop-under-debian/
slug: installation-of-pythonprop-under-debian
title: Installation of pythonProp under Debian
wordpress_id: 46
categories:
- Ham Radio
- Linux
- Voacap
---

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://gerolfziegenhain.files.wordpress.com/2012/07/38741-test.png)](http://gerolfziegenhain.files.wordpress.com/2012/07/test.png)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >Example Area Calculation
</td>
</tr>
</tbody>
</table>
In this article I describe how to install pythonProp under Debian (squeeze) linux.


## Prerequisites




### Installing Voacapl




Follow the instructions given in this [article](http://gerolfziegenhain.blogspot.de/2012/07/installation-of-voacap-under-osx.html).







### Preparing Python




In the first step we prepare the build environment:





apt-get install libgeos-dev 





apt-get build-dep python-matplotlib










### Building Basemap




Now we can download and install the basemap toolkit - it is not included in Debian (squeeze):







wget http://sourceforge.net/projects/matplotlib/files/matplotlib-toolkits/basemap-1.0.3/basemap-1.0.3.tar.gz




tar xzf basemap-1.0.3.tar.gz




cd basemap-1.0.3




sudo python setup.py sdist




 




### Building Matplotlib 




As the matplotlib version supplied with Debian (squeeze) does not work, we download and install the matplotlib manually: 




 







wget http://sourceforge.net/projects/matplotlib/files/matplotlib/matplotlib-1.0/matplotlib-1.0.0.tar.gz







tar xzf matplotlib-1.0.0.tar.gz 










cd matplotlib-1.0.0/







python setup.py build







sudo python setup.py install







 




## Installing pythonProp




Now we can install pythonProp manually:










wget http://downloads.sourceforge.net/project/pythonprop/pythonprop-0.10.tar.gz




tar xzf pythonprop-0.10.tar.gz
cd pythonprop-0.10
autoreconf
./configure
sudo make install










To see whether everything is ok, run




 




voacapgui







 




## References








	
  1. [pythonProp (HZ1JW)](http://www.qsl.net/hz1jw/pythonprop/index.html)






