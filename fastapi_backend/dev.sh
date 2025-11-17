#!/bin/bash

set -e  # exit if any command fails

echo "🔄 Fetching secrets from Infisical..."

# This can be the shared infra
INFISICAL_TOKEN="st.0a71cccb-0f93-49f0-ae41-9b5bbad57e12.74ff9334a56a4c7c6c424ca4b7f3fab4.2c0b18a359e3e30838cdacc517f1c9df" \
infisical export \
  --domain http://localhost:80 \
  --env=staging \
  --format=dotenv \
  > .env

# this can be the specific service keys appended in the env file
INFISICAL_TOKEN="st.0a71cccb-0f93-49f0-ae41-9b5bbad57e12.74ff9334a56a4c7c6c424ca4b7f3fab4.2c0b18a359e3e30838cdacc517f1c9df" \
infisical export \
  --domain http://localhost:80 \
  --env=staging \
  --format=dotenv \
  >> .env


echo "✅ .env file has been refreshed."

echo "🐳 Starting Docker services..."
docker compose up --build -d

# echo "waiting for buffer time"
# sleep 2

# echo "🧹 Cleaning up .env..."
# rm -f .env

# echo "✅ Done. .env removed."