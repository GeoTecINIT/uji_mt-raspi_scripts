#!/bin/bash

if [ ! -d /home/pi/src ]
then
  mkdir /home/pi/src
  chown pi /home/pi/src
fi
if [ ! -d /home/pi/src/services ]
then
  mkdir /home/pi/src/services
  chown pi /home/pi/src/services
fi

# Copy service script files
cp ./services/api/api-start.sh /home/pi/src/services/api-start.sh
cp ./services/geth/* /home/pi/src/services/
rm /home/pi/src/services/geth.service

# Update permission of script files
chmod u+x /home/pi/src/services/*.sh
chown pi /home/pi/src/services/*

# Copy service files to system
cp ./services/api/api.service /etc/systemd/system/api.service
cp ./services/geth/geth.service /etc/systemd/system/geth.service

# Enable services
systemctl enable api.service
systemctl enable geth.service

# Start services
systemctl start api.service
systemctl start geth.service
