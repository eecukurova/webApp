#!/bin/bash

# EralpAhmet Trading Website Stop Script
echo "🛑 Stopping EralpAhmet Trading Website..."

# Check if PID file exists
if [ ! -f "webapp.pid" ]; then
    echo "⚠️  No PID file found. Server might not be running."
    echo "🔍 Checking for python http.server processes..."
    
    # Look for python http.server processes on port 8000
    PIDS=$(ps aux | grep "python3 -m http.server 8000" | grep -v grep | awk '{print $2}')
    
    if [ -z "$PIDS" ]; then
        echo "✅ No server processes found."
        exit 0
    else
        echo "🔍 Found server processes: $PIDS"
        echo "🛑 Killing processes..."
        echo $PIDS | xargs kill -9
        echo "✅ Processes terminated."
        exit 0
    fi
fi

# Read PID from file
PID=$(cat webapp.pid)

# Check if process is running
if ps -p $PID > /dev/null 2>&1; then
    echo "🛑 Stopping server (PID: $PID)..."
    
    # Try graceful shutdown first
    kill $PID
    
    # Wait for graceful shutdown
    echo "⏳ Waiting for graceful shutdown..."
    sleep 3
    
    # Check if still running
    if ps -p $PID > /dev/null 2>&1; then
        echo "⚡ Force killing process..."
        kill -9 $PID
        sleep 1
    fi
    
    # Verify process is stopped
    if ps -p $PID > /dev/null 2>&1; then
        echo "❌ Failed to stop server"
        exit 1
    else
        echo "✅ Server stopped successfully!"
    fi
else
    echo "⚠️  Process $PID not found (server already stopped)"
fi

# Clean up PID file
echo "🧹 Cleaning up PID file..."
rm -f webapp.pid

echo "🏁 EralpAhmet Trading Website stopped." 