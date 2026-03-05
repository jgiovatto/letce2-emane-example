#!/bin/bash -
  
DEV=letce0

if [ "$#" -ne 1 ]; then
    echo "Error: Incorrect number of arguments. 1 required" >&2
    echo "Usage: $0 pathloss" >&2
    exit 1
fi

PATHLOSS=$2

emaneevent-pathloss 1 $PATHLOSS -t 2 -i letce0
emaneevent-pathloss 2 $PATHLOSS -t 1 -i letce0


