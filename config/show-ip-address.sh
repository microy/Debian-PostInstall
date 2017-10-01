#! /bin/sh

# Ignore the sloopback interface
if [ "$METHOD" = loopback ]; then
    exit 0
fi

# Only run from ifup
if [ "$MODE" != start ]; then
    exit 0
fi

# Copy the original login message
cp /etc/issue-standard /etc/issue
# Get the network interfaces and their IP addresses,
# and add them in the login message
ip -o addr show up primary scope global | awk '{print $2":",$4}' >> /etc/issue
echo "" >> /etc/issue
