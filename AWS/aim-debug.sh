#!/bin/bash

aws sts decode-authorization-message --encoded-message $1 | head -2 \
														  | tail -1 \
														  | sed -e 's/\\\"/"/g' \
														  | sed -e 's/    "DecodedMessage": "//g' \
														  | sed 's/.$//' \