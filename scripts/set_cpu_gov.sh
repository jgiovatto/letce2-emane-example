#!/bin/bash

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

GOVERNOR="performance" # Replace 'performance' with your desired governor (e.g., 'ondemand', 'powersave', 'schedutil')

echo "Setting CPU governor to $GOVERNOR for all cores..."

# Iterate over all CPU core directories and set the governor
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo "$GOVERNOR" | tee "$cpu"
done

echo "Done."

# Verify the setting (optional)
echo "Current governors:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
