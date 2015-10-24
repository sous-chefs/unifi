# Default Attributes for unifi.
#
# Attributes:: default
# Cookbook:: unifi
# Author:: Greg Albrecht <gba@onbeep.com>
# License:: Apache License, Version 2.0
# Copyright:: Copyright 2014 OnBeep, Inc.
# Source:: https://github.com/onbeep-cookbooks/unifi
#

#
# Specify Unifi package to install.
#   There are 3 packages in the same repository:
#     - unifi       (the most stable)
#     - unifi-rapid (soaked beta/rc/stable)
#     - unifi-beta  (the cutting edge)
#   BONUS: You can install / switch between them!
#
default['unifi']['package'] = 'unifi'
