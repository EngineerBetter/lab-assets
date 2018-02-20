FROM alpine:3.7

RUN apk update && apk add go build-base bash git
RUN mkdir /go
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin
RUN go get -u github.com/alecthomas/gometalinter && gometalinter -i
RUN mv $GOPATH/bin/gometalinter $GOPATH/bin/gometalinter.real && printf "#!/bin/bash\ngometalinter.real | head -n1" > $GOPATH/bin/gometalinter && chmod +x $GOPATH/bin/gometalinter
