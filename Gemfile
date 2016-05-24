# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Gemfile for unifi Cookbook.
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/unifi
#

source 'https://rubygems.org'

group :lint do
  gem 'foodcritic', '~> 5.0'
  gem 'rubocop', '~> 0.34'
end

group :unit do
  gem 'berkshelf',  '~> 4.0'
  gem 'chefspec',   '~> 4.4'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.4'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.19'
end

group :integration do
  gem 'thor-scmversion', '1.4.0'
end
