#!/bin/bash

#install iSCSI initiator package

yum install -y iscsi-initiator-utils

service iscsi restart
chkconfig iscsi on

