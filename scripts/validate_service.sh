#!/bin/bash
# This script validates the status of your Node.js service.

# Check if your Node.js server is running by sending an HTTP request or another method
# For example, you can use curl to check if the server is responsive.
# Replace 'http://localhost:3000' with the actual URL of your application.
if curl -s --head --request GET http://localhost:3000/healthcheck | head -n 1 > /dev/null; then
  echo "Validation successful: The Node.js service is running."
  exit 0
else
  echo "Validation failed: The Node.js service is not running as expected."
  exit 1
fi
