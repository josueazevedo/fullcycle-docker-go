FROM golang:1.13-alpine3.11 as build-stage
WORKDIR /app
COPY main.go .
RUN go build -ldflags '-s -w' main.go

FROM scratch

COPY --from=build-stage /app/main /

CMD ["/main"]