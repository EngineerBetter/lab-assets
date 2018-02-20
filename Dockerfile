FROM alpine:3.7

RUN apk update && apk add go build-base bash
