#!/bin/bash -
  
DEV=letce0

if [ "$#" -ne 1 ]; then
    echo "Error: Incorrect number of arguments." >&2
    echo "Usage: $0 <1, 2, 3 or 4>" >&2
    exit 1
fi

PATHLOSS=200

case $1 in
  1)
      echo "break wan1"
      emaneevent-pathloss 1 $PATHLOSS -t 2 -t 3 -t 4 -i letce0
      emaneevent-pathloss 2 $PATHLOSS -t 1 -t 3 -t 4 -i letce0
      emaneevent-pathloss 3 $PATHLOSS -t 1 -t 2 -t 4 -i letce0
      emaneevent-pathloss 4 $PATHLOSS -t 1 -t 2 -t 3 -i letce0
      ;;
  2)
      echo "break wan2"
      emaneevent-pathloss 5 $PATHLOSS -t 6 -t 7 -t 8 -i letce0
      emaneevent-pathloss 6 $PATHLOSS -t 5 -t 7 -t 8 -i letce0
      emaneevent-pathloss 7 $PATHLOSS -t 5 -t 6 -t 8 -i letce0
      emaneevent-pathloss 8 $PATHLOSS -t 5 -t 6 -t 7 -i letce0
      ;;
  3)
      echo "break wan3"
      emaneevent-pathloss 9  $PATHLOSS -t 10 -t 11 -t 12 -i letce0
      emaneevent-pathloss 10 $PATHLOSS -t 9  -t 11 -t 12 -i letce0
      emaneevent-pathloss 11 $PATHLOSS -t 9  -t 10 -t 12 -i letce0
      emaneevent-pathloss 12 $PATHLOSS -t 9  -t 10 -t 11 -i letce0
      ;;
  4)
      echo "break wan4"
      emaneevent-pathloss 13 $PATHLOSS -t 14 -t 15 -t 16 -i letce0
      emaneevent-pathloss 14 $PATHLOSS -t 13 -t 15 -t 16 -i letce0
      emaneevent-pathloss 15 $PATHLOSS -t 13 -t 14 -t 16 -i letce0
      emaneevent-pathloss 16 $PATHLOSS -t 13 -t 14 -t 15 -i letce0
      ;;

  *)
      # The default case, matches anything else
      echo "invalid network id choose <1,2,3 or 4>"
      ;;
esac



