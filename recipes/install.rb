# Encoding: UTF-8
#
# Cookbook Name:: ubnt-unifi
# Recipe:: install
#
# Copyright (C) 2014 Intelligent Digital Services - Brian Dwyer
#
# All rights reserved - Do Not Redistribute
#

# => Shorten Hashes
unifi = node['unifi']

# => Install Ubiquiti Unifi APT Repository
apt_repository 'ubiquiti_unifi' do
  uri 'http://www.ubnt.com/downloads/unifi/distros/deb/ubuntu'
  distribution node['lsb']['codename']
  components ['ubiquiti']
  keyserver 'keyserver.ubuntu.com'
  key 'C0A52C50'
  action :add
end

# => Install MongoDB APT Repository
apt_repository 'MongoDB' do
  uri 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart'
  distribution 'dist'
  components ['10gen']
  keyserver 'keyserver.ubuntu.com'
  key '7F0CEB10'
  action :add
end

# => Install MongoDB
apt_package 'mongodb-10gen' do
  action :install
end

# => Install Unifi Controller
apt_package unifi['package'] do
  action :install
end

# => At this time, Unifi runs it's own Mongo daemon... No need for this one!
service 'mongodb' do
  supports status: true, restart: true, reload: true
  action [:disable, :stop]
end

# => Enable Unifi at boot and start the service
service 'unifi' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
