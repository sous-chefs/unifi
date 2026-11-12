# frozen_string_literal: true

installers = {
  'x86_64' => {
    url: 'https://fw-download.ubnt.com/data/unifi-os-server/5172-linux-x64-5.1.42-12e9e3cf-8f8b-4e54-928c-76b80a10c8a4.42-x64',
    checksum: 'f6111e9396a42c74016f5dde9b01fbef486a6fe69efe137935e6e38b7c22f94d',
  },
  'aarch64' => {
    url: 'https://fw-download.ubnt.com/data/unifi-os-server/f730-linux-arm64-5.1.42-d2bca8bd-d6fc-4d20-99e5-b78235843c2f.42-arm64',
    checksum: '8e29bd50cde8f781ace4b85599256ef62c02723bdc751044d4db90a087fb5207',
  },
}
installer = installers.fetch(node['kernel']['machine'])

unifi_os_server 'controller' do
  installer_url installer.fetch(:url)
  installer_checksum installer.fetch(:checksum)
end
