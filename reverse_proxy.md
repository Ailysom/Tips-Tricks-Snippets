# Reverse proxy

## Nginx

### Config example

https to http

```nginx
upstream http_backend {
	server <server_name>:80;
	keepalive 16;
}
server {
	listen 443 ssl;

	ssl_certificate /etc/nginx/ssl/for_nginx.crt;
	ssl_certificate_key /etc/nginx/ssl/for_nginx.rsa;

	underscores_in_headers on;

	location / {
		proxy_pass http://http_backend/;
		proxy_http_version 1.1;
		proxy_set_header Connection "";
	}
}
```

http to http

```nginx
upstream http_backend {
	server <server_name>:80;
	keepalive 16;
}
server {
	listen 80;

	underscores_in_headers on;

	location / {
		proxy_pass http://http_backend/;
		proxy_http_version 1.1;
		proxy_set_header Connection "";
	}
}
```

## HAProxy

Config example

```HAProxy
defaults
	mode                    http
	log                     global
	option                  httplog
	option                  redispatch
	option                  contstats
	option                  dontlognull
	no option               http-server-close
	no option               httpclose
	retries                 3
	timeout http-request    10s
	timeout queue           1m
	timeout connect         10s
	timeout client          1m
	timeout server          1m
	timeout http-keep-alive 10s
	timeout check           10s
	maxconn                 7000

frontend http_frontend
    # FOR HTTPS TO HTTP
	bind *:443 ssl crt /etc/haproxy/ssl/for_nginx.pem
    # FOR HTTP TO HTTP
	bind *:80
	mode http
	default_backend http-backend

backend http-backend
	mode http
	server http-server <server_name>:80 check
	balance roundrobin
	cookie SRV insert nocache
	option forwardfor
```

Also avaliable `mode tcp`

Add servers to backend for load balancing.
