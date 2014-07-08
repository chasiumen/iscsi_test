#!/bin/bash


###VARIABLES###
dev='/dev/mapper/VolGroup-lv_home'
# vl_home total 243.72GB
#shrank_size: 163.72
shrank_size='162'



#---------------------RESCUE MODE------------------
#display vlm
lvs

#check logical volumes that you want to modify
lvdisplay

#make sure that drive is unmounted
df -h
umount  $dev

#check file system
e2fsck -f $dev

#Shrink down the volume shrank_size = original - 80GB
resize2fs $dev ${shrank_size}G

#Shrink LV  #lvresize -L -80G $dev
lvreduce --size -80G $dev
resize2fs $dev

#check
vgdisplay

echo "check if you have 80GB of free space"
#reboot

#----------------------RESCUE END--------------------

#Create LV in the volume group
lvcreate --size 64G --name iscsi1 /dev/VolGroup


