#!/bin/bash

#--
#
# Clean backup files
#
#--

# Remove backup files
find . -type f -name '*~' -exec rm -v {} \;

