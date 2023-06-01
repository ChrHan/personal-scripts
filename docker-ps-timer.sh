#!/bin/bash

# how to run:
# docker desktop: /Applications/Docker.app/Contents/MacOS/Docker &  ./docker-ps-timer.sh

docker ps
EXIT_STATUS=$?
# found by accident that SECONDS is a built-in variable
# https://stackoverflow.com/questions/74250921/variable-named-as-seconds-in-bash-script-automatically-changes-after-sleep-is
# SECONDS=0

while [ ${EXIT_STATUS} -eq 1 ]
do 
    # SECONDS=`expr ${SECONDS} + 1`
    echo "${SECONDS} seconds passed so far..."
    echo "sleeping for 1 seconds"
    sleep 1
    docker ps
    EXIT_STATUS=$?
done

echo "${SECONDS} seconds passed until docker ps succeeds!"