#!/bin/bash -

# usage ./emane-spectrum-analyzer.sh container id

if [ "$#" != '1' ]
then
    echo 'usage: emane-spectrum-analyzer.sh <hostname>'
    exit 1
fi

emane-spectrum-analyzer \
    $1:8883 \
    --hz-min 2390000000 \
    --hz-max 2410000000 \
    --with-waveforms \
    --subid-name 1,radio-1 \
    --subid-name 2,radio-2

