#!/bin/bash

# Define packages list
packages=(
    'nano'
    'wget'
    'net-tools'
)

# loop though the list of packages and show if they are installed

echo -e "\nList of packages:" > useful_loops.txt
for package in ${packages[@]};
do
    if [ $(which $package) ]
    then 
        echo "$package is installed at $(which $package)." >> useful_loops.txt
    else
        echo "$package is not installed." >> useful_loops.txt 
    fi
done


# Search each user's home directory for scripts and provide a formatted output.

echo -e "============================================================================" >> useful_loops.txt
echo -e "\n             Searching for scripts in user's home directory \n" >> useful_loops.txt
echo -e "============================================================================" >> useful_loops.txt
for user in $(ls /home);
do   
    echo -e "\nSearching through home directory of $user" >> useful_loops.txt
    echo -e "Scripts found:" >> useful_loops.txt
    scripts_found=0
    for item in $(find /home/$user -iname '*.sh');
    do 
       # echo -e "Found a script in $user's home folder! \n$item"
       echo -e "$item" >> useful_loops.txt
       scripts_found=1
    done
    if [ $scripts_found == 0 ]
    then
       echo -e "No scripts found" >> useful_loops.txt
    fi
done


# loop through scripts in the scripts folder and change the permissions to execute 
echo -e "============================================================================" >> useful_loops.txt
echo -e "\n     Changing permissions on scripts in CS_LinuxScripts directory \n" >> useful_loops.txt
echo -e "============================================================================" >> useful_loops.txt
echo -e "Changed permissions on the following scripts" >> useful_loops.txt
for script in $(ls ~/CS_LinuxScripts);
do 
    if [ ! -x ~/CS_LinnuxScripts/$script ]
    then
        chmod +x ~/CS_LinuxScripts/$script
        echo -e "$script" >> useful_loops.txt
    fi
done


# loop through a group of files and create a hash of each file.
echo -e "============================================================================" >> useful_loops.txt
echo -e "\nCreating hash of the files in /CS_ScriptInputs/files_for_hashing/ directory \n" >> useful_loops.txt
echo -e "============================================================================" >> useful_loops.txt
echo -e "Created hash of following files:" >> useful_loops.txt

for file in $(ls ~/CS_ScriptInputs/files_for_hashing/);
do
    sha256sum $file
    echo $file >> useful_loops.txt
done
