# Vex architecture boundaries

## Mission

Vex is an independent browser product built as a shallow, maintainable fork of
Brave, which in turn customizes Chromium. Vex should create a distinct product
experience without becoming a deeply divergent browser engine fork.

The architectural objective is:

```text
Chromium
  + Brave-maintained browser, privacy, security, build, and platform layers
  + a small, explicit, isolated Vex product delta
```

The Vex delta must remain small enough that upstream security and maintenance
updates can take precedence over feature work.

## Repository responsibilities

- `VexBrowser/vex-core` is the technical source of truth for browser code,
  patches, build integration, tests, and engineering documentation.
- `VexBrowser/vex-browser` is the public source of truth for roadmap, issues,
  discussions, releases, and user-facing project documentation.
- `VexBrowser/.github` contains organization-wide community defaults.
- `VexBrowser/vex-brand` is the private source of truth for proprietary Vex
  brand source assets.
- Future service and infrastructure repositories must not be created until the
  corresponding roadmap phase begins.

Do not move product code into `vex-browser` or private brand source material into
`vex-core`.

## Architecture priorities

When priorities compete, use this order:

1. browser security and timely upstream updates;
2. correctness and preservation of user data;
3. privacy and clear network behavior;
4. maintainable upstream integration;
5. accessibility and platform conventions;
6. product behavior and visual polish;
7. local implementation convenience.

A schedule or visual preference must not override security, data integrity, or
upstream maintainability.

## Ownership boundaries

### Upstream-owned behavior

Brave and Chromium remain the preferred owners of:

- browser engine behavior;
- web-platform implementation;
- sandboxing and process isolation;
- networking and certificate handling;
- profile, storage, password, and permission foundations;
- extension compatibility;
- security updates;
- platform build toolchains;
- broadly useful browser infrastructure.

Vex should reuse these areas and modify them only through narrow, justified
integration points.

### Vex-owned behavior

Vex is expected to own:

- product identity and approved build-ready brand exports;
- selection and configuration of product defaults;
- removal or disabling of product surfaces that are outside the Vex product;
- Vex-specific tabs, folders, sidebar, Split View, and Quick View experience;
- Vex release presentation and documentation;
- configuration for future Vex-owned service endpoints;
- focused tests and documentation for the Vex delta.

Vex ownership does not justify copying an entire upstream subsystem. Prefer a
small Vex component attached through a narrow hook.

## State and data model rules

Avoid parallel sources of truth. Vex features should reuse existing Brave or
Chromium state for tabs, groups, sessions, profiles, preferences, permissions,
and Sync whenever that state can represent the required behavior safely.

A new Vex state model must define:

- why existing state is insufficient;
- serialization and migration behavior;
- session restore behavior;
- multi-window and multi-profile behavior;
- crash and invalid-state recovery;
- privacy and retention implications;
- future Sync implications even when Sync is not yet implemented;
- rollback behavior.

Tab folders and nested hierarchy must not silently create a second independent
tab tree that can drift from the browser's real tab model.

## Engine and security boundaries

Changes to Blink, V8, networking, storage, sandboxing, site isolation, process
models, cryptography, credential handling, or permission enforcement are not
normal Vex product work.

Such a change requires:

- a tracking issue;
- an architecture decision record;
- comparison with lower-friction alternatives;
- explicit human approval;
- a security and privacy analysis;
- a focused validation plan;
- a rollback path;
- an upstream contribution assessment.

Quick View and Split View must be implemented using supported browser and
`WebContents` foundations without weakening site isolation or permission
boundaries.

## Feature lifecycle

Each major feature follows this lifecycle:

```text
Issue and acceptance criteria
  -> upstream investigation
  -> technical plan or ADR when structural
  -> smallest useful implementation
  -> feature flag when appropriate
  -> Ubuntu build and validation
  -> focused PR
  -> merge
  -> verification after a relevant Brave sync
```

Only one major structural feature should be active at a time. Documentation,
tests, maintenance, and urgent upstream work may proceed in parallel.

## Debloating rules

The default strategy is to hide or disable unwanted Brave product components
before deleting large bodies of inherited code. This normally produces a
smaller delta and preserves upstream compatibility.

A debloating change is complete only after reviewing:

- visible UI;
- service initialization;
- background work and scheduled tasks;
- network endpoints and requests;
- local storage and profile state;
- build-time inclusion;
- tests and update behavior.

Do not claim that a component is disabled merely because its UI is absent.

## Feature flags and rollback

Structural or high-risk features should start behind a feature flag where
practical. Flags must have a documented default and removal plan.

Every Vex feature must be independently removable or disableable without
restoring broad deleted upstream code. A feature that cannot be rolled back
cleanly requires an ADR before merge.

## Network and service policy

Vex must not depend on Brave-operated production services unless an explicit,
documented decision allows a specific inherited service during development.
Long-term Vex services must use Vex-controlled endpoints and infrastructure.

New network behavior requires documentation of:

- endpoint ownership;
- request purpose and trigger;
- data and metadata sent;
- authentication and identifiers;
- retention and logging;
- failure and offline behavior;
- user control;
- abuse and incident response;
- removal or migration strategy.

No new telemetry, analytics, or remote processing is enabled by default without
explicit human approval.

## Sync boundary

Future Vex Sync should preserve the open-source Brave client and protocol as
closely as possible while directing the client to Vex-controlled infrastructure.
Do not redesign client-side encryption or password handling without a dedicated
security review and ADR.

Client configuration belongs in `vex-core`. Server implementation and
infrastructure belong in future dedicated repositories when that roadmap phase
begins.

## Platform policy

Linux is the first development target, with Ubuntu as the initial reference
environment. A platform is not supported merely because upstream contains a
build target for it.

Adding a supported platform requires:

- a reproducible build;
- an identified maintainer or maintenance process;
- packaging and update capability;
- signing and credential ownership;
- platform-specific validation;
- an ongoing upstream-update commitment.

## Licensing and brand boundary

Vex-specific source code is intended to remain under MPL-2.0 except where a file
or third-party component states otherwise. Inherited and third-party materials
retain their respective licenses and notices.

The Vex name, logo, icons, wordmarks, and visual identity are proprietary. Brand
source files remain private. Only approved build-ready exports should enter the
public source tree, with their separate terms clearly identified.

Vex is independent and must not imply affiliation with Brave Software or Google.

## Architecture exceptions

Exceptions to these boundaries are possible only through an accepted ADR. The
ADR must explain why the user value cannot be delivered through a higher-level,
lower-friction approach and must state the recurring upstream cost the project
is agreeing to carry.

Silence, implementation difficulty, or an agent's preference is not an accepted
architecture decision.
