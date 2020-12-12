#!/bin/bash
DEVICE=/dev/md0
IFS=
#DETAILS=$(sudo mdadm -- detail /dev/md0 | tr -s ' ')
DETAILS=$(cat docs/mdadm-1.txt)

RAID_DEVICES=$(echo -e $DETAILS | sed -nE 's/ Raid Devices : ([0-9]+)/\1/p')
TOTAL_DEVICES=$(echo -e $DETAILS | sed -nE 's/ Total Devices : ([0-9]+)/\1/p')
STATE=$(echo -e $DETAILS | sed -nE 's/ State : ([a-z]+)/\1/p')
DEVICES_STATE=$(echo -e $DETAILS | sed '1,/RaidDevice/d' | cut -d " " -f 6- | sed -nE 's/(.+) (.+)/\2,\1/p')

echo -e "${RAID_DEVICES}/${TOTAL_DEVICES}\nstate: $STATE\n$DEVICES_STATE"
