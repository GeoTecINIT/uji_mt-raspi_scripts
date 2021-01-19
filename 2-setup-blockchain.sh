#!/bin/bash

source ./config

# Download genesis file data from other running API node defined in APIURL variable in ./config file
curl -L $APIURL/network/genesis > temp/genesis.json

# Format genesis file (remove api response data)
node ./js/make-genesis.js

if [ ! -d "/home/pi/ethereum" ]
then
  mkdir /home/pi/ethereum
fi

# Move genesis file
mv ./temp/genesis.json /home/pi/ethereum/genesis.json

# Initialise blockchain
geth --datadir /home/pi/ethereum --networkid 2564 --nousb init /home/pi/ethereum/genesis.json
