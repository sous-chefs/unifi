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

#
# Specify the apt components
#   There are three available
#     - unifi4/stable  (Unifi version 4.x.x)
#     - unifi5         (Unifi version 5.x.x)
#     - unifi3         (Unifi version 3.x.x)
#
default['unifi']['apt_components'] = %w(stable ubiquiti)
