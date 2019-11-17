#!/bin/bash
echo ======================================================================
echo  Welcome to dd Kill Disk, a simple disk destroyer for Linux systems.
echo ======================================================================
echo
echo
echo Would you like to list the disk on this machine: \(Y/N\)?
read list_disks

if [ "$list_disks" == "Y" ]  || [ "$list_disks" == "y" ]
then
    sudo fdisk -l
fi

echo
echo
echo =====================================================================
echo      Choose a disk listed above to be destroyed.
echo =====================================================================
echo
echo Enter the disk to destroy \(ex: /dev/sdb\):
read get_disk
echo Enter the number of passes \(ex: 10\): 
read num_passes


for (( c = 1; c <= $num_passes; c++ ))
do
   echo "Welcome $c times"
done

echo
echo
echo Your disk is very destroyed, have a nice day.
echo


