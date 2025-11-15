#!/bin/bash

set -e  # exit if any command fails

echo "🔄 Fetching secrets from Infisical..."

INFISICAL_TOKEN="st.3cb0b09b-083b-463b-8fae-a5f3953bfcf1.2f428fd9e6ccab148fae38742836bddc.2d36b1db599f33b02906e38d9966c04b" \
infisical export \
  --domain http://localhost:80 \
  --env=dev \
  --format=dotenv \
  > .env


echo "✅ .env file has been refreshed."

echo "🐳 Starting Docker services..."
docker compose up --build -d

echo "waiting for buffer time"
sleep 2

echo "🧹 Cleaning up .env..."
rm -f .env

echo "✅ Done. .env removed."