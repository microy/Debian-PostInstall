
# Function to update Atom
function update-atom
{
  # Download and install Atom
  wget -O /tmp/atom.deb https://atom.io/download/deb
  dpkg -i /tmp/atom.deb
}
