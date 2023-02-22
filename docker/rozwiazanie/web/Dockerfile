FROM golang:latest AS build

COPY . /app
WORKDIR  /app

RUN go build dispatcher.go

