# Encoding: UTF-8
#
# Cookbook Name:: ubnt-unifi
# Recipe:: default
#
# Copyright (C) 2014 Intelligent Digital Services - Brian Dwyer
#
# All rights reserved - Do Not Redistribute
#

# => Shorten Hashes
unifi = node['unifi']

include_recipe 'ubnt-unifi::install'
include_recipe 'ubnt-unifi::configure'
include_recipe 'ufw' if unifi['ufw']['managed']
