#!/bin/bash

# EralpAhmet Trading Website Start Script
echo "🚀 Starting EralpAhmet Trading Website..."

# Check if logs directory exists
if [ ! -d "logs" ]; then
    echo "📁 Creating logs directory..."
    mkdir -p logs
fi

# Check if server is already running
if [ -f "webapp.pid" ]; then
    PID=$(cat webapp.pid)
    if ps -p $PID > /dev/null 2>&1; then
        echo "⚠️  Server is already running (PID: $PID)"
        echo "📱 Website: http://localhost:8000"
        exit 1
    else
        echo "🧹 Cleaning up stale PID file..."
        rm webapp.pid
    fi
fi

# Start the server
echo "🌐 Starting HTTP server on port 8000..."
nohup python3 -m http.server 8000 > logs/webapp.log 2>&1 &

# Save PID
SERVER_PID=$!
echo $SERVER_PID > webapp.pid

# Wait a moment to check if server started successfully
sleep 2

if ps -p $SERVER_PID > /dev/null 2>&1; then
    echo "✅ Server started successfully!"
    echo "📋 Process ID: $SERVER_PID"
    echo "📱 Website: http://localhost:8000"
    echo "📝 Logs: tail -f logs/webapp.log"
    echo "🛑 Stop: ./stop.sh"
else
    echo "❌ Failed to start server"
    rm -f webapp.pid
    exit 1
fi 