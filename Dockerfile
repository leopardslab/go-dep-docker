FROM golang

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

ENTRYPOINT ["dep"]

