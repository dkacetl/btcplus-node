#!/bin/sh
rm -rf ./docker-bitcoin-core | exit 1
git clone https://github.com/ruimarinho/docker-bitcoin-core.git
cd ./docker-bitcoin-core/
LAST_VERSION=$(ls -d */ | sort | tail -1)
cd ./$LAST_VERSION
echo "Build latest version : $LAST_VERSION"
docker build --build-arg TARGETPLATFORM=linux/arm64 -t btcplus/bitcoin-core:latest .

#cd ../..
#git clone https://github.com/mysql/mysql-docker
#cd mysql-docker/mysql-server/8.0/
#docker build --build-arg TARGETPLATFORM=linux/arm64 -t btcplus/mysql-server:8.0 .
