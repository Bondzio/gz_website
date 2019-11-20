---
author: gerolfziegenhain
comments: true
date: 2012-08-31 21:56:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/08/31/scan-pdf-from-commandline/
slug: scan-pdf-from-commandline
title: Scan PDF from Commandline
wordpress_id: 55
categories:
- Linux
- OSX
---

In the following I show a small piece of code to scan PDF files from commandline:

#!/bin/bash
cat << EOF 
--- $0 --- Scan Images -> PNG-Archive & PDF
Parameters:
   (1) Name
   -> Scanning: counter_start counter_increment
   -> Postprocessing: 
      -rotate (by 90 deg)
      -gray (keep it grayscale)
EOF

function DIE { echo "$@">&2; exit -1; }
function is_installed {
   while [[ -n $1 ]]; do
      [[ -z $( type -p $1  ) ]] && DIE "missing: $1"
      shift
   done
}
#is_installed convert pdftk scanimage

[[ -z $1 ]] && DIE "missing name"
NAME=$1
shift

if [[ -n $2 ]]; then
   CNT=$1
   CNT_INC=$2
   shift 2

   MODE=Lineart
   RES=300
   echo "Scanning images"
   scanimage --batch=$NAME"_%d".tif --batch-increment $CNT_INC --batch-start $CNT --source ADF --mode $MODE --resolution $RES -x 210 -y 297 -v
   exit
fi

#unpaper --layout double --output-pages 2
#http://unpaper.berlios.de/unpaper.html





ROTATE=""




GRAY="-threshold 50%"




while [[ -n $1 ]]; do




   case $1 in 




      -rotate) ROTATE="-rotate 90"; shift; ;;




      -gray) GRAY=""; shift; ;;




      *) shift; ;;




   esac




done




 




echo "Processing images:"




for FILE in $NAME*tif; do




   echo "Processing "$FILE":"




   PREFIX=`echo $FILE | sed 's/.tif//g'`




   LIMITS="-limit memory 512 -limit map 512"




   PAGE="$ROTATE -page a4 +repage"




   COMPRESSION="-compress Group4"




   #[[ ! -e $PREFIX.png ]] && convert $LIMITS $GRAY -monitor $FILE $PREFIX.png




   [[ ! -e $PREFIX.pdf ]] && convert $LIMITS $PAGE $GRAY $COMPRESSION -monitor $FILE $PREFIX.pdf




done




 




echo "Creating PDF"




CNT_MAX=`find -name "$NAME*pdf" | tr -cd 0-9"\n" | awk '$1>max{max=$1}END{print max}'`




FILES=""




for I in `seq 1 $CNT_MAX`; do FILES=$FILES" ${NAME}_$I.pdf"; done;




pdftk $FILES cat output $NAME.pdf




 




echo "Creating archive"




#tar cvjf ${NAME}_png.tar.bz2 ${NAME}*png




tar cvjf ${NAME}_tif.tar.bz2 ${NAME}*tif




 




echo "Cleanup"




rm ${NAME}_*.pdf *tif #*png









