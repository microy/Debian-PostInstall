#! /bin/sh

# Download Google Chrome
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Install Google Chrome
dpkg -i /tmp/chrome.deb
apt -f -y install
