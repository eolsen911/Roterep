#!/bin/bash

while true; do
  for i in {130..139}; do
    ip="172.24.32.$i"
    echo "Pinging $ip..."
    ping -c 1 "$ip"
  done
  sleep 1  # Optional: wait 1 second between each full sweep
done