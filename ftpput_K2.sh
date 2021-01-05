#!/bin/sh 

if [ $# -ne 2  ] 

then

    echo "Usage $0  <local_dir/filename> <remote_dir>"

    exit 1

fi

IP=t.7ze.top

FULLNAME=$1

DESTDIR=$2

 

local_filename=`basename $FULLNAME`

DESTFILE=$DESTDIR/$local_filename

 

ftp -i -n <<FTPIT
open $IP
user openwrt ranhouqinian2020
bin
passive
hash
cd /OpenwrtImgs/mt7620/K2/
mkdir "$(date +"%Y-%m-%d")"
cd "$(date +"%Y-%m-%d")"
put $FULLNAME $DESTFILE
quit
FTPIT

 

exit 0
