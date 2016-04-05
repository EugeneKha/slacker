FROM golang:latest
ADD . /go/src/slacker
WORKDIR /go/src/slacker

RUN go install .

ENTRYPOINT /go/bin/slacker
EXPOSE 8080
