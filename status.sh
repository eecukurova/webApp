#!/bin/bash

# EralpAhmet Trading Website Status Script
echo "📊 EralpAhmet Trading Website Status"
echo "===================================="

# Check if PID file exists
if [ -f "webapp.pid" ]; then
    PID=$(cat webapp.pid)
    echo "📋 PID file found: $PID"
    
    # Check if process is running
    if ps -p $PID > /dev/null 2>&1; then
        echo "✅ Status: RUNNING"
        echo "📋 Process ID: $PID"
        echo "📱 Website: http://localhost:8000"
        echo "🕒 Uptime: $(ps -p $PID -o etime= | tr -d ' ')"
        echo "💾 Memory: $(ps -p $PID -o rss= | tr -d ' ') KB"
        
        # Check if port is listening
        if lsof -i :8000 > /dev/null 2>&1; then
            echo "🌐 Port 8000: LISTENING"
        else
            echo "⚠️  Port 8000: NOT LISTENING"
        fi
        
        # Check log file
        if [ -f "logs/webapp.log" ]; then
            LOG_SIZE=$(wc -c < logs/webapp.log)
            echo "📝 Log file: logs/webapp.log (${LOG_SIZE} bytes)"
            echo "📄 Last 3 log lines:"
            tail -n 3 logs/webapp.log | sed 's/^/    /'
        else
            echo "📝 Log file: NOT FOUND"
        fi
        
    else
        echo "❌ Status: STOPPED (stale PID file)"
        echo "🧹 Run ./stop.sh to clean up"
    fi
else
    echo "📋 PID file: NOT FOUND"
    
    # Check for running processes
    PIDS=$(ps aux | grep "python3 -m http.server 8000" | grep -v grep | awk '{print $2}')
    
    if [ -z "$PIDS" ]; then
        echo "❌ Status: STOPPED"
    else
        echo "⚠️  Status: RUNNING (without PID file)"
        echo "🔍 Found processes: $PIDS"
        echo "🛠️  Run ./stop.sh to clean up orphaned processes"
    fi
fi

echo ""
echo "🎮 Available commands:"
echo "   ./start.sh  - Start the server"
echo "   ./stop.sh   - Stop the server"
echo "   ./status.sh - Check server status"
echo "   tail -f logs/webapp.log - View live logs" 