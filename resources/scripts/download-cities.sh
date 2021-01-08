#!/bin/bash

# We will just download a cities gazetteer from Geonames and put it as it was uploaded to S3

echo "Downloading file from geonames..."
curl http://download.geonames.org/export/dump/cities500.zip --output /tmp/cities500.zip
echo "decompressing..."
gunzip -S .zip -N /tmp/cities500.zip
echo "creating bucket (folder)"
mkdir -p /data/geonames
echo "moving gazetteer to bucket (folder)"
mv -f /tmp/cities500 /data/geonames/cities500.tsv
