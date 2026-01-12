#!/bin/bash

# see quagg.spec.in for more info on quagga user/group

QUAGGA_USERNAME=quagga
QUAGGA_GROUPNAME=quagga
QUAGGA_GROUPID=92
QUAGGA_USERID=92

QUAGGA_VTY_GROUPNAME=quaggavt
QUAGGA_VTY_GROUPID=85

# add vty group
if getent group $QUAGGA_VTY_GROUPNAME > /dev/null ; then
   echo "group $QUAGGA_VTY_GROUPNAME exists"; 
else
   echo "will add group $QUAGGA_VTY_GROUPNAME"; 
   sudo /usr/sbin/groupadd -r -g $QUAGGA_VTY_GROUPID $QUAGGA_VTY_GROUPNAME
fi


# add user root to vty group
if getent group $QUAGGA_VTY_GROUPNAME | grep root > /dev/null ; then
   echo "user root is in group $QUAGGA_VTY_GROUPNAME"; 
else
   echo "will add user root to group $QUAGGA_VTY_GROUPNAME"; 
   sudo /usr/sbin/groupmod -a -U root $QUAGGA_VTY_GROUPNAME
fi

# add self to vty group
if getent group $QUAGGA_VTY_GROUPNAME | grep $USER > /dev/null ; then
   echo "user $USER is in group $QUAGGA_VTY_GROUPNAME"; 
else
   echo "will add user $USER to group $QUAGGA_VTY_GROUPNAME"; 
   sudo /usr/sbin/groupmod -a -U $USER $QUAGGA_VTY_GROUPNAME
fi


# add quagga group and user
if getent group $QUAGGA_GROUPNAME > /dev/null ; then
   echo "group $QUAGGA_GROUPNAME exists"; 
else
   echo "will add group $QUAGGA_GROUPNAME"; 
   sudo /usr/sbin/groupadd -g $QUAGGA_GROUPID $QUAGGA_GROUPNAME
fi

if getent passwd $QUAGGA_USERNAME > /dev/null ; then
   echo "user $QUAGGA_USERNAME exists"; 
else
   echo "will add group $QUAGGA_GROUPNAME"; 
   sudo /usr/sbin/useradd -u $QUAGGA_USERID -g $QUAGGA_GROUPID -G $QUAGGA_VTY_GROUPNAME \
        -M -r -s /sbin/nologin -c "Quagga routing suite" \
        -d /var/run/quagga $QUAGGA_USERNAME
fi





