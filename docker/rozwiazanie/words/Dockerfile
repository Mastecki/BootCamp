ARG maven_img_ref=3.9.0-eclipse-temurin-8

FROM maven:$maven_img_ref as build

COPY ./ /app/
WORKDIR /app

RUN mvn install

FROM eclipse-temurin:8u362-b09-jre-focal

RUN adduser --system javausr

COPY --from=build /app/target /app/
WORKDIR /app
USER javausr
EXPOSE 8080
CMD java -jar words.jar
