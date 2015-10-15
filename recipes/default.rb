# Includes requisite Recipies for unifi.
#
# Recipe:: default
# Cookbook:: unifi
# Author:: Greg Albrecht <gba@onbeep.com>
# License:: Apache License, Version 2.0
# Copyright:: Copyright 2014 OnBeep, Inc.
# Source:: https://github.com/onbeep-cookbooks/unifi
#

include_recipe 'unifi::repository'
include_recipe 'unifi::package'

if platform?('ubuntu') && node['lsb']['codename'] == 'trusty'
  include_recipe 'unifi::_java_link_trusty_tahr'
end

include_recipe 'unifi::service'
