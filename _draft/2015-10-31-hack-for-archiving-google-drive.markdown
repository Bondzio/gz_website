---
author: gerolfziegenhain
comments: true
date: 2015-10-31 11:48:04+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2015/10/31/hack-for-archiving-google-drive/
slug: hack-for-archiving-google-drive
title: Hack for Archiving Google Drive
wordpress_id: 531
categories:
- Nicht kategorisiert
---

Problem: Archiving of Google Drive documents does not work with the google drive app. Why? Google Drive App stores only links to the cloud (i.e. .gdoc, .gsheet). 
Solution: Write a script and use a cron job :)

`
#!/bin/bash
google_drive_dir="/home/my_user_name"
which gdrive >/dev/null || echo "Missing gdrive. Get it here: https://github.com/prasmussen/gdrive"
_archive_filetype () 
{
 from=$1
 to=$2
 find "$google_drive_dir" -name "*.$from" -print0 | while read -d $'\0' file
 do
  id=$(sed 's/.*"doc_id": "//;s/".*//' "$file")
  bd=$(dirname "$file")
  cd "$bd"
  gdrive download --id $id --format "$to" --force
 done
}

_archive_filetype gdoc docx
_archive_filetype gslides pdf 
_archive_filetype gsheet xlsx 
`
