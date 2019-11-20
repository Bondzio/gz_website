---
author: gerolfziegenhain
comments: true
date: 2012-08-31 22:04:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2012/08/31/creating-an-envelope-from-commandline-using-latex/
slug: creating-an-envelope-from-commandline-using-latex
title: Creating an Envelope from Commandline Using LaTeX
wordpress_id: 58
categories:
- Linux
- OSX
---

This small piece of code will create an envelope from commandline...

#!/bin/zsh

MYADDRESS = "Mr X // Street 1 // ZIP"

usage() {
   echo "$0 - print envelopes using LaTeX"
   echo "   address:   Mr. A // Street 123 // ZIP City, State // Country"
   echo "   -f <a4,c4,c5,c6,dl> default: $fomat"
   echo "         a4: a4              "
   echo "         c4: a4              "
   echo "         c5: a4 folded in 1/2"
   echo "         c6: a4 folded in 1/4"
   echo "         dl: a4 folded in 1/3"
   exit 0
}

while getopts "f:h" opt; do
   case $opt in
      f) format=$OPTARG; ;;
      h) usage; ;;
   esac
done
shift $(($OPTIND -1))

if [[ $format == c6 ]]; then
   lx=114mm
   ly=162mm
elif [[ $format == c5 ]]; then
   lx=162mm
   ly=229mm
elif [[ $format == a4 ]]; then
   lx=210mm
   ly=397mm
elif [[ $format == c4 ]]; then
   lx=229mm
   ly=324mm
elif [[ $format == dl ]]; then
   lx=100mm
   ly=210mm
else
   exit 1
fi


ADDRESS=${@//\/\//\\newline}
MYADDRESS=${MYADDRESS//\/\//\/}

[[ -z $ADDRESS ]] && usage

TMP=$(mktemp -d /tmp/envelope-XXXXXX)
cd $TMP

cat << eof > envelope.tex
\documentclass{article}
\usepackage[margin=0.2cm,top=0.7cm,papersize={$lx,$ly},landscape,twoside=false]{geometry}
\usepackage{oldgerm}
\usepackage[latin1]{inputenc}

\setlength\parskip{0pt}
\pagestyle{empty}

\def\myaddress{$MYADDRESS}
\def\address{$ADDRESS}

\begin{document}





\begin{minipage}{\textwidth}




{\fontencoding{U}\fontfamily{yswab}\fontseries{m}\fontshape{n}\selectfont




\myaddress 




}




\end{minipage} 




 




\Large




\vspace{$((${lx/mm/}-60))mm}




\setlength\parindent{$((${ly/mm/}/2))mm}




 




\begin{minipage}{\textwidth}




\address




\end{minipage}




 




\end{document}




eof




 




pdflatex envelope.tex




lpr -o Duplex=None -o Manualfeed=On -o InputSlot=Envelope -o PageSize=Custom.${lx/mm/}x${ly} -o PageRegion=Custom.${lx/mm/}x${ly} -Penvelope envelope.pdf




rm -rf $TMP









