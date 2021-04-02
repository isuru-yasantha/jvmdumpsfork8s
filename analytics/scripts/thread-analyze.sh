#!/bin/bash

# This will take both thread dump and thread usage

# how to run:
# Switch to user ( wso2user)
# sh thread-analyze.sh <process_id> 10 5s
# this will take 10 thread dump with 5s intervals

threadlocation=/home/wso2carbon/dumps/Thread_dumps_"$HOSTNAME"_`date "+%F-%T"`
mkdir -p $threadlocation

if [ "$#" -ne 3 ]; then
echo "usage: sh thread-analyze.sh <pid> <number-of-dumps> <interval>"
exit
fi

count=$2
for i in `seq 1 $count`;
do
jstack -l $1 > $threadlocation/thread_dump_`date "+%F-%T"`.txt 
ps --pid $1 -Lo pid,tid,%cpu,time,nlwp,c > $threadlocation/thread_usage_`date "+%F-%T"`.txt 
if [ $i -ne $count ]; then
echo "sleeping for $3 [$i]"
sleep $3
fi
done

tar czvf $threadlocation.tar.gz $threadlocation
rm -rf $threadlocation
