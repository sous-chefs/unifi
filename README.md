# ubnt-unifi cookbook
This is a cookbook to install the Ubiquiti Unifi AP Controller

# Requirements
Ubuntu 12.04 - Tested on 12.04.4

# Attributes
node['unifi']['package'] - Sets Unifi package to be installed (unifi, unifi-beta)
node['unifi']['ufw']['managed'] - true/false - Will open required ports for Unifi.

# Recipes
::default - Installs Unifi and configures ufw firewall if node['ufw']['managed'] is true.
::install - Installs Unifi
::ufw - Configures ufw firewall to open the required ports for Unifi.

# Author

Author:: Intelligent Digital Services - Brian Dwyer
