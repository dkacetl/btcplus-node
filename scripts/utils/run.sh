#!/bin/sh
docker run -v /media/davedata/bitcoin:/media/davedata/bitcoin --env BITCOIN_DATA=/media/davedata/bitcoin -p 8333:8333 -it --rm dkacetl/bitcoin-core:latest