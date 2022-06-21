#!/bin/sh

for file in /data/Twitter\ dataset/geoTwitter*; do
    nohup ./src/map.py "--input_path=$file" &
    echo $file
done
