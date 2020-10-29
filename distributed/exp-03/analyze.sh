#!/bin/bash -

node_count=2
base_name=node

if [ $# != 1 ]
then
    echo "usage: $(basename $0) <test dir>"
    exit 1
fi

test_dir=$1

dbs=''
recorder_datas=''

if [ -d $test_dir ]
then
    pushd $test_dir

    for i in $(seq 1 $node_count)
    do
        if [ -f $base_name-$i/var/log/mgen.out ]
           then
               mgen-to-sqlite \
                   $base_name-$i/var/log/mgen.out \
                   mgen.out.db.$i \
                   --node-id $i 
        fi
    done

    for i in $(seq 1 $node_count)
    do
        if [ -f mgen.out.db.$i ]
        then
            dbs="$dbs mgen.out.db.$i"
        fi
    done

    echo mgen-sqlite-tool $dbs
    mgen-sqlite-tool $dbs

    test_name=$(basename $test_dir)
    
    ../../../analysis/generate-mgen-latency-graph \
        mgen.out.db.* \
        --out-dir . \
        --out-file $test_name.boxplot.png \
        --out-file-cdf $test_name.cdf.png \
        --title "$test_name bps"
    popd
else
    echo "not a test directory: $test_dir"
    exit 1
fi
