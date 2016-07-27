#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo 'Usage: wast <filename.wast>'
  exit 1
fi

TEMP=$(MKTEMPDIR/mktemp)
SWDIR/sexpr-wasm $1 -o $TEMP && DESTDIR/bin/wasm $TEMP
rm $TEMP
