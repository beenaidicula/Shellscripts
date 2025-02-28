#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting test execution..."

# Example: Run tests based on the project type
if [ -f "pom.xml" ]; then
    echo "Detected Maven project. Running tests..."
    mvn test
elif [ -f "build.gradle" ]; then
    echo "Detected Gradle project. Running tests..."
    ./gradlew test
elif [ -f "package.json" ]; then
    echo "Detected Node.js project. Running tests..."
    npm test
elif [ -f "pytest.ini" ] || [ -d "tests" ]; then
    echo "Detected Python project. Running pytest..."
    pytest --verbose
else
    echo "No recognized test framework found. Please configure run-tests.sh accordingly."
    exit 1
fi

echo "Tests completed successfully!"

