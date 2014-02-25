# Encoding: UTF-8

# => Unifi Firewall Rules
default['firewall']['rules'] = [
   { 'Unifi - AdminWebUI' => {
       'port' => node['unifi']['port']['web_gui'],
       'protocol' => 'tcp'
     }
   },
   { 'Unifi - Guest Portal (HTTP)' => {
      'port' => node['unifi']['port']['guest_http'],
      'protocol' => 'tcp'
     }
   },
   { 'Unifi - Guest Portal (HTTPS)' => {
      'port' => node['unifi']['port']['guest_https'],
      'protocol' => 'tcp'
     }
   },
   { 'Unifi - AP Management' => {
      'port_range' => node['unifi']['port']['mgmt'],
      'protocol' => 'tcp'
     }
   },
   { 'Unifi - AP Discovery' => {
      'port' => node['unifi']['port']['discovery'],
      'protocol' => 'udp'
     }
   }
]
