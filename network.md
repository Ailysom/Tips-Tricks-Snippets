# Network

## Shadowsocks

### Server installation

```bash
sudo apt install shadowsocks-libev
sudo systemctl start shadowsocks-libev
sudo systemctl enable shadowsocks-libev
```

Edit config in `/etc/shadowsocks-libev/config.json`. Example:

```conf
{
    "server":"111.111.111.111",
    "mode":"tcp_and_udp",
    "server_port":8888,
    "local_port":1080,
    "password":"SomeDificultPa$$",
    "timeout":86400,
    "method":"chacha20-ietf-poly1305"
}

```

`server` is public address. Run:

```bash
sudo systemctl restart shadowsocks-libev
```

### Client installation

```bash
sudo apt install shadowsocks-libev
sudo systemctl stop shadowsocks-libev
sudo systemctl disable shadowsocks-libev
```

Create config in `/etc/shadowsocks-libev/somename.json`. Example:

```conf
{
    "server":"111.111.111.111",
    "server_port":8888,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"SomeDificultPa$$",
    "timeout":86400,
    "method":"chacha20-ietf-poly1305"
}


```

Run:

```bash
sudo systemctl start shadowsocks-libev-local@somename.service
```

SOCKS5 anonymous accessable at localhost/1080.
