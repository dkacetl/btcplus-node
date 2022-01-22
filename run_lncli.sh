#!/bin/bash
LND_CONTAINER_ID=$(docker ps | grep btcplus/lnd | head -n1 | awk '{print $1;}')
docker exec -it "$LND_CONTAINER_ID" lncli "$@"