#!/bin/sh
VERSION=2.3.0

curl "https://codeload.github.com/mempool/mempool/tar.gz/refs/tags/v$VERSION" --output "mempool-$VERSION.tar.gz"
tar -xf "./mempool-$VERSION.tar.gz"

cp -rf ./mempool-$VERSION/docker/backend/* "./mempool-$VERSION/backend" || exit

docker build -t btcplus/mempool-backend:$VERSION "./mempool-$VERSION/backend"
