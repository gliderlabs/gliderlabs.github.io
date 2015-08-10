---
title: Registrator v6
date: 2015-08-10 18:55 UTC
tags: registrator, weave
---
Last Friday we finally cut a [new release](https://github.com/gliderlabs/registrator/releases/tag/v6) of Registrator. At the bottom of this
post are relevant changes, but for most already using Registrator from master there is nothing new. However, with this release there is also a great new [documentation
site](http://gliderlabs.com/registrator).

Our last release turned out to have some critical bugs that caused us to
immediately re-point `gliderlabs/registrator:latest` to our *previous* release.
So for the past six months, if anybody was using `:latest`, they were using a
pretty old version. Most active users have known to use `:master`.

The plan was to fix the issues in v5 and quickly move to v6, but to avoid a
repeat, we made the fixes and decided to wait and let the community verify
stability of master. This went on for too long and for various reasons continued
to slip.

Given the popularity of Registrator and recent sponsorship by
[Weave](http://weave.works/), we finally got to invest some time in Registrator to
make it a more sustainable project. First we had to release current master. We
also put some time into documentation, as well as [documentation
infrastructure](http://gliderlabs.com/pagebuilder) for other projects.

Expect more releases soon as we start heading towards an LTS release.

### Fixed
- Support for etcd v0 and v2
- Panic from invalid skydns2 URI.

### Added
- Optional periodic resyncing of services from containers
- More error logging for registries
- Support for services on containers with `--net=host`
- Added `extensions.go` file for adding/disabling components
- Interpolate `SERVICE_PORT` and `SERVICE_IP` in `SERVICE_X_CHECK_SCRIPT`
- Ability to force IP for a service in Consul
- Implemented initial ping for every service registry
- Option to only deregister containers cleanly shutdown
- Added support for label metadata along with environment variables

### Changed
- Overall refactoring and cleanup
- Decoupled registries into subpackages using extpoints
- Replaced check-http script with Consul's native HTTP checks
