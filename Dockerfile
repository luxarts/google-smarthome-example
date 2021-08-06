FROM golang:rc-alpine3.14 AS builder

RUN mkdir /build
WORKDIR /build
COPY . .
WORKDIR /build
RUN go build -o google-smarthome-example ./cmd/main.go

FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/google-smarthome-example /app/
WORKDIR /app
CMD ["./google-smarthome-example"]