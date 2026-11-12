# frozen_string_literal: true

require 'spec_helper'

describe 'unifi_os_server' do
  step_into :unifi_os_server
  platform 'ubuntu', '24.04'

  let(:checksum) { 'a' * 64 }
  let(:installer) { ::File.join(Chef::Config[:file_cache_path], "unifi-os-server-#{checksum}") }

  recipe do
    unifi_os_server 'controller' do
      installer_url 'https://example.org/installer'
      installer_checksum 'a' * 64
    end
  end

  it { is_expected.to install_package(%w(podman passt slirp4netns uidmap dbus-user-session)) }
  it { is_expected.to periodic_apt_update('unifi-os-server') }
  it { is_expected.to create_remote_file(installer).with(checksum: checksum, mode: '0700') }
  it { is_expected.to run_execute('install UniFi OS Server').with(command: [installer, '--non-interactive', '--network-mode', 'pasta']) }
  it { is_expected.to enable_systemd_unit('uosserver.service') }
  it { is_expected.to start_systemd_unit('uosserver.service') }

  context 'when UniFi OS Server is already installed' do
    before do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/var/lib/uosserver/server.conf').and_return(true)
    end

    it { is_expected.not_to create_remote_file(installer) }
    it { is_expected.not_to run_execute('install UniFi OS Server') }
    it { is_expected.to start_systemd_unit('uosserver.service') }
  end

  %w(/usr/lib/unifi /var/lib/unifi /etc/unifi /etc/default/unifi /etc/init.d/unifi /lib/systemd/system/unifi.service /etc/systemd/system/unifi.service /var/lib/dpkg/info/unifi.list).each do |path|
    context "with legacy controller state at #{path}" do
      before do
        allow(File).to receive(:exist?).and_call_original
        allow(File).to receive(:exist?).with(path).and_return(true)
      end

      it 'refuses installation without touching the legacy controller' do
        expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /does not migrate or remove data/)
      end
    end
  end

  context 'with a dangling legacy data symlink' do
    before do
      allow(File).to receive(:symlink?).and_call_original
      allow(File).to receive(:symlink?).with('/var/lib/unifi').and_return(true)
    end

    it 'refuses to overwrite an unavailable legacy data location' do
      expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /does not migrate or remove data/)
    end
  end

  context 'with an insecure installer URL' do
    recipe do
      unifi_os_server 'controller' do
        installer_url 'http://example.org/installer'
        installer_checksum 'a' * 64
      end
    end

    it 'rejects the installer before fetching it' do
      expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /HTTPS/)
    end
  end

  context 'with an invalid checksum' do
    recipe do
      unifi_os_server 'controller' do
        installer_url 'https://example.org/installer'
        installer_checksum 'not-a-digest'
      end
    end

    it 'requires a complete SHA-256 digest' do
      expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /SHA-256/)
    end
  end

  context 'on Ubuntu 22.04' do
    platform 'ubuntu', '22.04'

    it 'rejects an unsupported native Podman baseline' do
      expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /Ubuntu 24.04/)
    end
  end

  context 'on an unsupported architecture' do
    automatic_attributes['kernel']['machine'] = 'armv7l'

    it 'rejects unsupported CPUs before fetching the installer' do
      expect { chef_run }.to raise_error(Chef::Exceptions::ValidationFailed, /x86-64 or ARM64/)
    end
  end
end
