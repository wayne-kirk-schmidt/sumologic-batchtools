#!/usr/bin/env ksh

datedelta=$1

increment=$2

batchcfg="${3:-"/var/tmp/batchquery.cfg"}"

umask 022

finaltime=$( date +%s )

starttime=$( date -v -${datedelta}d +%s ) 

for (( time = $starttime ; time < $finaltime ; time = $time + $increment )); do

    etime=$(( $time * 1000 ))
    ftime=$(( ( $time + $increment ) * 1000 ))
    [[ $ftime > $finaltime ]] && ftime=$(( $finaltime * 1000 ))
    echo "batchquery -c ${batchcfg} -r ${ftime}t:${etime}t -s 6 -v 6"

done
