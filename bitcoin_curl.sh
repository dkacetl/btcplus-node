#!/bin/bash
curl --user bitcoin --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' \
    -H 'content-type: text/plain;' http://127.0.0.1:8332/