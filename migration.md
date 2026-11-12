# Cookbook 3 API changes

Cookbook 3 manages **UniFi OS Server**, a different product from the legacy
UniFi Network Server installed by cookbook 2.

* Replace the `unifi::default`, `unifi::ppa`, `unifi::package` and
  `unifi::service` recipe APIs with the `unifi_os_server` resource in a wrapper
  cookbook.
* The `node['unifi']['package']` and `node['unifi']['apt_components']`
  attributes are removed.
* The legacy APT repository and Java dependency are removed from the cookbook.
  Existing host repositories, packages and databases are never deleted.
* Ubuntu 24.04+ and Debian 13+ replace the old platform baseline because UniFi OS
  Server requires a newer native Podman runtime.
* Supply an explicit HTTPS installer URL and SHA-256 checksum for the target CPU.

The resource is for installation on clean hosts. It refuses recognised legacy
controller state. Backups, data migration, controller cutover, upgrades and
uninstallation are not managed by this cookbook. Cookbook convergence must not
be used to perform those operations.
