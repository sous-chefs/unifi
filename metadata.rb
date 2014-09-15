name             'unifi'
maintainer       'Greg Albrecht'
maintainer_email 'gba@onbeep.com'
license          'Apache License, Version 2.0'
description      'Installs/Configures Ubiquiti UniFi server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '1.0.0'

depends 'apt'
