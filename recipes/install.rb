# Encoding: UTF-8
#
# Cookbook Name:: ubnt-unifi
# Recipe:: install
#
# Copyright (C) 2014 Intelligent Digital Services - Brian Dwyer
#
# All rights reserved - Do Not Redistribute
#


apt_repository 'ubiquiti_unifi' do
  uri 'http://www.ubnt.com/downloads/unifi/distros/deb/ubuntu'
  distribution 'ubuntu'
  components ['ubiquiti']
  keyserver 'keyserver.ubuntu.com'
  key 'C0A52C50'
end


apt_package node['unifi']['package']


service 'unifi' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
