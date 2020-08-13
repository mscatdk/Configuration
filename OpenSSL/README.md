# OpenSSL

## Obtain certificate from server

````bash
# Print certificate chain
openssl s_client -showcerts -connect [hostname]:[port]

# Get pem file
openssl s_client -connect [hostname]:[port] </dev/null 2>/dev/null | openssl x509 -text

# Get cer file (command may not return)
openssl s_client -showcerts -connect [hostname]:[port] </dev/null | openssl x509 -outform DER > derp.der

# Convert pem to cer file
openssl x509 -outform der -in input.pem -out output.der

# Print content of pem file
openssl x509 -in certificate.pem -text

# Get issue date and expiration date
timeout 1 openssl s_client -connect [host]:[port] 2>/dev/null | openssl x509 -noout -dates

# Add passphase to private key
openssl rsa -aes256 -in [private key filename] -out [encrypted private key filename]

# Remove passphase from private key
openssl rsa -in [encrypted private key filename] -out [private key filename]
````

## Encrypt String using password

````bash
echo DEMO | openssl enc -aes-128-cbc -a -salt -pass pass:My_password
echo U2FsdGVkX1/de+pcqNA5IRrCJDDE3gQu69tOM8sdEGE= | openssl enc -aes-128-cbc -a -d -salt -pass pass:My_password
````
