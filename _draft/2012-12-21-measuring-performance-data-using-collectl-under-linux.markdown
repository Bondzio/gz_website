---
author: gerolfziegenhain
comments: true
date: 2012-12-21 16:57:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/12/21/measuring-performance-data-using-collectl-under-linux/
slug: measuring-performance-data-using-collectl-under-linux
title: Measuring Performance Data Using Collectl Under Linux
wordpress_id: 66
categories:
- Linux
- Performance
---



Using the tool [collectl](http://collectl.sourceforge.net/) it is possible to measure a number of performance indicators under Linux. Particularly interesting are the methods to measure properties like CPU and memory consumption per taks / thread.


## Example Code


// Filename: example.c
#include <stdio.h>
#include <pthread.h>
#include <math.h>
#include <stdlib.h>
void *f1(void *arg) {
while (1) {
usleep(1);
printf("f1\n");
}
return NULL;
}
void *f2(void *arg) {
while (1) {
usleep(1);
float j = sqrt(cos(sin(1.2)));
printf("stuff: %f\n",j);
}
return NULL;
}

int main(void) {
pthread_t p1,p2;
pthread_create(&p1,NULL,f1,"f1...");
pthread_create(&p2,NULL,f2,"f2...");

while (1) {
float i = sqrt(1.2);
printf("main stuff: %f\n",i);
}
pthread_join(p1, NULL);
pthread_join(p2, NULL);
return 0;
}


## 




## Compile the code


gcc -lm -lpthreads example.c





## 




## Running Collectl


sh-4.1$ collectl -sZ -i5:10 --procopts t

waiting for 10 second sample...

### RECORD 1 >>> machine <<< (1355908840.001) (Wed Dec 19 10:20:40 2012) ###

# PROCESS SUMMARY (counters are /sec)
# PID User PR PPID THRD S VSZ RSS CP SysT UsrT Pct AccuTime RKB WKB MajF MinF Command
.......
25989 5053 20 17675 2 S 28M 636K 3 1.20 0.41 16 0:02.14 0 0 0 0 ./a.out
25990+ 5053 20 25989 2 S 28M 636K 3 0.43 0.05 4 0:00.63 0 0 0 0 a.out
25991+ 5053 20 25989 2 S 28M 636K 3 0.33 0.13 4 0:00.60 0 0 0 0 a.out
.......






