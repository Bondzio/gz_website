---
author: gerolfziegenhain
comments: true
date: 2016-09-24 12:53:31+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2016/09/24/lightify-lampen-mit-hue-verwenden/
slug: lightify-lampen-mit-hue-verwenden
title: Lightify Lampen mit Hue verwenden
wordpress_id: 545
categories:
- Hardware
---

Für den Preis einer Hue Lampe sind zwei Lightify Lampen zu haben, doch das Hue System ist verbreiteter... Wie lässt sich eine Lightify Lampe in ein Hue System einbinden?

Die Lightify Lampen (Osram) verwenden, wie auch die Hue Lampen (Philips), das Zigbee Protokoll. Die Implementierungen sind nicht standardisiert, weshalb beispielsweise die Kopplung über Seriennummern oder das vollständige Ausschalten der Lampen dank unterschiedlich realisierter Parameter nicht direkt funktioniert. Die Hersteller sind bemüht die Kompatibilität mit Firmware-Updates sicherzustellen.

So funktioniert das Einbinden der Lightify Lampen:



	
  1. Falls die Lampen zuvor mit der Hue Bridge gekoppelt waren, dann:
Reset der Lampen: 5x hintereinander die Lampe jeweils (a) 5 Sekunden an, dann (b) 5 Sekunden aus

	
  2. Verbinden der Lampen zur Lightify Bridge über die Lightify App
(Die Bridge wird nur für das Firmware Update benötigt)

	
  3. Firmware Update der Lampen auf neuste Version durchführen

	
  4. Reset der Lampen: 5x hintereinander die Lampe jeweils (a) 5 Sekunden an, dann (b) 5 Sekunden aus

	
  5. Lampen einschalten

	
  6. In Hue App nach neuen Lampen suchen
=> Die Lampen tauchen auf und lassen sich vollständig ausschalten!


