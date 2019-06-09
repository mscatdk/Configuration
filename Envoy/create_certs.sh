#!/bin/bash

if [ ! -d ./certs ]
then
  mkdir certs
  openssl req -nodes -new -x509 -keyout certs/test-local.key -out certs/test-local.crt -days 365 -subj '/CN=test.local/O=My Company Name LTD./C=US';
else
  echo "Reusing certs in ./certs"
fi

