#!/bin/bash

filepath="/home/sysadmin/research"

if [ ! -d $filepath ]
then
        mkdir ~/research1 2>/dev/null
fi


echo "\n=======================A Quick System Audit Script=======================\n" > $filepath/sys_info.txt
date >> $filepath/sys_info.txt
echo "" >> $filepath/sys_info.txt
echo "Machine Type Info:" >> $filepath/sys_info.txt
echo $MACHTYPE >> $filepath/sys_info.txt
echo -e "Uname info: $(uname -a) \n" >> $filepath/sys_info.txt
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $filepath/sys_info.txt
echo -e "Hostname: $(hostname -s) \n" >> $filepath/sys_info.txt
echo "DNS Servers: " >> $filepath/sys_info.txt
cat /etc/resolv.conf >> $filepath/sys_info.txt
echo -e "\nMemory Info:" >> $filepath/sys_info.txt

echo -e "\nCPU Info:" >> $filepath/sys_info.txt
lscpu | grep CPU >> $filepath/sys_info.txt
echo -e "\nDisk Usage:" >> $filepath/sys_info.txt
df -H | head -2 >> $filepath/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >> $filepath/sys_info.txt
echo -e "\nExec Files:" >> $filepath/sys_info.txt
find /home -type f -perm 777 >> $filepath/sys_info.txt
echo -e "\nTop 10 Processes" >> $filepath/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $filepath/sys_info.txt

echo -e "\n\nList of Users having sudo access" >> $filepath/sys_info.txt

declare -a etcfiles
etcfiles=( "/etc/passwd" "/etc/shadow" )

for etcfile in ${etcfiles[@]}
do
        ls -l $etcfile
done

for user in $(ls /home)
do
        
        groupslist=$(groups $user | awk -F":" '{print $2}')
        # echo -e "\nlist of groups for $user is: $groupslist "
     
        for group in ${groupslist[@]}
        do
                if [ $group == "sudo" ]
                then
                        echo "$user" >> $filepath/sys_info.txt
                fi
        done
done
