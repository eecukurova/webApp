#!/bin/bash

# EralpAhmet Trading Website Restart Script
echo "🔄 Restarting EralpAhmet Trading Website..."

# Stop the server first
echo "⏹️  Stopping current server..."
./stop.sh

# Wait a moment
echo "⏳ Waiting 2 seconds..."
sleep 2

# Start the server
echo "▶️  Starting server..."
./start.sh

echo "🔄 Restart completed!" 