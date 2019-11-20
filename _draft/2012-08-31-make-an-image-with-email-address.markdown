---
author: gerolfziegenhain
comments: true
date: 2012-08-31 21:58:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/08/31/make-an-image-with-email-address/
slug: make-an-image-with-email-address
title: Make an Image with Email Address
wordpress_id: 57
categories:
- Linux
- OSX
---

This is a small piece of code to create an image from your Email address:

#!/bin/bash
echo $0 Name Emailaddress
[[ -z $2 ]] && exit 2
NAME=$1
shift
convert -size 250x30 xc:transparent -font Verdana -fill "#003399" -pointsize 16 -draw "text 5,15 'Email: $@'" $NAME-mail.png




