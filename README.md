# Vex Core

Vex Core is the main technical repository for **Vex**, an independent browser
built as a shallow, disciplined fork of
[`brave/brave-core`](https://github.com/brave/brave-core) and Chromium.

> **Status:** Pre-alpha development. There are no official supported builds or
> release channels yet.

Linux is the first development target, with Ubuntu as the initial reference
environment.

## Engineering direction

Vex keeps a small, explicit, and maintainable product delta over a continuously
updated Brave upstream. Timely upstream security fixes and improvements take
priority over local implementation convenience.

The core rules are:

- reuse Brave and Chromium behavior before creating parallel systems;
- prefer configuration, preferences, feature flags, and Vex-owned files;
- modify inherited files only through narrow integration points;
- use Chromium patches only when a sustainable `brave-core` implementation is
  not available;
- avoid broad refactors, renames, formatting churn, and unrelated changes;
- develop and stabilize one major structural feature at a time;
- keep upstream synchronization separate from Vex product work;
- document every long-lived divergence and recurring conflict;
- require explicit review for deep engine, security, privacy, data, or network
  changes.

Automated agents and contributors must start with [`AGENTS.md`](AGENTS.md) and
the Vex engineering documentation under [`docs/vex/`](docs/vex/README.md).

## Repository responsibilities

- **This repository (`vex-core`)** — browser source, patches, build integration,
  tests, and technical engineering rules.
- [`VexBrowser/vex-browser`](https://github.com/VexBrowser/vex-browser) — public
  roadmap, issues, discussions, releases, and user-facing project documentation.
- `VexBrowser/vex-brand` — private source of truth for proprietary brand source
  assets.

## Roadmap and current work

The complete incremental roadmap is maintained in
[`VexBrowser/vex-browser/ROADMAP.md`](https://github.com/VexBrowser/vex-browser/blob/main/ROADMAP.md).

The current foundation milestone must prove that the untouched fork can be
initialized, built, launched, documented, and synchronized with upstream on
Ubuntu before Vex product features are introduced.

## Building

Vex currently inherits the Brave Core build system. Until Vex-specific setup
documentation has been validated, use the current upstream Brave documentation
as the technical reference:

- [Brave Core README and build overview](https://github.com/brave/brave-core/blob/master/README.md)
- [Brave Core documentation index](https://github.com/brave/brave-core/blob/master/docs/README.md)

A normal checkout should use the Vex repository as `origin` and
`brave/brave-core` as `upstream`. Follow
[`docs/vex/UPSTREAM.md`](docs/vex/UPSTREAM.md) rather than rebasing or replacing
the published Vex `master` branch.

Do not claim that a local build is an official Vex release.

## Contributing

Contributions are welcome. Begin with a focused issue in
[`VexBrowser/vex-browser`](https://github.com/VexBrowser/vex-browser/issues),
then follow [`docs/vex/CONTRIBUTING.md`](docs/vex/CONTRIBUTING.md) and the pull
request template.

Suspected vulnerabilities must not be reported publicly. Follow
[`SECURITY.md`](SECURITY.md).

## License, attribution, and trademarks

Except where another license is explicitly stated, Vex-specific source code and
documentation are intended to remain under the Mozilla Public License 2.0.
Inherited Brave, Chromium, and third-party materials remain under their
respective licenses and notices.

The Vex name, logo, icons, wordmarks, and visual identity are proprietary and
are not licensed under MPL-2.0. See [`NOTICE`](NOTICE) and
[`TRADEMARKS.md`](TRADEMARKS.md).

Vex is not affiliated with, endorsed by, or sponsored by Brave Software, Inc.,
Google LLC, or the Chromium project.

Maintained by **The Vex Team**.
