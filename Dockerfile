FROM golang:alpine

RUN apk add curl \
&&  curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

ENTRYPOINT ["dep"]

