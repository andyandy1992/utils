#!/usr/bin/bash

# This script pings google.com every so often - is a successful ping, nothing happens, otherwise a "beep" is produced (and potentially email sent).
# A similar router process is also used to check.

NUM_SECONDS_BETWEEN_CHECKS=5
INTERNET_STATUS_OLD=`ping www.google.com > /dev/null && echo "up" || echo "down"`
ROUTER_STATUS_OLD=`ping 192.168.1.1 > /dev/null && echo "up" || echo "down"`
LOG="internet_router_status.log"

touch $LOG
while [[ 1 == 1 ]]; do
  DATE=`date`
  INTERNET_STATUS_NOW=`ping www.google.com > /dev/null && echo "up" || echo "down"`
  ROUTER_STATUS_NOW=`ping 192.168.1.1 > /dev/null && echo "up" || echo "down"`
  
  echo "INTERNET_STATUS_NOW is $INTERNET_STATUS_NOW"
  echo "INTERNET_STATUS_OLD is $INTERNET_STATUS_OLD"
  echo "ROUTER_STATUS_NOW is $ROUTER_STATUS_NOW"
  echo "ROUTER_STATUS_OLD is $ROUTER_STATUS_OLD"
  
  # BEEP
  if [[ $INTERNET_STATUS_NOW == "down" || $ROUTER_STATUS_NOW == "down"  ]]; then
	echo -e "\a"  # Make a beep
  fi
  
  # INTERNET STATUS LOGGING
  if [[ $INTERNET_STATUS_NOW == "down" && $INTERNET_STATUS_OLD == "up" ]]; then
	# prepend file (the command inside of $(...) is executed before file is overwritten with >)
    echo -e "$DATE: Ping to www.google.com UNSUCCESSFUL\n$(cat $LOG)" > $LOG
	INTERNET_STATUS_OLD="down"
	
	#cat $INTERNET_STATUS_LOG | mutt -s "Internet DOWN" MY@EMAIL
  elif [[ $INTERNET_STATUS_NOW == "up" && $INTERNET_STATUS_OLD == "down" ]]; then
	echo -e "*$DATE: Ping to www.google.com SUCCESSFUL*\n$(cat $LOG)" > $LOG
	INTERNET_STATUS_OLD="up"
	
	#cat $INTERNET_STATUS_LOG | mutt -s "Internet UP" -b MY@EMAIL
  fi
  
  # ROUTER STATUS LOGGING
  if [[ $ROUTER_STATUS_NOW == "down" && $ROUTER_STATUS_OLD == "up" ]]; then
    echo -e "**$DATE: Ping to 192.168.1.1 UNSUCCESSFUL**\n$(cat $LOG)" > $LOG
	ROUTER_STATUS_OLD="down"
  elif [[ $ROUTER_STATUS_NOW == "up" && $ROUTER_STATUS_OLD == "down" ]]; then
	echo -e "$DATE: Ping to 192.168.1.1 SUCCESSFUL\n$(cat $LOG)" > $LOG
	ROUTER_STATUS_OLD="up"
  fi
  
  sleep $NUM_SECONDS_BETWEEN_CHECKS
done
