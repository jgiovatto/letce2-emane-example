#!/bin/bash -
  
DEV=letce0

if [ "$#" -ne 1 ]; then
    echo "Error: Incorrect number of arguments." >&2
    echo "Usage: $0 <1, 2, 3 or 4>" >&2
    exit 1
fi

PATHLOSS=80

case $1 in
  1)
      echo "heal wan1"
      emaneevent-pathloss 1 $PATHLOSS -t 5 -i letce0
      emaneevent-pathloss 5 $PATHLOSS -t 1 -i letce0
      ;;
  2)
      echo "heal wan2"
      emaneevent-pathloss 2 $PATHLOSS -t 6 -i letce0
      emaneevent-pathloss 6 $PATHLOSS -t 2 -i letce0
      ;;
  3)
      echo "heal wan3"
      emaneevent-pathloss 3 $PATHLOSS -t 7 -i letce0
      emaneevent-pathloss 7 $PATHLOSS -t 3 -i letce0
      ;;
  4)
      echo "heal wan4"
      emaneevent-pathloss 4 $PATHLOSS -t 8 -i letce0
      emaneevent-pathloss 8 $PATHLOSS -t 4 -i letce0
      ;;

  *)
      # The default case, matches anything else
      echo "invalid network id choose <1,2,3 or 4>"
      ;;
esac



