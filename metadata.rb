name              'unifi'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs/Configures Ubiquiti UniFi server.'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.2.0'
source_url        'https://github.com/sous-chefs/unifi'
issues_url        'https://github.com/sous-chefs/unifi/issues'
chef_version      '>= 13.0'

%w(ubuntu debian).each do |os|
  supports os
end

depends 'java'
