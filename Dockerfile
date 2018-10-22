FROM golang:1.10.3 as builder

WORKDIR /root/go/src/github.com/mirzakhany/gogen/
ADD . /root/go/src/github.com/mirzakhany/gogen/
RUN make build

FROM alpine
COPY --from=builder /root/go/src/github.com/mirzakhany/gogen/dist/gogen .
RUN apk add --no-cache ca-certificates
RUN rm -rf /var/cache/apk/*
ENTRYPOINT ["/gogen"]
