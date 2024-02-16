# SSL

## Self signed

Create self signed certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./selfsigned.key -out ./selfsigned.crt
```

## PFX

Parse `.pfx` certificate to `.crt` and `.rsa`

```bash
openssl pkcs12 -in for_nginx.pfx -clcerts -nokeys -out for_nginx.crt
openssl pkcs12 -in for_nginx.pfx -nocerts -nodes -out for_nginx.rsa
```
