#!/usr/bin/env bash
git clone https://github.com/lukechilds/docker-electrumx.git
cd docker-electrumx
docker build -t btcplus/electrumx .