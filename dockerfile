FROM golang:1.23-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o hello hello.go

FROM scratch

COPY --from=builder /usr/src/app/hello /hello

CMD ["/hello"]