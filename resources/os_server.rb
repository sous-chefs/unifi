# frozen_string_literal: true

provides :unifi_os_server
unified_mode true

description 'Installs UniFi OS Server on a clean Linux host; does not migrate existing controllers.'

property :installer_url, String, required: true,
                                 callbacks: { 'must be an HTTPS URL' => proc { |value| value.start_with?('https://') } }
property :installer_checksum, String, required: true,
                                      callbacks: { 'must be a SHA-256 checksum' => proc { |value| value.match?(/\A[0-9a-fA-F]{64}\z/) } }

action :install do
  unless (platform?('ubuntu') && Gem::Version.new(node['platform_version']) >= Gem::Version.new('24.04')) ||
         (platform?('debian') && Gem::Version.new(node['platform_version']) >= Gem::Version.new('13'))
    raise Chef::Exceptions::ValidationFailed, 'UniFi OS Server requires Ubuntu 24.04+ or Debian 13+'
  end

  unless %w(x86_64 aarch64).include?(node['kernel']['machine'])
    raise Chef::Exceptions::ValidationFailed, 'UniFi OS Server requires x86-64 or ARM64'
  end

  legacy_paths = %w(/usr/lib/unifi /var/lib/unifi /etc/unifi /etc/default/unifi /etc/init.d/unifi /lib/systemd/system/unifi.service /etc/systemd/system/unifi.service /var/lib/dpkg/info/unifi.list)
  if legacy_paths.any? { |path| ::File.exist?(path) || ::File.symlink?(path) }
    raise Chef::Exceptions::ValidationFailed, 'Existing UniFi Network Server state found; this resource installs UniFi OS Server only and does not migrate or remove data'
  end

  apt_update 'unifi-os-server' do
    action :periodic
  end

  package %w(podman passt slirp4netns uidmap dbus-user-session)

  installer = ::File.join(Chef::Config[:file_cache_path], "unifi-os-server-#{new_resource.installer_checksum.downcase}")
  remote_file installer do
    source new_resource.installer_url
    checksum new_resource.installer_checksum
    owner 'root'
    group 'root'
    mode '0700'
    not_if { ::File.exist?('/var/lib/uosserver/server.conf') }
  end

  execute 'install UniFi OS Server' do
    command [installer, '--non-interactive', '--network-mode', 'pasta']
    timeout 1800
    not_if { ::File.exist?('/var/lib/uosserver/server.conf') }
  end

  systemd_unit 'uosserver.service' do
    action [:enable, :start]
  end
end
