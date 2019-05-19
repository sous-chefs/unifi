# unifi Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/unifi.svg)](https://supermarket.chef.io/cookbooks/unifi)
[![Build Status](https://img.shields.io/circleci/project/github/sous-chefs/unifi/master.svg)](https://circleci.com/gh/sous-chefs/unifi)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

This Cookbook includes Recipes to install, configure & enable Ubiquiti's UniFi Access-Point controller software.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platform

- Ubuntu
- Debian

### Chef

- Chef 12.1+

### Java

UniFi requires Java 8 ([UniFi Java Requirements](https://help.ubnt.com/hc/en-us/articles/360008240754#7)). The `java` cookbook can be used to install JRE 8 with the appropriate attributes:

```ruby
node.default['java']['jdk_version'] = "8"
include_recipe 'java'
```

## Recipes

### default

Includes other requisite Recipes - **USE THIS**.

### ppa

Configures Ubiquiti's PPA repository for package installs.

### package

Installs unifi package.

### service

Configures unifi service.

## Usage

Put `recipe[unifi]` in the Run List. Run Chef. Enjoy.

## Authors

- Author:: Brian Dwyer <https://github.com/bdwyertech>
- Author:: Greg Albrecht (gba@orionlabs.io) <https://github.com/ampledata>
- Author:: Tim Smith (tsmith@chef.io) <https://github.com/tas50>

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
