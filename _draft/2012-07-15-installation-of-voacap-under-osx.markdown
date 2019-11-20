---
author: gerolfziegenhain
comments: true
date: 2012-07-15 18:23:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/07/15/installation-of-voacap-under-osx/
slug: installation-of-voacap-under-osx
title: Installation of VOACAP under OSX
wordpress_id: 44
categories:
- Ham Radio
- OSX
- Voacap
---







Voacap is a tool for "HF Propagation Prediction and Ionospheric Communications Analysis" (1). In the following article I describe the steps to take in order to install the software under OSX. 





<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://www.voacap.com/voacap-hf-propagation-prediction-service-coverage-map.jpg)](http://www.voacap.com/voacap-hf-propagation-prediction-service-coverage-map.jpg)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >VOACAP Online
</td>
</tr>
</tbody>
</table>










## Build & Installation of Voacap




For the installation of the voacap commandline tools you can follow the steps mentioned in (2). Nevertheless I show the essential commands here:




wget http://www.qsl.net/hz1jw/voacapl/downloads/voacapl-0.5.8.tar.gz




tar xzf voacapl-0.5.8.tar.gz 
cd voacapl-0.5.8
./configure




make




sudo make install






### Copy the Basic Configuration & Example Files




If you are new to voacap it is useful to start with some example files. Voacap expects them in its standard directory ~/itshfbc. The files can be copied manually:




cp -rv /usr/local/share/voacapl/itshfbc ~/






### Testing the Installation 


cd ~/itshfbc


First test:
voacapl -s ~/itshfbc/ voacapx.dat




No output on screen? <= Ok :)




Something should be in this file:




cat run/voacapx.out 


Our second test is an area coverage analysis:


voacapl -s ~/itshfbc/ area calc default/default.voa







cat areadata/default/default.vg1 









## 




## Further Reading








	
  1. [voacap.com](http://www.voacap.com/)

	
  2. [OSX Installation Instructions](http://www.voacap.com/voacap-for-mac-osx.html)

	
  3. [What is Voacap trying to tell me? (N6BV)](http://www.yccc.org/Articles/N6BV/Propagation%20Milford%20CT%202003.pdf)









