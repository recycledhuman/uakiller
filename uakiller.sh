#!/bin/bash
#Deletes User Account and archives user's Home Directory 
#Anything in Brackets "<>" delete and replace with information requested

#Set Variables
SCRIPT="uakiller"
LOGFILE="$SCRIPT.log"
NOW="$(Date +"%m/%d/%Y %H:%M")"
WHO=$(who -s | awk '{print $1;}' | grep -v "<local admin name here>")
ADMIN="<local admin name here>"
CURRENTYEAR=$(date +"%Y")
CURRENTMONTH=$(date +"%m")
CURRENTDAY=$(date +"%d")
DUEYEAR="<year>"
DUEMONTH="<month as integer>"
DUEDAY="<day>"
SIZE="$(ls -l /var/log/$LOGFILE.log | awk {'print $5;'})"
MAXSIZE="<maximum filesize alotted in bytes>"

#Set Output Log
touch /var/log/"$LOGFILE"
echo "---Preparing Logfile---" >> /var/log/"$LOGFILE"
echo "Logfile size = $SIZE - Checking" >> /var/log/"$LOGFILE"
if [ "$SIZE" -ge "$MAXSIZE" ]
	then
		echo "File cleared - Proceed" >> /var/log/"$LOGFILE"
		rm -rf /var/log/"$LOGFILE"
	else
		echo "File size is sufficient - Proceed" >> /var/log/"$LOGFILE"
fi

echo "###$SCRIPT script starting - $NOW###" >> /var/log/"$LOGFILE"

#Output WHO variable for error logging
echo "User = $WHO" >> /var/log/"$LOGFILE"
echo "Current Date is $CURRENTMONTH/$CURRENTDAY/$CURRENTYEAR" >> /var/log/"$LOGFILE"

#Check if date is greater than or equal to the due date
if [ "$CURRENTYEAR" = "$DUEYEAR" ]
	then
		echo "Year is $DUEYEAR - checking month" >> /var/log/"$LOGFILE"
		if [ "$CURRENTMONTH" -gt "$DUEMONTH" ]
			then
				echo "Year is $DUEYEAR, month is greater than $DUEMONTH - Proceed" >> /var/log/"$LOGFILE"
			elif [ "$CURRENTMONTH" = "$DUEMONTH" ]
				then
					echo "Year is $DUEYEAR, month is $DUEMONTH - checking day" >> /var/log/"$LOGFILE"
					if [ "$CURRENTDAY" -ge "$DUEDAY" ]
						then
							echo "Year is $DUEYEAR, month is $DUEMONTH, day is greater or equal to $DUEDAY - Proceed" >> /var/log/"$LOGFILE"
						else
							echo "ERROR 2 - not the correct day" >> /var/log/"$LOGFILE"
							exit 2
					fi
			else
				echo "ERROR 3 - not the correct month" >> /var/log/"$LOGFILE"
				exit 3
		fi
	elif [ "$CURRENTYEAR" -gt "$DUEYEAR" ]
		then
			echo "Currently greater year - Proceed" >> /var/log/"$LOGFILE"
	else
		echo "ERROR 4 - not the correct year" >> /var/log/"$LOGFILE"
		exit 4
fi


#Confirm User is not Admin
if [ "$WHO" = "$ADMIN" ]
	then
		echo "ERROR 5: Local Admin account logged in - Aborting" >> /var/log/"$LOGFILE"
		exit 5
	else
		echo "User is not Admin - Proceed" >> /var/log/"$LOGFILE"
fi

#Run script to change password
source /Users/<Local Admin name here>/Desktop/Scripts/resetpassword.sh
echo "Changing Password for $WHO" >> /var/log/"$LOGFILE"
exit 0
