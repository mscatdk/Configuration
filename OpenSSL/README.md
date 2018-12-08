# OpenSSL

### Obtain certificate from server

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
````
