#!/bin/bash

# rpm install should take care of initial user/group creation

FRR_VTY_GROUPNAME=frrvty

# add user root to vty group
if getent group $FRR_VTY_GROUPNAME | grep root > /dev/null ; then
   echo "user root is in group $FRR_VTY_GROUPNAME"; 
else
   echo "will add user root to group $FRR_VTY_GROUPNAME"; 
   sudo /usr/sbin/groupmod -a -U root $FRR_VTY_GROUPNAME
fi

# add self to vty group
if getent group $FRR_VTY_GROUPNAME | grep $USER > /dev/null ; then
   echo "user $USER is in group $FRR_VTY_GROUPNAME"; 
else
   echo "will add user $USER to group $FRR_VTY_GROUPNAME"; 
   sudo /usr/sbin/groupmod -a -U $USER $FRR_VTY_GROUPNAME
fi
