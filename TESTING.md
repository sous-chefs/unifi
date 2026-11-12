# Testing

Run local unit and style checks with Cinc/Chef Workstation:

```sh
chef install Policyfile.rb
chef exec cookstyle
chef exec rspec
```

The default Kitchen suite installs the actual vendor product, checks its host
service and HTTPS endpoint, and runs a second converge with idempotency enforced.
Its fixtures pin version 5.1.42 and SHA-256 digests for x86-64 and ARM64.

## Disposable VM integration

Use a clean Ubuntu 24.04+ or Debian 13+ systemd VM with at least 4 GB RAM and
35 GB disk. The VM must have no actual controller data or adopted devices.

`kitchen.yml` supports Vagrant VM testing. On an already disposable supported
VM with Workstation installed, run the exec driver:

```sh
KITCHEN_LOCAL_YAML=kitchen.exec.yml chef exec kitchen test default-ubuntu-2404
```

Use `default-debian-13` on a Debian 13 VM. Never run the exec driver on the
workstation or a production controller. CI uses an isolated Ubuntu 24.04 runner;
Debian requires a local VM. Exec cannot emulate another operating system.

Dokken is deliberately removed: the vendor requires host services and does not
support standalone container installation. There are no backup, migration,
cutover or purge tests because those operations are outside cookbook scope.
