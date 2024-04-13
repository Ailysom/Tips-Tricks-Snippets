# SSL

## Show cert

Local

```bash
openssl x509 -in fqdn.crt -noout -text
```

Verify local

```bash
openssl verify -CAfile ca.crt fqdn.crt

```

Remote

```bash
openssl s_client -showcerts -servername <ip>:<port> -connect <ip>:<port>
```

```bash
openssl s_client -showcerts -servername <ip>:<port> -connect <ip>:<port> | openssl x509 -text
```

## Self signed

Create self signed certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./selfsigned.key -out ./selfsigned.crt
```

## CA

Create key & cert

```bash
openssl genpkey -algorithm RSA -out ca.key
openssl req -new -x509 -key ca.key -out ca.crt
```

## Create csr

```bash
openssl genpkey -algorithm RSA -out fqdn.key
openssl req -new -key fqdn.key -out fqdn.csr -config fqdn.conf
```

fqdn.conf example

```conf
[ req ]
req_extensions = v3_req

[ v3_req ]
subjectAltName = @alt_names

[ req ]
prompt = no
distinguished_name = dn

[ dn ]
CN = fqdn
C = Country
ST = State
L = City
O = Organization
OU = Department

[ alt_names ]
IP.1 = 10.0.0.2
IP.2 = 123.127.201.25
```

## Sign

```bash
openssl x509 -req -in fqdn.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out fqdn.crt -days 3650 -extfile v3.ext
```

 v3.ext example

 ```conf
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
IP.1 = 10.0.0.2
IP.2 = 123.127.201.25
 ```

## JKS

Create trust store

```bash
keytool -genkey -keyalg RSA -alias myKey -keystore truststore.jks -storepass password
```

Add CA cert

```bash
keytool -import -trustcacerts -alias myCA -file ca.crt -keystore truststore.jks -storepass password
```

Service cert

```bash
openssl pkcs12 -export -in your_certificate.crt -inkey your_private_key.key -out certificate.p12 -name "my_certificate_alias"
keytool -genkey -keyalg RSA -alias myKey -keystore keystore.jks -storepass password
keytool -importkeystore -deststorepass password -destkeypass password -destkeystore keystore.jks -srckeystore certificate.p12 -srcstoretype PKCS12 -srcstorepass password -alias "my_certificate_alias"
```

## PFX

Parse `.pfx` certificate to `.crt` and `.rsa`

```bash
openssl pkcs12 -in for_nginx.pfx -clcerts -nokeys -out for_nginx.crt
openssl pkcs12 -in for_nginx.pfx -nocerts -nodes -out for_nginx.rsa
```
