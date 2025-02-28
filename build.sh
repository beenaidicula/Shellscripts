#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting build process..."

# Example: Build a Java project using Maven
if [ -f "pom.xml" ]; then
    echo "Detected Maven project. Building..."
    mvn clean package -DskipTests
elif [ -f "build.gradle" ]; then
    echo "Detected Gradle project. Building..."
    ./gradlew build -x test
elif [ -f "package.json" ]; then
    echo "Detected Node.js project. Installing dependencies and building..."
    npm install
    npm run build
else
    echo "No recognized build system found. Please configure build.sh accordingly."
    exit 1
fi

echo "Build completed successfully!"

