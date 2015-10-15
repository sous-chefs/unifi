unifi Cookbook
====
[![Cookbook Version](http://img.shields.io/cookbook/v/unifi.svg)][cookbook]

[cookbook]: https://community.opscode.com/cookbooks/unifi

This Cookbook includes Recipes to install, configure & enable Ubiquiti's UniFi Access-Point controller software.

Requirements
----

### Platform

* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS

May work with or without modification on other Debian derivatives.

Recipes
----
### default
Includes other requisite Recipes - **USE THIS**.

### ppa
Configures Ubiquiti's PPA repository for package installs.

### package
Installs unifi package.

### service
Configures unifi service.

### _java_link_trusty_tahr
Work-around for Ubuntu Trust Tahr's Java install.

Usage
----
Put `recipe[unifi]` in the Run List. Run Chef. Enjoy.

Authors
----
- Author:: Brian Dwyer https://github.com/bdwyertech
- Author:: Greg Albrecht (gba@onbeep.com) https://github.com/ampledata

License
----
```text
Copyright 2014 OnBeep, Inc.

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
