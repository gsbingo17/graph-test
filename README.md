go build -o benchmark main.go

+ Setup
./benchmark -test=setup

+ Insert 100 million vertices:
PRE_GENERATE_VERTEX_DATA=false SHUFFLE_PROCESSING_ORDER=true BATCH_NUM=1 GRAPH_NAME=g0618 ZONE_START=1 ZONES_TOTAL=500 RECORDS_PER_ZONE=200000 VUS=256 ./benchmark -test=write-vertex

+ Insert 2 billions edges
PRE_GENERATE_VERTEX_DATA=false SHUFFLE_PROCESSING_ORDER=true BATCH_NUM=1 GRAPH_NAME=g0618 ZONE_START=1 ZONES_TOTAL=500 RECORDS_PER_ZONE=5000 EDGES_PER_RELATION=8 VUS=512 MAX_COMMIT_DELAY_MS=100 ./benchmark -test=write-edge

+ Read vertex (Need to change the totalQueries in the code, 1,000,000 by default)
VUS=512 ./benchmark -test=read-vertex

+ Read relation
ZONES_TOTAL=500 RECORDS_PER_ZONE=2000 VUS=256 ./benchmark -test=read-relation