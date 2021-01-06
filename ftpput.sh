#!/bin/sh 

if [ $# -ne 6  ] 

then

    echo "Usage $0 <FTPServerAddress> <FTP_UserName> <FTP_Password> <MainTargetPath> <local_dir/filename> <remote_dir>"

    exit 1

fi

IP=$1

FTP_USERNAME=$2

FTP_PSW=$3

TargetPath=$4

FULLNAME=$5

DESTDIR=$6

 

local_filename=`basename $FULLNAME`

DESTFILE=$DESTDIR/$local_filename

 

ftp -i -n <<FTPIT

open $IP

user $FTP_USERNAME $FTP_PSW

bin

passive

hash

cd $TargetPath
mkdir "$(date +"%Y-%m-%d")"
cd "$(date +"%Y-%m-%d")"

put $FULLNAME $DESTFILE

quit

FTPIT

exit 0
