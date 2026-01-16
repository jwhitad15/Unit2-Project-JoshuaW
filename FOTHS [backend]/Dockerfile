# ---------- Build stage ----------
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory (quote for spaces and brackets)
WORKDIR "/app/FOTHS [backend]"

# Copy the full project into the container
COPY ./FOTHS\ [backend] "/app/FOTHS [backend]"

# Build the project without running tests
RUN mvn clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:17-jre

# Set working directory for runtime
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build "/app/FOTHS [backend]/target/" ./target/

# Automatically run the first JAR in target/
CMD java -jar $(ls target/*.jar | head -n 1)
