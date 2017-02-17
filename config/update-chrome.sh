
# Function to update Google Chrome
function update-chrome
{
  # Download and install Google Chrome
  wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i /tmp/chrome.deb
}
