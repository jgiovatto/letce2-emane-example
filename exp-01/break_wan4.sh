#!/bin/bash -
  
DEV=letce0

emaneevent-pathloss 13  200 -t 14 -t 15 -t 16 -i letce0
emaneevent-pathloss 14  200 -t 13 -t 15 -t 16 -i letce0
emaneevent-pathloss 15  200 -t 13 -t 14 -t 16 -i letce0
emaneevent-pathloss 16  200 -t 13 -t 14 -t 15 -i letce0

