#!/bin/sh
VERSION=v0.14.1-beta
wget https://raw.githubusercontent.com/lightningnetwork/lnd/master/Dockerfile -O Dockerfile
echo "Build version : $VERSION"
docker build --build-arg checkout=$VERSION -t btcplus/lnd:$VERSION .
