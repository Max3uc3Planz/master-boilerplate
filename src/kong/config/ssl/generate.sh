######################
# Become a Certificate Authority
######################

# Generate private key
openssl genrsa -des3 -out server.key 2048
# Generate root certificate
openssl req -x509 -new -nodes -key server.key -sha256 -days 825 -out server.pem

######################
# Create CA-signed certs
######################

NAME=localhost # Use your own domain name
# Generate a private key
openssl genrsa -out $NAME.key 2048
# Create a certificate-signing request
openssl req -new -key $NAME.key -out $NAME.csr
# Create a config file for the extensions
>$NAME.ext cat <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
extendedKeyUsage=serverAuth,clientAuth
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $NAME # Be sure to include the domain name here because Common Name is not so commonly honoured by itself
EOF
# Create the signed certificate
openssl x509 -req -in $NAME.csr -CA server.pem -CAkey server.key -CAcreateserial \
-out $NAME.crt -days 825 -sha256 -extfile $NAME.ext