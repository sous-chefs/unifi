# unifi_os_server

Installs UniFi OS Server on a clean Ubuntu 24.04+ or Debian 13+ systemd host.

## Properties

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| `installer_url` | String | Yes | HTTPS URL for the official Linux installer matching the host CPU. |
| `installer_checksum` | String | Yes | SHA-256 digest, 64 hexadecimal characters. |

The resource name is descriptive; UniFi OS Server is a single host installation,
not an independently named instance.

## Example

```ruby
unifi_os_server 'controller' do
  installer_url 'https://fw-download.ubnt.com/data/unifi-os-server/5172-linux-x64-5.1.42-12e9e3cf-8f8b-4e54-928c-76b80a10c8a4.42-x64'
  installer_checksum 'f6111e9396a42c74016f5dde9b01fbef486a6fe69efe137935e6e38b7c22f94d'
end
```

This example installs version 5.1.42 on x86-64.

## Action

`:install` is the default and only action. It checks the platform, architecture
and legacy controller paths before changing the host, installs Podman and its
networking prerequisites, downloads the checksum-verified installer, then invokes
`--non-interactive --network-mode pasta`. The installed host service is enabled
and started.

An existing `/var/lib/uosserver/server.conf` prevents the installer and download
from running again. A different URL or checksum does not trigger an upgrade.
The vendor's resource and port checks remain enabled.

The resource does not manage backups, data migration, application configuration,
upgrades or removal. It does not stop or delete a legacy controller. Recognised
legacy package, service or data files cause an error before installation.
