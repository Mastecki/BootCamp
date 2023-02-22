# syntax=docker/dockerfile:1.4
ARG maven_img_ref=3.9.0-eclipse-temurin-8

FROM maven:$maven_img_ref as build

COPY ./ /app/
WORKDIR /app

RUN mvn install

FROM build as dev-envs

RUN <<EOF
apt update
apt install -y git
EOF

RUN <<EOF
addgroup --system docker
adduser --system --shell /bin/bash --ingroup docker vscode
EOF

# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /

CMD ["java", "-jar", "target/words.jar"]

FROM eclipse-temurin:8u362-b09-jre-focal

RUN adduser --system javausr

COPY --from=build /app/target /app/
WORKDIR /app
USER javausr
EXPOSE 8080
CMD java -jar words.jar
