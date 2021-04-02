#!/bin/bash

wso2pid=$(jps | grep Main | cut -d" " -f1 | xargs)
/home/wso2carbon/scripts/thread-analyze.sh $wso2pid 3 5s
