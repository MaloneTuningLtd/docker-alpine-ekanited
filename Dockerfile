FROM golang:alpine as builder

RUN echo && \
    apk update && \
    apk add git && \
    go get github.com/ekanite/ekanite && \
    go install github.com/ekanite/...

FROM alpine:latest

# copy our built binary
COPY --from=builder /go/bin/ekanited /usr/bin/ekanited

# add our beautiful bootstrap script
ADD run.sh /run.sh
RUN chmod +x /run.sh

# syslog port
EXPOSE 5514/tcp
EXPOSE 5514/udp
# telnet interface
EXPOSE 9950/tcp
# diagnostics (http://lcoalhost:9951/debug/vars)
EXPOSE 9951/tcp
# actual browser UI
EXPOSE 8080/tcp

ENTRYPOINT ["/run.sh"]
