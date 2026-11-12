# frozen_string_literal: true

control 'unifi-os-server-runtime' do
  title 'UniFi OS Server runs as a host systemd service'

  describe systemd_service('uosserver') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/var/lib/uosserver/server.conf') do
    it { should exist }
  end

  describe user('uosserver') do
    it { should exist }
  end

  describe port(11443) do
    it { should be_listening }
  end

  describe command('curl --insecure --silent --output /dev/null --write-out "%{http_code}" https://127.0.0.1:11443') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\A(?:200|302)\z/) }
  end

  describe package('unifi') do
    it { should_not be_installed }
  end
end
