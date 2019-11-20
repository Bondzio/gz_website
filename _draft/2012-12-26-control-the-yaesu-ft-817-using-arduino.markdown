---
author: gerolfziegenhain
comments: true
date: 2012-12-26 23:07:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/12/26/control-the-yaesu-ft-817-using-arduino/
slug: control-the-yaesu-ft-817-using-arduino
title: Control the Yaesu FT 817 Using Arduino
wordpress_id: 70
categories:
- Arduino
- Ham Radio
---

Recently the Arduino microcontroller has become famous for controlling rigs. When it comes to the Yaesu FT817 there exist controllers for [satellite operation](http://code.google.com/p/qrptracker/) (VE9RQP), for loop antenna tuners ([WW3WW](http://www.alain.it/2012/02/10/ft-817-automatic-loop/)) and for transverters ([IZ0MJE](http://tarapippo.blogspot.it/2011/06/interfaccia-ft817-transverter-con_18.html)). During the development of the [xmlbandplan.org](http://xmlbandplan.org/) project I was in need of a hardware to play with some features. The idea of an Arduino controller library for the FT817 was born. Based upon the sources mentioned above and the [Hamlib](http://sourceforge.net/apps/mediawiki/hamlib/index.php?title=Main_Page) implementation for this rig I have created a library for controlling the FT817 from an Arduino (the sources are available on [github](http://8ch9azbsfifz.github.com/arduino_ft817/)). More details on the usage and installation of this library can be found in the source tree.
<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://8ch9azbsfifz.github.com/arduino_ft817/hardware/prototype.png)](http://8ch9azbsfifz.github.com/arduino_ft817/hardware/prototype.png)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >Arduino Controller for FT817 with GPS
</td>
</tr>
</tbody>
</table>



As the main focus was to play with the bandplan information I have also soldered a little bit (see hardware setup below) and wrote a piece of software (sources are in examples/ft_817_remote/) which uses the library. Once the CAT interface is connected to the serial pins it is easy to read out the frequency and from there it is straight forward now to display band and channel information. The corresponding data structures for band and channel information can be created automatically from the xmlbandplan files. Ready-to-use header files are contained in the repositiory.

In addition to the rig I have also connected a GPS receiver to one of the serial ports on the Arduino. Remark: Initially I have used an Arduino Uno for this experiment. It is not possible to use two SoftwareSerial ports at once: only one port can be active at a time. The Arduino Mega on the other hand provides enough hardware ports for my purpose. Now the GPS information can be merged: it is possible to display the current distance to the selected repeater (i.e. DB0VA in the image above) or even to create adaptive channel lists based on the position.


## Feature List


In the current state of the experiment the following features have been realized:



	
  * Display

	
    * Frequency & mode

	
    * Channel & band name

	
    * Signal level

	
    * Maidenhead Locator & distance to repeater




	
  * Operating Modes

	
    * Watchdog (multiple channels)

	
    * Switch channels (using buttons & rotary encoders)

	
    * Gestures (frequency browsing, watchdog mode, ...)

	
    * Scanning

	
    * Automatic mode selection based on channel







## Hardware setup





	
  * [Adafruit GPS](http://www.watterott.com/de/Adafruit-Ultimate-GPS-Breakout-66-channel)

	
  * [Arduino Mega](http://arduino.cc/en/Main/ArduinoBoardADK)

	
  * [Adafruit I2C LCD](http://www.watterott.com/de/Adafruit-I2C-Controlled-Keypad-Shield-Kit-for-16x2-LCD)

	
  * Rotary Encoders

	
  * Pushbuttons


The wiring information can be found [here](https://raw.github.com/8cH9azbsFifZ/arduino_ft817/master/hardware/wiring.txt) and in this [picture](https://raw.github.com/8cH9azbsFifZ/arduino_ft817/master/hardware/wiring.png).


## Outlook


During the further development of the [xmlbandplan.org](http://xmlbandplan.org/) project it became clear, that the complete band plan information (repeater lists etc) will use more storage, than the Arduino provides. Even though I have experimented with a SD card reader and thought about soldering some RAM my conclusion is, that for the upcoming development I need more power. Therefore I have switched to a Raspberry Pi :) Nevertheless I guess the FT817 controller library and probably even my example controller could be a good starting point for further experiments.

