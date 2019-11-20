---
author: gerolfziegenhain
comments: true
date: 2015-02-08 09:41:08+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2015/02/08/connect-morse-key-to-iphone/
slug: connect-morse-key-to-iphone
title: Connect Morse Key to Iphone
wordpress_id: 513
categories:
- Ham Radio
- iOS
- Morse Code
---

How to connect morse key to an iPhone? Using the buttons on the standard headphones does not work, as the apple interface does not provide low-level access to low-level events like button-down. The idea (R1, R2) will be (1) put a signal to one stereo channel (2) receive the same signal on the input channel (small resistor will simulate mic) (3) detect tone level changes for input channel -> real time-morse (4) put side-tone & co to remaining stereo channel. 

[![Pasted Graphic](https://gerolfziegenhain.files.wordpress.com/2015/02/pasted-graphic.png?w=170)](https://gerolfziegenhain.files.wordpress.com/2015/02/pasted-graphic.png)



	
  * 1(Tip) - Key (Ground)


  * 2 - Ear (Contact)

	
  * 3 - Ear (Ground)

 
  * 4(Ground) - R2(46,6k) - Key 1
 
  * 4(Ground) - R3(22k) - Key 2
 
  * 4(Ground) - R1(1k) - 3
 

I got a prototype running with irmc-ios (R4) and the same physical interface also works with iMorsix (R3).
[![IMG_0188](https://gerolfziegenhain.files.wordpress.com/2015/02/img_0188.jpg?w=300)](https://gerolfziegenhain.files.wordpress.com/2015/02/img_0188.jpg)

(R1) [Hijacking Power from [...] Audio Interface](https://web.eecs.umich.edu/~prabal/pubs/papers/kuo10hijack.pdf)
(R2) [Sources: hijack-main](https://code.google.com/p/hijack-main/)
(R3) [App: iMorsix](http://www.ilt.ch/108171/index.html)
(R4) [App: irmc-ios](https://github.com/8cH9azbsFifZ/irmc-ios)
