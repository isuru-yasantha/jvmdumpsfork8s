#!/bin/bash
#This will be calling to thread dump script
wso2pid=$(jps | grep Bootstrap | cut -d" " -f1 | xargs)
/home/wso2carbon/scripts/thread-analyze.sh $wso2pid 3 5s
