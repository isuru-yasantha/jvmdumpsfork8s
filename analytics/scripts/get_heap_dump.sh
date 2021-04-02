#!/bin/bash

# This will take heap dump
wso2pid=$(jps | grep Main | cut -d" " -f1 | xargs)
heaplocation=/home/wso2carbon/dumps/Heap_dump_"$HOSTNAME"_`date "+%F-%T"`
mkdir -p $heaplocation

jmap -dump:file=$heaplocation/heapdump $wso2pid

tar czvf $heaplocation.tar.gz $heaplocation
rm -rf $heaplocation
