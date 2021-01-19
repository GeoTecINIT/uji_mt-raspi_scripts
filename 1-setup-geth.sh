#!/bin/bash

source ./config

if [ ! -d "./temp" ]
then
  mkdir temp
fi

if [ ! -f "./temp/$NAME.tar.gz" ]
then
  # Download geth put in temp directory
  curl -L https://gethstore.blob.core.windows.net/builds/$NAME.tar.gz > ./temp/$NAME.tar.gz && false
fi

# Extract file and move
tar -xvzf ./temp/$NAME.tar.gz -C ./temp
mv temp/$NAME/geth /usr/local/bin
rm -rf ./temp/$NAME

# Add right to pi
chown pi /usr/local/bin/geth
