#!/bin/bash

# Install drivers that are found in this parent dir
## Realtek drivers
### The realtek drivers found within this directory are only needed if you are running linux kernel 5.6 or lower.
if [[ $(uname -r | awk -F "." '{print $1}') -le '5' ]]; then
    if [[ $(uname -r | awk -F "." '{print $2}') -le '6' ]]; then
        cd realtek
        for driver_dir in $(find . -maxdepth 1 -type d | tail -n +2); do
            cd $driver_dir && bash autorun.sh
            cd ..
        done
        cd ..
    fi
fi
