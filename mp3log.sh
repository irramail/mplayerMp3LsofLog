#!/bin/sh
oldpidname="qwe"
name="nothing"
while true
do
	pid=`lsof -n -w | grep mp3| grep upload | grep mplayer | awk '{printf $2}'`
	name=`lsof -n -w | grep mp3 | grep upload | grep mplayer | sed "s/^.*upload.//"`
	pidname="$pid $name"
	#echo $pidname
	if [ "$pidname" != "$oldpidname" ]
	then
	#	echo set
		lsof -n -w | grep mp3 | grep upload | grep mplayer >> ~/log/$(date "+%F").log
		oldpidname=$pidname
	fi
	sleep 5
done
