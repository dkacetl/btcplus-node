#!/usr/bin/env bash
git clone https://github.com/spesmilo/electrumx.git
cd electrumx
pip3 install .[rocksdb,ujson]