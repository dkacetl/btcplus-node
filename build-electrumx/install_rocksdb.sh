#!/usr/bin/env sh
sudo apt-get install libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev libzstd-dev liblz4-dev
git clone https://github.com/facebook/rocksdb.git
cd rocksdb/
DEBUG_LEVEL=0 make all
sudo make install
pip3 install python-rocksdb
