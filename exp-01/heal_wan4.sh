#!/bin/bash -
  
DEV=letce0

emaneevent-pathloss 13  80 -t 14 -t 15 -t 16 -i letce0
emaneevent-pathloss 14  80 -t 13 -t 15 -t 16 -i letce0
emaneevent-pathloss 15  80 -t 13 -t 14 -t 16 -i letce0
emaneevent-pathloss 16  80 -t 13 -t 14 -t 15 -i letce0

