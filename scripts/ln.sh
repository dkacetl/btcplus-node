#!/bin/sh
docker run -d -v /media/davedata/bitcoin/:/root/.bitcoin --network="bitcoin-network" -p 9735:9735 lightninglabs/lnd:v0.12.1-beta --bitcoin.active --bitcoin.mainnet --bitcoin.node=bitcoind --bitcoind.dir=/root/.bitcoin
