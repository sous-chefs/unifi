# UniFi cookbook

## Owner decision

* Full custom resource migration, confirmed 12 November 2026.
* Manage installation of the new UniFi OS Server product only. Backups, data
  migration and controller cutover are outside this cookbook's scope.
* Never remove or migrate an existing controller's data. Reject legacy Network
  Server installations before invoking the vendor installer.
* Retain the existing generated release PR until a reviewed `feat!` change has
  merged and release-please generates cookbook 3.0.0.

## Vendor requirements

The [official self-hosting guide](https://help.ui.com/hc/en-us/articles/34210126298775-Self-Hosting-UniFi)
replaces the legacy Network Server with UniFi OS Server. Supported Linux hosts
include Ubuntu 24.04+ and Debian 13+, with systemd, libc 2.31+, Podman 4.9.3+
using pasta, and slirp4netns 1.2+. Supported CPUs are x86-64 and ARM64; minimum
memory is 2 GB. Actual disk requirements are checked by the vendor installer.

The Ubuntu and Debian platform families remain supported. Older releases do not
have the required native Podman baseline; Ubuntu 20.04 ESM does not solve that
product dependency constraint. Do not add third-party Podman repositories merely
to keep an obsolete controller platform in the CI matrix.

The vendor distributes architecture-specific executable installers, not the old
`unifi` APT package. The resource requires an explicit HTTPS installer URL and
SHA-256 checksum. It does not manage Java, MongoDB, the legacy APT repository,
backups, application configuration, upgrades or data migration.

## Installer inspection

Official Linux ARM64 installer 5.1.42 was downloaded from the vendor CDN and its
`--help` and `--version` were run in an isolated, read-only, networkless container.
It supports `--non-interactive`, `--network-mode` and `--web-port`. No documented
migration toggle exists, so installation must reject legacy controller state.
Do not invoke `--force-install`, `--uninstall` or the purge executable.

## Runtime and verification

The vendor explicitly does not support standalone Docker/Podman deployment:
host services are required. Full integration needs a disposable systemd VM;
Dokken is unsuitable for acceptance. CI uses the native Ubuntu 24.04 runner and
the Kitchen exec driver. Debian 13 remains a supported local VM platform.

Tests use disposable clean hosts and synthetic state only. Never point the test
suite at a host with an existing controller or actual device data. Do not use
the installer to inspect flags on the workstation itself.

## Evidence

On a new isolated Ubuntu 24.04 ARM64 VM, Kitchen installed the actual official
5.1.42 product, started its systemd service and passed all nine InSpec checks,
including the HTTPS endpoint. The second converge updated zero of seven
resources. No actual devices were adopted. Prerequisites had been installed in
that VM during installer investigation; CI must also exercise a clean runner.

The install-state marker `/var/lib/uosserver/server.conf`, `uosserver` account,
`uosserver.service` and HTTPS port 11443 were verified against this real runtime.

A separate clean Debian 13 ARM64 VM passed the same Kitchen profile: first
converge updated seven of eleven resources (including runtime prerequisites),
second converge updated zero of seven, and all nine checks passed. Both VMs
used Cinc Workstation 26.4.0 packages verified against official SHA-256 metadata.

The existing conventional-commit caller omitted the `pull-requests: read`
permission required by the pinned reusable workflow. Add that caller permission;
do not weaken the title check or change the reusable workflow's token trust.
