FROM golang:latest
ADD . /go/src/tp-slack
WORKDIR /go/src/tp-slack

RUN go install .

ENTRYPOINT /go/bin/tp-slack
EXPOSE 8080
