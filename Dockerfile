FROM golang as go-builder
WORKDIR /go/src
COPY ./src/hello.go .
RUN go build hello.go
FROM scratch
COPY --from=go-builder /go/src/hello .
ENTRYPOINT [ "./hello" ]

