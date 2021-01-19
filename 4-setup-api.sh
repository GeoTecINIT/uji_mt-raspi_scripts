#!/bin/bash

source ./config

if [ -d /home/pi/api ]
then
  rm -rf /home/pi/api
fi

# Clone API from repository
git clone https://github.com/ponlawat-w/uji_mt-reputation_management_api.git /home/pi/api

# Load config from running API in other node, defined url in APIURL of ./config file
curl -L $APIURL/network/default-config > ./temp/api-config.json
# Format API config file (strip API response data)
node ./js/make-api-config.js
# Move API file to API source directory
mv ./temp/api-config.json /home/pi/api/config.json

# Install NPM packages of API directory
npm --prefix /home/pi/api install /home/pi/api
npm --prefix /home/pi/api install -g --unsafe-perm=true --allow-root /home/pi/api
