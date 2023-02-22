FROM golang:latest AS build

COPY . /app
WORKDIR  /app

RUN go build dispatcher.go

FROM debian:latest AS runner

COPY --from=build /app/dispatcher /app/
COPY --from=build /app/static /app/static

WORKDIR /app
CMD ./dispatcher
