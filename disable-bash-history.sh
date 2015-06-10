#! /bin/sh

#
# Disable history file in Bash
#

echo '
# Disable history file
unset HISTFILE' >> /etc/bash.bashrc
