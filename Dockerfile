FROM golang

ARG PACKAGE=github.com/chtison/go-extend/

COPY main.go /go/src/$PACKAGE
ENV CGO_ENABLED=0
RUN go get $PACKAGE
RUN go install $PACKAGE

FROM alpine

COPY --from=0 /go/bin/go-extend /usr/local/bin/go-extend

ENTRYPOINT ["go-extend"]
CMD ["--help"]
