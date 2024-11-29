#!/bin/bash
memoryy=$(free)
echo "$memoryy"

echo "------------------------------------------------------------------------"

#find total memory used in free in RAM
echo "PART 1" 

totalmem=$(echo "$memoryy" | grep Mem: | awk '{print $2}')
usedmem=$(echo "$memoryy" | grep Mem: | awk '{print $3}')
freemem=$(echo "$memoryy" | grep Mem: | awk '{print $4}')

echo "Total Mem: $totalmem KB"
echo "Used Mem: $usedmem KB"
echo "Free Mem: $freemem KB"

echo "------------------------------------------------------------------------"

#FIND IF DISC SPACE GREATER THAN 50 IF YES MAKE A DIR 'ALERT' AND PUSH NOTIFICATION IN IT WIHT ALLOCATED USAGE
echo "PART 2"

disc_info=$(df -h /)

echo "$disc_info"

used_disc=$(df -h / | grep '/dev/sdc' | awk '{print $5}')

echo $used_disc #1% right now

#NOW TO COMPARE WITH 50 CONVERT 1% TO 1 {LEAVING %}

total_used_disc=$(echo "$used_disc" | cut -d '%' -f1)
echo "IN VARIABLE IT IS $total_used_disc"

if [ $total_used_disc -ge 50 ]; then
    # Commands to execute if the condition is true
   mkdir alert
   touch Notification.txt
   msg="$total_used_disc is used"
   echo "$msg" >> Notification.txt
   mv Notification.txt alert/

else
    echo "IM IN ELSE"
fi

echo "-----------------------------------------------------------------------------"

#FIND TOP 10 LARGEST FILE IN SYSTEM
echo "PART 3"
largestfile=$(du -a /home | sort -n -r | head -n 10)
echo $largestfile

