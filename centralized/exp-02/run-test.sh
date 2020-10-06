#!/bin/bash -

data_dir=test-data-$(date "+%Y%m%d.%H%M%S" --utc)

ENVIRONMENT=''

env_file=~/Devel/environments/emane.env

 # adjacent link internal test environment, disregard
if [ -f  $env_file ]
then
    ENVIRONMENT="-e $env_file"
fi

letce2 lxc start $ENVIRONMENT

echo -n "waiting for test completion"

sleep 10

while (pgrep mgen > /dev/null)
do
    echo -n "."
    sleep 1
done

letce2 lxc stop $ENVIRONMENT

mkdir -p $data_dir

pushd $data_dir

mkdir -p config

for i in $(ls ../persist);
do
    cp -R ../$i config
done

cp -R ../persist/* . 2>&1 | grep -v lxc-execute.log

popd

chmod -R a+r $data_dir
