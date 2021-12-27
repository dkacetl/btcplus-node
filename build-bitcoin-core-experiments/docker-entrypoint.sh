#!/bin/bash
set -e

# Used for run-time configuration of bitcoin

if [[ -v BITCOIN_CONF ]]; then
  echo "BITCOIN_CONF is set, config will be created as '/tmp/bitcoin.conf' and used"
  echo -e $BITCOIN_CONF > /tmp/bitcoin.conf
  set -- "$@" -conf=/tmp/bitcoin.conf
else
  echo "BITCOIN_CONF is not set"
fi

exec "$@"

