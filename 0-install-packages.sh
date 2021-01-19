#!/bin/bash

# Update packages
apt update

# Install git, golang and nodejs
apt install git golang nodejs -y

# Install npm
curl https://www.npmjs.com/install.sh | sh
