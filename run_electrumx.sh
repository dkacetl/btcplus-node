#!/bin/bash
# 50002 ssl electrum
# 8000 is rpc port
# -d detached
docker-compose run -d -p 0.0.0.0:50002:50002 -p 127.0.0.1:8000:8000 electrumx