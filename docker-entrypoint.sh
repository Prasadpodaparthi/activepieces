#!/bin/sh

# Start Nginx in the background
nginx -g "daemon off;" &

# Delay a bit to allow Nginx to start (optional, avoids race conditions)
sleep 2

# 👇 Force sync all Activepieces metadata into the database
echo "🔁 Syncing Activepieces piece metadata..."
node dist/packages/server/api/main.js sync-metadata

# Start the backend server
echo "🚀 Starting Activepieces backend..."
node --enable-source-maps dist/packages/server/api/main.js
