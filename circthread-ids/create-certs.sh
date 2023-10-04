#! /bin/bash

openssl_version=$(openssl version | awk '{print $2}')

# Compare the current OpenSSL version with 3.0.0
if [ "$(printf '%s\n' "3.0.0" "$openssl_version" | sort -V | head -n1)" == "3.0.0" ]; then

	echo "Current OpenSSL version is '"$openssl_version"', and it is greater than or equal to 3.0.0"
	#Export the private key from pkcs12 IDS certificate
	openssl pkcs12 -in ./connector-conf/ids.certificate.p12 -out ids.certificate.key.pem -nocerts -nodes -legacy -passin pass:<REPLACE_PASSWORD_1>

	# Create pem file
	openssl pkcs12 -in ./connector-conf/ids.certificate.p12 -out haproxy-cert-temp.pem -nodes -legacy -nokeys -passin pass:<REPLACE_PASSWORD_1> #-clcerts

else
   echo "Current OpenSSL version is '"$openssl_version"', and it is lower than 3.0.0"
	#Export the private key from pkcs12 IDS certificate
  openssl pkcs12 -in ./connector-conf/ids.certificate.p12 -out ids.certificate.key.pem -nocerts -nodes -passin pass:<REPLACE_PASSWORD_1>

  # Create pem file
  openssl pkcs12 -in ./connector-conf/ids.certificate.p12 -out haproxy-cert-temp.pem -nodes -nokeys -passin pass:<REPLACE_PASSWORD_1> #-clcerts

fi

cat ids.certificate.key.pem haproxy-cert-temp.pem > haproxy-cert.pem

# Delete private key and haproxy-cert-temp.pem
rm ids.certificate.key.pem haproxy-cert-temp.pem

# Create JKS keystore and import PKCS12 keystore

keytool -importkeystore \
    -srckeystore ./connector-conf/ids.certificate.p12 \
    -srcstoretype PKCS12 \
    -destkeystore keystore.jks \
    -srcstorepass <REPLACE_PASSWORD_1> \
    -deststorepass password

# Move keystore and .pem to app4edi-conf folder

mv keystore.jks ./app4edi-conf
