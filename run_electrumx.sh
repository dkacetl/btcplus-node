#!/bin/bash
docker-compose run -d -p 0.0.0.0:50002:50002 -p 127.0.0.1:8000:8000 -e DB_CACHE=600 electrumx