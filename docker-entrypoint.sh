#!/bin/sh

# Start Nginx
nginx -g "daemon off;" &

# Force metadata sync
echo "📦 Syncing pieces..."
node dist/packages/server/api/main.js sync-metadata &

# Start backend server
node --enable-source-maps dist/packages/server/api/main.js
