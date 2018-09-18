#!/bin/sh

ekanited \
    -datadir /data \
    -query "0.0.0.0:9950" \
    -queryhttp "0.0.0.0:8080" \
    -tcp "0.0.0.0:5514" \
    -udp "0.0.0.0:5514" \
    -diag "0.0.0.0:9951"
