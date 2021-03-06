#!/bin/sh
rm -rf ./docker-bitcoin-core | exit 1
git clone https://github.com/ruimarinho/docker-bitcoin-core.git
cd ./docker-bitcoin-core/
LAST_VERSION=$(ls -d */ | sort | tail -1 | sed 's/.$//')
cd ./$LAST_VERSION
echo "Build latest version : $LAST_VERSION"
#TARGETPLATFORM=$(uname -i)-linux-gnu
#TARGETPLATFORM=linux/arm64
docker build --build-arg TARGETPLATFORM=$(uname -i)-linux-gnu -t btcplus/bitcoind:$LAST_VERSION .
