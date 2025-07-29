#!/bin/bash

echo "==================== System Stats Report ===================="
echo

echo "OS Version      : $(lsb_release -d | cut -f2-)"
echo "Kernel Version  : $(uname -r)"
echo "Uptime          : $(uptime -p)"
echo "Load Average    : $(uptime | awk -F'load average:' '{ print $2 }')"
echo

echo "Logged-in Users :"
who
echo

echo "Recent Failed Login Attempts:"
lastb | head -n 10
echo

echo "-------------------- CPU Usage --------------------"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage      : " 100 - $8 "%"}'
echo

echo "-------------------- Memory Usage -----------------"
free -m | awk 'NR==2 {
    printf "Memory Used    : %s MB\nMemory Free    : %s MB\nMemory Total   : %s MB\nUsage          : %.2f%%\n", $3, $4, $2, $3*100/$2
    }'
    echo

    echo "-------------------- Disk Usage -------------------"
    df -h --total | awk '/^total/ {
        printf "Disk Used      : %s\nDisk Free      : %s\nDisk Total     : %s\nUsage          : %s\n", $3, $4, $2, $5
        }'
        echo

        echo "---------- Top 5 Processes by CPU Usage -----------"
        ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
        echo
        echo "---------- Top 5 Processes by Memory Usage --------"
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
        echo

        echo "==============================================================="

