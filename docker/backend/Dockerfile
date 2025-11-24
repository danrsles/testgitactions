# FROM mcr.microsoft.com/openjdk/jdk:21-ubuntu AS build  
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]
#EXPOSE 8080

# Stage 1: build with Maven
FROM maven:3.9.7-eclipse-temurin-21 AS build
WORKDIR /build

# Copy maven wrapper if you have it, or at least pom.xml
COPY pom.xml .

# Pre-download dependencies (caching)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: runtime
FROM eclipse-temurin:21-jre-jammy AS runtime
WORKDIR /app

# Copy the JAR from builder stage
COPY --from=build /build/target/*.jar /app/

# Expose port (if your app uses one)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "k8s-0.0.1-SNAPSHOT.jar"]

