#!/bin/bash

bootnodes=$1
automining=$2

echo "BOOTNODES=$bootnodes" > /home/pi/src/services/geth-service-config
echo "AUTOMINING=$automining" >> /home/pi/src/services/geth-service-config

systemctl restart geth.service
