ARG gobuildref=1.20.1-bullseye
ARG debianref=bullseye-20230208-slim

FROM golang:$gobuildref AS build

COPY . /app
WORKDIR  /app

RUN go build dispatcher.go

FROM debian:$debianref AS runner

COPY --from=build /app/dispatcher /app/
COPY --from=build /app/static /app/static
RUN adduser --system golang

WORKDIR /app
USER golang
EXPOSE  80
CMD ./dispatcher
