---
author: gerolfziegenhain
comments: true
date: 2013-06-02 12:57:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/06/02/xml-bandplan-structured-amateur-radio-bandplan/
slug: xml-bandplan-structured-amateur-radio-bandplan
title: XML Bandplan - Structured Amateur Radio Bandplan
wordpress_id: 95
categories:
- Ham Radio
---

As of today bandplan information for amateur radio is accessible in form of [various spreadsheets](http://www.darc.de/referate/vus/bandplaene/), PDFs or even in [Wikipedia](http://en.wikipedia.org/wiki/Amateur_radio_frequency_allocations). Of course this differs from country to country. Depending on the source, the bandplan may be outdated and it can be challenging to find a valid source for up-to-date information. While it is possible to find bandplan authoritative information on bandplan usage for the [three different IARU regions](http://en.wikipedia.org/wiki/International_Amateur_Radio_Union), the best-practices for the member countries are even more difficult to find. In short: the information is difficult to find, exists in various formats and is not at hand when you really need it.

For my [FT 817 remote control](http://8ch9azbsfifz.github.io/arduino_ft817/) project I was in need of a digital bandplan for my C source code. Instead of hacking the information into the corresponding C structures I chose a different approach: I created a [structured XML file](https://github.com/8cH9azbsFifZ/bandplan/blob/master/bandplans/40m.xml) with the bandplan information and used XSLT scripts to generate the corresponding C structures from the XML file:
<bandname="40m"author="DG6FL"created="20121109"valid="20130101"ref="DE02">
<countryname="DE"/>
</band>
Using (XSLT) scripts this information can be converted to [C source code](https://github.com/8cH9azbsFifZ/arduino_ft817/blob/master/examples/ft_817_remote/t_bandplan.h):
constt_bandbands[]={
{"2200m",13570,13780, NULL },
{"2200m: CW, QRSS, narrow digital modes",13570,13780, NULL },
{"160m",181000,185000, NULL },
};
Well I did not stop there: I implemented capabilities for handling different regions within the frequency bands, countries and licenses. In the XML files this looks like this:
<regionmin="7175000"max="7300000"bandwidth="2700"ref="US01">
<licensename="Amateur_Extra"ref="US01"/>
</region>
In addition to the obvious bandplan informations it was also helpful to create channels on particular frequencies. These channels can contain a name or a mode information, i.e. for switching the TRX automatically.
<channelname="PSK31"freq="7035000"ref="US02"><modename="Digital"/></channel>
During the implementation I realized, that all entries should have some generic information, i.e. the author of the entry, a version number, a timestamp and a reference. The references (i.e. HTML, PDF or spreadsheets) can be downloaded within the framework I have created, stored to the [git repository](https://github.com/8cH9azbsFifZ/bandplan) and checked for updates using MD5 sums. Checking the bandplans for possible changes is easily done now  using the toplevel makefile:
$ make check_references


For such a structured document it is very important, that its syntax is correct. Therefore I have described the document structure in a [DTD file](https://github.com/8cH9azbsFifZ/bandplan/blob/master/bandplans/bandplan.dtd). This DTD file is referenced in all the XML bandplan files:
<!DOCTYPE note SYSTEM "bandplan.dtd">
It is possible to check the syntax of all bandplans using the top level makefile:
$ make xmltest




## HTML Output


What can we do with this structured XML documents? Obviously I have used it for my Arduino project. Using this information source it is easy to create [HTML bandplans](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html), PDFs or structures in the programming language of your flavour for further work.
$ make html 


``



` `
<table style="font-family:Times;" >
<tbody >
<tr >

<td >Frequency (MHz)
</td>

<td >Bandwidth (kHz)
</td>

<td >Mode
</td>

<td >License
</td>

<td >Reference
</td>

<td >Comment
</td>
</tr>
<tr style="background-color:#777777;" >

<td style="padding-left:0;" >3.500 - 3.580
</td>

<td >2.700
</td>

<td >
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE02](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE02)
</td>

<td >
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.500 - 3.510
</td>

<td >0.200
</td>

<td >CW
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_Intercontinental QSO_
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.510 - 3.560
</td>

<td >0.200
</td>

<td >CW
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_Contest_
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.555
</td>

<td >
</td>

<td >CW
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**QRS**
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.560
</td>

<td >
</td>

<td >CW
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**QRP**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.560 - 3.580
</td>

<td >0.200
</td>

<td >CW
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.560
</td>

<td >
</td>

<td >CW
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**QRP**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.580 - 3.590
</td>

<td >0.500
</td>

<td >Digital
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_small bandwidth digital modes_
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.590 - 3.600
</td>

<td >0.500
</td>

<td >Digital
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_small bandwidth digital modes, automatic digital stations_
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.593
</td>

<td >
</td>

<td >WSPR
</td>

<td >
</td>

<td >[WSPR01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#WSPR01)
</td>

<td >**WSPR**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.600 - 3.620
</td>

<td >2.700
</td>

<td >All
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.620 - 3.650
</td>

<td >2.700
</td>

<td >All
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_SSB contest_
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.630
</td>

<td >
</td>

<td >Digital
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**Digital Speech**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.650 - 3.700
</td>

<td >2.700
</td>

<td >All
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.690
</td>

<td >
</td>

<td >SSB
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**QRP**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.700 - 3.800
</td>

<td >2.700
</td>

<td >All
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.735
</td>

<td >
</td>

<td >Digital
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**ATV**
</td>
</tr>
<tr style="background-color:#8888bb;" >

<td style="padding-left:32px;" >3.760
</td>

<td >
</td>

<td >
</td>

<td >
</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >**Emergency Region 1**
</td>
</tr>
<tr style="background-color:#999999;" >

<td style="padding-left:16px;" >3.775 - 3.800
</td>

<td >2.700
</td>

<td >All
</td>

<td >
<table >
<tbody >
<tr >

<td >Klasse_A: 750W (PEP)
</td>
</tr>
<tr >

<td >Klasse_E: 100W (PEP)
</td>
</tr>
</tbody>
</table>

</td>

<td >[DE01](http://8ch9azbsfifz.github.io/bandplan/html/bandplan.html#DE01)
</td>

<td >_Intercontinental QSO_
</td>
</tr>
</tbody>
</table>





` `




` `




## Summary


Now there is a structured document framework, which can handle all bandplan information. So far I have implemented US and german bandplans. We now have one source for all the information we need. The XML bandplan project is a building block for your future ideas and projects. Feel free to contact me and contribute ideas, converters, updates and bandplan content.

[Open Issues](https://github.com/8cH9azbsFifZ/bandplan/issues)
[Current Version (June 2013) v0.7.16](https://github.com/8cH9azbsFifZ/bandplan/tree/v0.7.16)

