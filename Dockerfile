# Build stage
FROM maven:latest AS build
WORKDIR /
COPY . .
RUN mvn clean package -DskipTests

# Final image stage
FROM openjdk:22-slim
WORKDIR /
COPY --from=build /EMI.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "EMI.jar"]
