# ubnt-unifi cookbook
This is a cookbook to install the Ubiquiti Unifi AP Controller

# Requirements
- Ubuntu 12.04 - Tested on 12.04.4

# Attributes
- node['unifi']['package'] - (unifi, unifi-beta) Sets Unifi package to be installed 
- node['unifi']['ufw']['managed'] - (true/false) - Will open required ports for Unifi.
- node['unifi']['config']['self_run_guest_mode'] - (pass/off) Controls behavior of guest SSID's when controller unavailable.
NOTE: The self_run_guest_mode won't take effect until a second Chef run after the controller has been configured.  The 3.X Unifi seems to not allow a configuration.properties to exist until the controller has been set up.  If the controller hasn't been set up, Unifi seems to delete the file.

# Recipes
- ::default - Installs Unifi and configures ufw firewall if node['ufw']['managed'] is true.
- ::install - Installs Unifi
- ::ufw - Configures ufw firewall to open the required ports for Unifi.

# Notes
Feel free to fork this, modify and/or add to it.
- At the moment, the 

# Author

Author:: Intelligent Digital Services - Brian Dwyer
