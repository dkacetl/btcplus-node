#!/bin/sh
VERSION=0.12.1
curl "https://codeload.github.com/Ride-The-Lightning/RTL/tar.gz/refs/tags/v$VERSION" --output "RTL-$VERSION.tar.gz"
tar -xf "./RTL-$VERSION.tar.gz"
cp -rf ./RTL-$VERSION/dockerfiles/* "./RTL-$VERSION" || exit
docker build -t btcplus/rtl:$VERSION "./RTL-$VERSION"
