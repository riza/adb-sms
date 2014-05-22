#!/bin/bash
clear;
echo "ADB Shell SMS Sender v1.0b";
echo "#############################";
echo;

# Args

NUMBER=$1
BODY=$2
IP=$3


# Core

FILE="adb";

if [ -f $FILE ];
	then
		# GO!

		./adb connect $IP;
		echo;
		./adb shell am force-stop com.google.android.talk
		sleep 2;
		./adb shell am start -a android.intent.action.SENDTO -d sms:$NUMBER --es sms_body $BODY --ez exit_on_sent true
		sleep 2;
		./adb shell input keyevent 22
		sleep 2;
		./adb shell input keyevent 66
		sleep 2;

	else
		echo "$FILE does not exist";
fi