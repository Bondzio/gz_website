---
author: gerolfziegenhain
comments: true
date: 2013-01-16 15:57:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2013/01/16/vw-rcd-200-autoradio-austauschen/
slug: vw-rcd-200-autoradio-austauschen
title: VW RCD 200 Autoradio austauschen
wordpress_id: 74
categories:
- Hardware
---

In diesem Artikel beschreibe ich kurz was zum Austausch des standardmäßig eingebauten Autoradios - hier RCD 200 - in einem VW Polo zu tun ist. Man benötigt nicht mehr als einen einfachen Stecker-Adapter für knapp 5€. Den Schluß, ob die üblichen Werkstätten (s.u.) aus finanziellen Gründen oder schlichter Inkompetenz unnötige Adapter für etwa 150€ anbieten überlasse ich dem Leser.





Kurzfassung: Diesen [VW Quadlock auf ISO Adapter](http://www.amazon.de/gp/product/B000M710QO/ref=cm_cr_rev_prod_title) kaufen, das rote Kabel des Adapters an den Pin im Quadlock-Stecker für Zündungsplus stecken (siehe Bilder unten).


## Der CAN-Bus:




Einen [CAN-Bus](http://de.wikipedia.org/wiki/Controller_Area_Network) Adapter wahlweise von einem Noname-Hersteller für 50€ oder von einem namhaften Autoradiohersteller für 150€ wollten mir eine wohlbekannte Werkstattskette, eine Vertragswerkstatt und eine freie Werkstatt andrehen. Dort sprachen die technischen Experten davon, man müsse das Auto für das neue Radio _anlernen,_ jede Lautsprecher-Box würde über _Netzwerk_ einzeln digital angesteuert oder das gesamte Auto könne gar kaputt gehen, weil der CAN-Bus durch fehlerhaften Anschluss zerstört würde. Interessanterweise war es in jedem dieser Fälle notwendig mit Auto und Autoradio persönlich vorstellig zu werden. Telefonisch ließ sich anhand der technischen Daten (Artikelbezeichnungen, Baujahr etc) keine Aussage entlocken.







Dabei ist die Sache viel einfacher: Der CAN-Bus _kann_ verwendet werden, um ein Radio mit zusätzlichen Informationen zu speisen - er _muss_ es aber nicht! Wieso dies auf Nachfrage von den technischen Experten negiert wird bleibt mir unklar. Zum Anschließen eines _normalen_ Autoradios (DVD, Touchscreen, Bluetooth, Freisprechanlage, etc) reicht ein einfacher Adapter vom Fahrzeugs- auf ISO-Stecker aus. Bei VW ist es ein Quadlock Adapter.







## Das Zündplus-Kabel:




Heute schalten sich Autoradios automatisch ein, wenn der Schlüssel steckt. Daher braucht es neben einer normalen Spannungsversorgung auch eine Leitung, genannt _Zündungsplus_, zu diesem Schalter. Da oftmals ein physischer Schalter fehlt ist dieses Kabel obligatorisch. Ein namhafter Unterhaltungselektronikhandel beispielsweise wollte mir ein _Zündpluskabel_ verlegen lassen und bietet Quadlock-ISO Adapter an, die ein loses rotes Kabel für diesen Zweck haben.







Eine einfache Frage an dieser Stelle: Wie soll denn das eingebaute Radio von VW funktionieren, wenn das offensichtlich notwendige Kabel nicht schon am Quadlock-Stecker vorhanden ist?







Dabei ist die Sache viel einfacher: Am [Quadlock-Stecker](http://en.wikipedia.org/wiki/Connectors_for_car_audio#Quadlock) ist das Zündungsplus bereits vorhanden (siehe Bilder: rot-schwarzes Kabel). Daher braucht es einfach einen Adapter der ein Kabel mit dem Pin für den Stecker hat.


<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://gerolfziegenhain.files.wordpress.com/2013/01/bildschirmfoto2013-01-12um10-38-07.png?w=280)](http://gerolfziegenhain.files.wordpress.com/2013/01/bildschirmfoto2013-01-12um10-38-07.png)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >Zündungsplus am VW Quadlock Stecker
</td>
</tr>
</tbody>
</table>
<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" >
<tbody >
<tr >

<td style="text-align:center;" >[![](http://gerolfziegenhain.files.wordpress.com/2013/01/bildschirmfoto2013-01-12um10-38-23.png?w=300)](http://gerolfziegenhain.files.wordpress.com/2013/01/bildschirmfoto2013-01-12um10-38-23.png)
</td>
</tr>
<tr >

<td style="text-align:center;" class="tr-caption" >Pin Belegung Zündungsplus am VW Quadlock Stecker
</td>
</tr>
</tbody>
</table>


## Wie wird das Radio also angeschlossen?


Diesen [VW Quadlock auf ISO Adapter](http://www.amazon.de/gp/product/B000M710QO/ref=cm_cr_rev_prod_title) kaufen, das rote Kabel des Adapters an den Pin im Quadlock-Stecker für Zündungsplus stecken (siehe Bilder oben). Für den Anschluss der Radioantenne wird ein weiterer Adapter mit Phantomspeisung benötigt. Diesen habe ich nicht verbaut, da ich das Autoradio allein mit meinem Telefon gekoppelt verwende.

