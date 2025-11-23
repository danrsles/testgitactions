FROM mcr.microsoft.com/openjdk/jdk:21-ubuntu AS build  
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080