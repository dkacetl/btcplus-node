#!/bin/bash
BTCD_CONTAINER_ID=$(docker ps | grep btcplus/bitcoind| head -n1 | awk '{print $1;}')
docker exec -it "$BTCD_CONTAINER_ID" bitcoin-cli -rpcconnect=10.5.0.2 -rpcuser=bitcoin -rpcpassword=Test0101 "$@"
