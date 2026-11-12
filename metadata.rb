# frozen_string_literal: true

name              'unifi'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs UniFi OS Server on clean Linux hosts.'
version           '2.0.17'
source_url        'https://github.com/sous-chefs/unifi'
issues_url        'https://github.com/sous-chefs/unifi/issues'
chef_version      '>= 15.3'

supports 'ubuntu', '>= 24.04'
supports 'debian', '>= 13.0'
