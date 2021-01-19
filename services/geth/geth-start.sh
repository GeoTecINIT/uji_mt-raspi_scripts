#!/bin/bash

source /home/pi/src/services/geth-service-config

cmd="geth --datadir /home/pi/ethereum --nousb --networkid 2564 --port 30303"
cmd="$cmd --http --http.port 8545 --http.api eth,web3,personal,net,admin,miner"
cmd="$cmd --allow-insecure-unlock --ipcdisable"

if [ ! -z $BOOTNODES ]
then
  cmd="$cmd --bootnodes $BOOTNODES"
fi

if $AUTOMINING
then
  cmd="$cmd --preload /home/pi/src/mining-scheduler.js console"
fi

$cmd
