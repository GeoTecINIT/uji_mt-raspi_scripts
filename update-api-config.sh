#!/bin/bash

source ./config

# Load config from running API in other node, defined url in APIURL of ./config file
curl -L $APIURL/network/default-config > ./temp/api-config.json
# Format API config file (strip API response data)
node ./js/make-api-config.js
# Move API file to API source directory
mv ./temp/api-config.json /home/pi/api/config.json
