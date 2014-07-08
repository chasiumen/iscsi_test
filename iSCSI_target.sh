#!/bin/bash


##VARIABLE##
lv_size='64'

#install Linux-IO
#yum install -y scsi-target-utils

#Create LV in the volume group
lvcreate --size ${lv_size}G --name iscsi1 /dev/VolGroup

#Install targetcli
yum install -y fcoe-target-utils

#start service
service fcoe-target start


######targetcli######
#
#cd /backstores/block
#create name=iscsi1 dev=/dev/VolGroup/iscsi1
#
