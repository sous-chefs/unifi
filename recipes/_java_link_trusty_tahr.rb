# Work-around for Ubuntu Trust Tahr's Java install.
# per http://community.ubnt.com/t5/UniFi/Issue-UniFi-Controller-on-Ubuntu-14-04/td-p/816798
#
# Recipe:: _java_link_trusty_tahr
# Cookbook:: unifi
# Author:: Greg Albrecht <gba@onbeep.com>
# License:: Apache License, Version 2.0
# Copyright:: Copyright 2014 OnBeep, Inc.
# Source:: https://github.com/onbeep-cookbooks/unifi
#


link '/usr/lib/jvm/java-6-openjdk' do
  to '/usr/lib/jvm/java-6-openjdk-amd64'
end
