# Configures unifi service.
#
# Recipe:: service
# Cookbook:: unifi
# Author:: Greg Albrecht <gba@onbeep.com>
# License:: Apache License, Version 2.0
# Copyright:: Copyright 2014 OnBeep, Inc.
# Source:: https://github.com/onbeep-cookbooks/unifi
#

service 'unifi' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
