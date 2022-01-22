#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for lnd"

  set -- lnd "$@"
fi

exec "$@"
