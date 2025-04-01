#!/usr/bin/env bash

# Get total CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | cut -d ',' -f 4 | awk '{print 100 - $1"%"}')

# Get total memory usage
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")

# Display results
echo "===== System Statistics ====="
echo "Total CPU Usage: $CPU_USAGE"
echo ""
echo "Memory Usage:"
echo "Total: ${MEM_TOTAL}MB"
echo "Used: ${MEM_USED}MB"
echo "Free: ${MEM_FREE}MB"
echo "Usage: ${MEM_PERCENT}%"
echo ""
