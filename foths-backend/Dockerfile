# ---------- Build stage ----------
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory (updated to match your backend folder)
WORKDIR "/app/foths-backend"

# Copy the full project into the container
COPY "foths-backend" "/app/foths-backend"

# Verify the POM exists before building
RUN if [ ! -f pom.xml ]; then echo "ERROR: pom.xml not found!" && exit 1; fi

# Build the project without running tests
RUN mvn clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:17-jre

# Set working directory for runtime
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build "/app/foths-backend/target/" ./target/

# Automatically run the first JAR in target/
CMD java -jar $(ls target/*.jar | head -n 1)
