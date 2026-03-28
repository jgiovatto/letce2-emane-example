#!/bin/bash

. ./host/demo.env

letce2 lxc start  -e ./host/demo.env  --scenario-delay=10

sleep 10

echo "setting locations"
emaneevent-location 1 latitude=0.0 longitude=0.0 altitude=1       -i letce0
emaneevent-location 5 latitude=0.0 longitude=0.0 altitude=1000000 -i letce0

emaneevent-location 2 latitude=0.0 longitude=0.0 altitude=1       -i letce0
emaneevent-location 6 latitude=0.0 longitude=0.0 altitude=100000  -i letce0

emaneevent-location 3 latitude=0.0 longitude=0.0 altitude=1       -i letce0
emaneevent-location 7 latitude=0.0 longitude=0.0 altitude=10000   -i letce0

emaneevent-location 4 latitude=0.0 longitude=0.0 altitude=1       -i letce0
emaneevent-location 8 latitude=0.0 longitude=0.0 altitude=1000    -i letce0
