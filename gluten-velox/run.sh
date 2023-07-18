#!/bin/bash

TRIES=3
QUERY_NUM=1
cat queries.sql | while read query; do
    sudo tee /proc/sys/vm/drop_caches >/dev/null

    echo -n "query${QUERY_NUM}," | tee -a result.csv
    for i in $(seq 1 $TRIES); do
        RES=$(./bin/beeline -u jdbc:hive2://localhost:10000/ -n root -e "select count(*) from lineitem;" 2>&1 | grep row |perl -nle 'print $1 if /\((\d+\.\d+)+ seconds\)/')
        echo -n "${RES}" | tee -a result.csv
        [[ "$i" != $TRIES ]] && echo -n "," | tee -a result.csv
    done
    echo "" | tee -a result.csv
    QUERY_NUM=$((QUERY_NUM + 1))
done
