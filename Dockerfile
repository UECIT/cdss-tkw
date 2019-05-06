FROM openjdk:8-jdk-alpine 

WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
COPY TKW TKW

RUN chmod -R 777 /workspace/app/*

ADD tkw-client.jar tkw-client.jar
EXPOSE 5000
CMD ./mvnw spring-boot:run
