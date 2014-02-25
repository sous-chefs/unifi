# Encoding: UTF-8

# => Specify Unifi package to install
default['unifi']['package'] = 'unifi'

# => Guest Access Mode (pass/off)
# => When set to pass, guest networks stay online if controller inaccessible
# => When set to off, guest networks are not available if inaccessible
default['unifi']['config']['selfrun_guest_mode'] = 'off'

# => Unifi Configuration Directory (Don't Touch!)
default['unifi']['config']['dir'] = '/usr/lib/unifi/data/'

# => Firewall Management
default['unifi']['ufw']['managed'] = true

# => Unifi Port Configuration (Don't Touch!)
default['unifi']['port']['web_gui'] = '8443'
default['unifi']['port']['guest_http'] = '8880'
default['unifi']['port']['guest_https'] = '8843'
default['unifi']['port']['mgmt'] = '8080..8081'
default['unifi']['port']['discovery'] = '10001'
