#! /bin/bash

# Variables - Use this in place of profuction variables
Disk_Label="Name of disk being expanded" 
MP="/mnt/location"
Part_Number="number associated with partition being resized" 

#Unmount the file system as it is not the root drive
umount $MP

# resize the file system 
growpart /dev/$Disk_Label $Part_Number 

#Run file system check to ensure drive is in optimal condition 
e2fsck -f /dev/$Disk_Label

#Resize the file system to fill the logical volume
resize2fs /dev/$Disk_Label

# Remount the file system 
mount /dev/$Disk_Label $MP

echo "The volume allocation has successfully completed." 

# Kickoff: "chmod +x MPAllocation.sh" - makes file executable 
# Execute: ./MPAllocation.sh
