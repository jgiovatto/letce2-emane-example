#!/bin/bash

letce2 lxc start  --scenario-delay=10

sleep 10

echo "setting locations"
emaneevent-location 1 latitude=0.0 longitude=0.0 altitude=1       -i letce0
emaneevent-location 2 latitude=0.0 longitude=0.0 altitude=1000000 -i letce0
