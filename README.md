# letce2-emane-example

requires letce2 and mgen-analytics to be installed or sourced in via env

letce2 lxc start -e ../demo.env --scenario-delay=30

https://github.com/adjacentlink/letce2

sudo lxc-ls -f
[sudo] password for jgiovatto: 
NAME   STATE   AUTOSTART GROUPS IPV4                  IPV6 UNPRIVILEGED 
node-1 RUNNING 0         -      10.100.0.1, 10.99.0.1 -    false        
node-2 RUNNING 0         -      10.100.0.2, 10.99.0.2 -    false        
node-3 RUNNING 0         -      10.100.0.3, 10.99.0.3 -    false        
node-4 RUNNING 0         -      10.100.0.4, 10.99.0.4 -    false 


For centralized deployments letc0 must be made a trusted interface to handle events and transport traffic
