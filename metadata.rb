name             'unifi'
maintainer       'Tim Smith'
maintainer_email 'tsmith@chef.io'
license          'Apache-2.0'
description      'Installs/Configures Ubiquiti UniFi server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.2.0'

supports 'ubuntu'
supports 'debian'

depends 'apt'
source_url 'https://github.com/sous-chefs/unifi'
issues_url 'https://github.com/sous-chefs/unifi/issues'
chef_version '>= 12.1'
