# letce2-emane-example

1) requires letce2 and optional mgen-analytics to be installed or sourced in via env

2) you will need to add root and yourself to the appropriate group see scripts/set_frr_groups.sh 

3) to run, letce2 lxc start --scenario-delay=30

see https://github.com/adjacentlink/letce2

4) view containers
# sudo lxc-ls -f
NAME     STATE   AUTOSTART GROUPS IPV4                                                                   IPV6 UNPRIVILEGED 
radio-1  RUNNING 0         -      10.99.0.2                                                              -    false        
radio-10 RUNNING 0         -      10.99.0.13                                                             -    false        
radio-11 RUNNING 0         -      10.99.0.14                                                             -    false        
radio-12 RUNNING 0         -      10.99.0.15                                                             -    false        
radio-13 RUNNING 0         -      10.99.0.12                                                             -    false        
radio-14 RUNNING 0         -      10.99.0.13                                                             -    false        
radio-15 RUNNING 0         -      10.99.0.14                                                             -    false        
radio-16 RUNNING 0         -      10.99.0.15                                                             -    false        
radio-2  RUNNING 0         -      10.99.0.3                                                              -    false        
radio-3  RUNNING 0         -      10.99.0.4                                                              -    false        
radio-4  RUNNING 0         -      10.99.0.5                                                              -    false        
radio-5  RUNNING 0         -      10.99.0.7                                                              -    false        
radio-6  RUNNING 0         -      10.99.0.8                                                              -    false        
radio-7  RUNNING 0         -      10.99.0.9                                                              -    false        
radio-8  RUNNING 0         -      10.99.0.10                                                             -    false        
radio-9  RUNNING 0         -      10.99.0.12                                                             -    false        
router-1 RUNNING 0         -      10.100.1.1, 10.100.2.1, 10.100.3.1, 10.100.4.1, 10.101.1.1, 10.99.0.1  -    false        
router-2 RUNNING 0         -      10.100.1.2, 10.100.2.2, 10.100.3.2, 10.100.4.2, 10.101.2.1, 10.99.0.6  -    false        
router-3 RUNNING 0         -      10.100.1.3, 10.100.2.3, 10.100.3.3, 10.100.4.3, 10.101.3.1, 10.99.0.11 -    false        
router-4 RUNNING 0         -      10.100.1.4, 10.100.2.4, 10.100.3.4, 10.100.4.4, 10.101.4.1, 10.99.0.16 -    false      

5) view container routing table
# ssh node-1 route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use   Iface
10.99.0.0	    0.0.0.0         255.255.255.0   U     0      0        0   backchan0
10.100.1.0	    0.0.0.0         255.255.255.0   U     0      0        0   wan1
10.100.2.0	    0.0.0.0         255.255.255.0   U     0      0        0   wan2
10.100.3.0	    0.0.0.0         255.255.255.0   U     0      0        0   wan3
10.100.4.0	    0.0.0.0         255.255.255.0   U     0      0        0   wan4
10.101.1.0	    0.0.0.0         255.255.255.0   U     0      0        0   lan0
10.101.2.0	    10.100.4.2	    255.255.255.0   UG    20     0        0   wan4
10.101.3.0	    10.100.4.3	    255.255.255.0   UG    20     0        0   wan4
10.101.4.0	    10.100.4.4	    255.255.255.0   UG    20     0        0   wan4

6) vtysh --vty_socket /var/run/frr/router-1
router-1# sh ip ospf
 OSPF Routing Process, Router ID: 10.101.1.1
 Supports only single TOS (TOS0) routes
 This implementation conforms to RFC2328
 RFC1583Compatibility flag is disabled
 OpaqueCapability flag is disabled
 Initial SPF scheduling delay 0 millisec(s)
 Minimum hold time between consecutive SPFs 50 millisec(s)
 Maximum hold time between consecutive SPFs 5000 millisec(s)
 Hold time multiplier is currently 1
 SPF algorithm last executed 6m58s ago
 Last SPF duration 0.001s
 SPF timer is inactive
 LSA minimum interval 5000 msecs
 LSA minimum arrival 1000 msecs
 Write Multiplier set to 20 
 Refresh timer 10 secs
 Maximum multiple paths(ECMP) supported 8
 Administrative distance 110
 Number of external LSA 0. Checksum Sum 0x00000000
 Number of opaque AS LSA 0. Checksum Sum 0x00000000
 Number of areas attached to this router: 1
 Area ID: 0.0.0.0 (Backbone)
   Number of interfaces in this area: Total: 5, Active: 5
   Number of fully adjacent neighbors in this area: 8
   Area has no authentication
   SPF algorithm executed 27 times
   Number of LSA 8
   Number of router LSA 4. Checksum Sum 0x000235e6
   Number of network LSA 4. Checksum Sum 0x00023733
   Number of summary LSA 0. Checksum Sum 0x00000000
   Number of ASBR summary LSA 0. Checksum Sum 0x00000000
   Number of NSSA LSA 0. Checksum Sum 0x00000000
   Number of opaque link LSA 0. Checksum Sum 0x00000000
   Number of opaque area LSA 0. Checksum Sum 0x00000000

7) To setup usb to ethernet adapters (adjust ether mac address to match your adapters)
create or edit /etc/udev/rules.d/70-persistent-net.rules/70-persistent-net.rules

SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:50:b6:08:72:34", KERNEL=="eth*", NAME="adapt0"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:50:b6:04:04:98", KERNEL=="eth*", NAME="adapt1"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:50:b6:05:7c:85", KERNEL=="eth*", NAME="adapt2"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:50:b6:09:f5:94", KERNEL=="eth*", NAME="adapt3"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:14:d1:1b:73:bf", KERNEL=="eth*", NAME="adapt4"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="9c:69:d3:39:fe:0f", KERNEL=="eth*", NAME="adapt5"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="9c:69:d3:39:fe:0c", KERNEL=="eth*", NAME="adapt6"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="9c:69:d3:39:fe:73", KERNEL=="eth*", NAME="adapt7"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="9c:69:d3:39:fd:a1", KERNEL=="eth*", NAME="adapt8"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:08:f3", KERNEL=="eth*", NAME="adapt9"

# 1. Create the VLAN connection (e.g., VLAN 100 on eth0)
sudo nmcli con add type vlan con-name VLAN100 dev eth0 id 100
# Or using ifname if you prefer:
# sudo nmcli con add type vlan ifname eth0.100 id 100

# 2. Bring the new VLAN connection up
sudo nmcli con up VLAN100
# You might need to add IP address info here (static/DHCP) if not bridging
# sudo nmcli con modify VLAN100 ipv4.method manual ipv4.addresses 192.168.100.1/24


# 1. Create a bridge (e.g., br-vlan100)
sudo nmcli con add type bridge con-name br-vlan100 ifname br-vlan100

# 2. Add the VLAN interface as a slave to the bridge
sudo nmcli con add type bridge-slave con-name br-vlan100-slave ifname eth0.100 master br-vlan100

# 3. Bring bridge and slave up (if not already)
sudo nmcli con up br-vlan100
sudo nmcli con up br-vlan100-slave

# Inside /var/lib/lxc/your-container/config
lxc.net.0.type = veth
lxc.net.0.link = br-vlan100 # Connect to the bridge we created
lxc.net.0.flags = up
lxc.net.0.name = eth0 # Container's interface name

# Optional: Add static IP for the container
lxc.net.0.ipv4.address = 192.168.100.10/24
# lxc.net.0.ipv4.gateway = 192.168.100.1 # If using DHCP or gateway
