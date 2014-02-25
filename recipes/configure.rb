# Encoding: UTF-8
#
# Cookbook Name:: ubnt-unifi
# Recipe:: configure
#
# Copyright (C) 2014 Intelligent Digital Services - Brian Dwyer
#
# All rights reserved - Do Not Redistribute
#

# => Shorten Hashes
unifi = node['unifi']

# => Unifi - Guest Access Control
template File.join(unifi['config']['dir'], 'config.properties') do
  source 'config.properties.erb'
  owner 'root'
  group 'root'
  mode '0600'
  notifies :restart, 'service[unifi]'
end
