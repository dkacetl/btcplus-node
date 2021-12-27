#!/bin/bash
# 8332 is rpc port
docker-compose run -p 0.0.0.0:8333:8333 -p 127.0.0.1:8332:8332 bitcoind