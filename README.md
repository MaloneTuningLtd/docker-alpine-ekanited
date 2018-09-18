# Alpine Ekanited

Yet another alpine container for Ekanite.

## Usage

Ekanite data is stored to `/data`. You will want to persist this directory.

The default Ekanite ports are used:
- `5514`: tcp syslog
- `5514/udp`: udp syslog
- `8080`: web UI
- `9950`: telnet
- `9951`: diagnostics

```sh
docker run \
    -v $PWD/data:/data \
    -p 8080:8080 \
    -p 5514:5514 \
    -p 5514:5514/udp \
    maloneweb/alpine-ekanited
```

