FROM golang:latest AS build

COPY . /app
WORKDIR  /app

RUN go build dispatcher.go

FROM debian:latest AS runner

COPY --from=build /app/dispatcher /app/
COPY --from=build /app/static /app/static
RUN adduser --system golang

WORKDIR /app
USER golang
EXPOSE  80
CMD ./dispatcher
