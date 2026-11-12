# UniFi cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/unifi.svg)](https://supermarket.chef.io/cookbooks/unifi)
[![CI](https://github.com/sous-chefs/unifi/actions/workflows/ci.yml/badge.svg)](https://github.com/sous-chefs/unifi/actions/workflows/ci.yml)

Installs **UniFi OS Server** on a clean Linux host using the official vendor
installer. This cookbook does not manage backups, data migration, application
configuration or upgrades.

Cookbook 3 replaces the legacy UniFi Network Server recipes and attributes with
the [unifi_os_server](documentation/unifi_os_server.md) custom resource.
See [the cookbook API changes](migration.md) before upgrading.

## Requirements

* Chef Infra Client 15.3+ or a compatible Cinc Client.
* Ubuntu 24.04+ or Debian 13+, running systemd.
* x86-64 or ARM64 CPU, at least 2 GB RAM and sufficient disk space for the vendor
  installer. Consult the [official requirements](https://help.ui.com/hc/en-us/articles/34210126298775-Self-Hosting-UniFi)
  for deployment sizing.
* A pinned official Linux installer URL matching the host architecture and its
  independently verified SHA-256 checksum.

Ubuntu and Debian distribution packages supply Podman, pasta and slirp4netns.
There is no Java cookbook dependency and no legacy UniFi APT repository.

## Usage

Obtain an installer URL from the [vendor download page](https://ui.com/download/software/unifi-os-server),
verify its SHA-256 digest, then pass both explicitly:

```ruby
unifi_os_server 'controller' do
  installer_url 'https://fw-download.ubnt.com/data/unifi-os-server/5172-linux-x64-5.1.42-12e9e3cf-8f8b-4e54-928c-76b80a10c8a4.42-x64'
  installer_checksum 'f6111e9396a42c74016f5dde9b01fbef486a6fe69efe137935e6e38b7c22f94d'
end
```

This example is UniFi OS Server 5.1.42 for x86-64. Use the appropriate vendor
installer and digest for ARM64.

The resource installs host prerequisites, invokes the installer in non-interactive
pasta mode, and enables and starts `uosserver.service`. The vendor installer
performs its normal resource and port checks. Once installed, later converges do
not reinstall, downgrade or update UniFi OS Server. Product and application
updates remain outside this cookbook's scope.

Existing legacy Network Server state causes a clear failure before any packages,
services or data are changed. Installing the new product over an existing
controller, transferring data and uninstalling either product are outside scope.

## Testing

See [TESTING.md](TESTING.md). Real installation tests require disposable systemd
VMs. The vendor does not support running UniFi OS Server as a standalone Docker
container.
