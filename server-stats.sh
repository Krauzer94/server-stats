#!/usr/bin/env bash

# Get total CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | cut -d ',' -f 4 | awk '{print 100 - $1"%"}')
CPU_USAGE_DETAILS=$(top -bn1 | grep "Cpu(s)")

# Display results
echo "===== System Statistics ====="
echo "Total CPU Usage: $CPU_USAGE"
echo ""
