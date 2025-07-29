#!/bin/bash

# Get total CPU usage using top and awk
echo "Total CPU usage:"

#Parse CPU idle value and subtract from 100%
top -bn1 | grep "Cpu(s)" | \
awk '{usage = 100 - $8; printf "CPU Usage: %.2f%%\n", usage}'


