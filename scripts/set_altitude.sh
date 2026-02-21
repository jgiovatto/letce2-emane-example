#!/bin/bash -


if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments. 2 required" >&2
    echo "Usage: $0 nodeId, altitude in meters" >&2
    exit 1
fi


emaneevent-location $1 latitude=0.0 longitude=0.0 altitude=$2 -i letce0

