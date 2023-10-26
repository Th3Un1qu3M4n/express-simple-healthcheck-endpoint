#!/bin/bash
# This script starts your Node.js server using PM2 and 'npm start'.

# Change to the directory where your application code is located
cd /deploy-nodejs-aws-cicd

# Start the Node.js server using PM2 and 'npm start'
pm2 start npm --name "simple-express" -- start

# Replace "your-app-name" with a suitable name for your application within PM2.
# This assumes that your 'package.json' file has a "start" script defined.
