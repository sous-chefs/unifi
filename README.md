# unifi Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/unifi.svg)][cookbook] [![CircleCI](https://circleci.com/gh/sous-chefs/unifi.svg?style=svg)](https://circleci.com/gh/sous-chefs/unifi)

This Cookbook includes Recipes to install, configure & enable Ubiquiti's UniFi Access-Point controller software.

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

This project exists thanks to all the people who contribute.
<img src="https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false" /></a>


### Backers

Thank you to all our backers! 🙏 [[Become a backer](https://opencollective.com/sous-chefs#backer)]
<a href="https://opencollective.com/sous-chefs#backers" target="_blank"><img src="https://opencollective.com/sous-chefs/backers.svg?width=890"></a>

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/sous-chefs#sponsor)]
<a href="https://opencollective.com/sous-chefs/sponsor/0/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/1/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/2/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/3/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/4/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/5/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/6/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/7/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/8/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/sous-chefs/sponsor/9/website" target="_blank"><img src="https://opencollective.com/sous-chefs/sponsor/9/avatar.svg"></a>

## License

```text
Copyright 2014-2016 Orion Labs, Inc.
Copyright 2016 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[cookbook]: https://community.opscode.com/cookbooks/unifi
