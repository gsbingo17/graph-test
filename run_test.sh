#!/bin/bash

go build -o benchmark main.go

# set VUS environment variable
export VUS=1
export ZONES=10
export RECORDS=80
export STRATTRCNT=10
export INTATTRCNT=10
export ZONE_START=2
export ZONES_TOTAL=1
export RECORDS_PER_ZONE=12
export EDGES_PER_RELATION=1

# ./benchmark -test=write-vertex
# ./benchmark -test=write-edge -batch-num 1
# ./benchmark -test=truncate
# ./benchmark -test=relation
./benchmark -test=setup

read -p "Press any key to continue..." 