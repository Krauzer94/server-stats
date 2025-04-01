#!/usr/bin/env bash

# Get total CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | cut -d ',' -f 4 | awk '{print 100 - $1"%"}')

# Get total memory usage
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")

# Get total disk usage
DISK_TOTAL=$(df -h --total | grep 'total' | awk '{print $2}')
DISK_USED=$(df -h --total | grep 'total' | awk '{print $3}')
DISK_FREE=$(df -h --total | grep 'total' | awk '{print $4}')
DISK_PERCENT=$(df -h --total | grep 'total' | awk '{print $5}')

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
echo "Disk Usage:"
echo "Total: $DISK_TOTAL"
echo "Used: $DISK_USED"
echo "Free: $DISK_FREE"
echo "Usage: $DISK_PERCENT"
echo ""
