# ---------- Build stage ----------
FROM maven:3.9.4-eclipse-temurin-21 AS build

# Set working directory
WORKDIR /app

# Copy the current directory (foths-backend) into the container
COPY . .

# Verify the POM exists before building
RUN if [ ! -f pom.xml ]; then echo "ERROR: pom.xml not found!" && exit 1; fi

# Build the project without running tests
ENV MAVEN_OPTS="-Xmx512m -Xms128m"
RUN mvn clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:21-jre

# Set working directory for runtime
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target ./target

# Automatically run the first JAR in target/
CMD ["sh", "-c", "java --enable-preview -jar target/$(ls target | grep '.jar' | head -n1)"]

