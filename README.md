# letce2-emane-example

1) requires letce2 and optional mgen-analytics to be installed or sourced in via env

2) you will need to add root and yourself to the appropriate group see scripts/set_frr_groups.sh 

3) to run, letce2 lxc start -e ../demo.env --scenario-delay=30

https://github.com/adjacentlink/letce2

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
