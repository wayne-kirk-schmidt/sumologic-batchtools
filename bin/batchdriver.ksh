#!/usr/bin/env bash

umask 022

declare -A TIMES

TIMES[S]=1
TIMES[M]=$(( ${TIMES[S]} * 60 ))
TIMES[H]=$(( ${TIMES[M]} * 60 ))
TIMES[d]=$(( ${TIMES[H]} * 24 ))
TIMES[w]=$(( ${TIMES[d]} * 7 ))
TIMES[m]=$(( ${TIMES[d]} * 30 ))
TIMES[y]=$(( ${TIMES[d]} * 365 ))

datedelta=$1

increment=$2

batchcfg="${3:-"/var/tmp/batchquery.cfg"}"

finaltime=$( date +%s )

starttime=$( date -v -${datedelta} +%s ) 

number=$( echo ${increment} | grep -o -E "[[:digit:]]+" )
letter=$( echo ${increment} | grep -o -E "[[:alpha:]]+" )

bucket=$(( ${TIMES[${letter}]} * ${number} ))

for (( time = $starttime ; time < $finaltime ; time = $time + $bucket )); do

    etime=$(( $time * 1000 ))
    ftime=$(( ( $time + $bucket ) * 1000 ))
    [[ $ftime > $finaltime ]] && ftime=$(( $finaltime * 1000 ))
    echo "batchquery -c ${batchcfg} -r ${ftime}t:${etime}t -s 6 -v 6"

done
