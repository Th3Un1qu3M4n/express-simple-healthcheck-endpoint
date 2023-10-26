#!/bin/bash
# This script installs the necessary dependencies for your Node.js application, including Node.js, npm, and PM2.

# Change to the directory where your application code is located
cd /deploy-nodejs-aws-cicd

# Install Node.js if it's not already installed
if ! command -v node &>/dev/null; then
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# Install npm if it's not already installed
if ! command -v npm &>/dev/null; then
  sudo apt-get install -y npm
fi

# Install PM2 globally if it's not already installed
if ! command -v pm2 &>/dev/null; then
  npm install -g pm2
fi

# Install npm packages
npm install

# You may want to perform other setup tasks here, such as database migrations or environment configuration.