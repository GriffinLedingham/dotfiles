#!/bin/bash

trap trapint 2
function trapint {
    exit 0
}

while true; do
  fswatch ~/Kanohub/kano/ | sh .kanohub_rsync_loc_to_rem.sh;
done