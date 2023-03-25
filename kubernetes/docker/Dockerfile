FROM node:alpine

RUN mkdir /app
RUN apk add --no-cache tini
WORKDIR /app
ARG APP_VERSION=v1
ENV APP_VERSION=$APP_VERSION

COPY . .

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["node", "index.js"]
