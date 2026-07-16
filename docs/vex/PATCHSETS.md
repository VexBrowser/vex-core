# Vex patchset registry

## Purpose

This file is the source of truth for long-lived Vex divergence from
`brave/brave-core` and Chromium.

A *patchset* is a coherent Vex-specific delta. It may consist of Vex-owned files,
preferences, feature flags, focused changes to Brave-owned files, Chromium patch
files, generated output, or a combination of these. It does not necessarily
mean a single `.patch` file.

The registry exists to make every enduring customization discoverable,
reviewable, testable, removable, and maintainable during upstream sync.

## Rules

- Every structural or long-lived Vex customization must have one registry entry.
- A small one-off documentation fix does not need a patchset entry.
- Each patchset must have one clear purpose and rollback path.
- Patchsets must not become catch-all buckets for unrelated work.
- New Chromium patches require a patchset entry before merge.
- Recurring conflicts must be recorded rather than rediscovered during each
  sync.
- When upstream provides an acceptable equivalent, prefer retiring the Vex
  patchset.
- A feature is not sustainably complete until its patchset has been checked
  against a relevant upstream update or scheduled for that check.

## Status values

- **Foundation** — governance or tooling required to maintain the fork.
- **Planned** — accepted direction, no implementation merged.
- **Experimental** — implemented behind a flag or otherwise not default.
- **Active** — enabled and supported on the current reference platform.
- **Maintenance** — feature-complete; receives fixes and upstream adaptation.
- **Retiring** — being removed or replaced by upstream.
- **Retired** — no longer carried; history remains documented.

## Registry

| ID | Domain | Status | Primary upstream foundation | Expected Vex ownership | Chromium patch expected? | Required validation |
| --- | --- | --- | --- | --- | --- | --- |
| VEX-000 | Fork governance and upstream sync | Foundation | Brave repository and build workflow | `AGENTS.md`, `docs/vex/`, focused repository metadata | No | Documentation review and one real sync cycle |
| VEX-100 | Minimal Vex branding | Planned | Brave branding and build configuration | Approved Vex assets plus narrow integration points | Avoid | Ubuntu build, launch, packaging identifiers, attribution |
| VEX-200 | Product debloating | Planned | Existing Brave feature flags, prefs, services, and build flags | Small per-component changes | Avoid | UI, service, storage, scheduled-work, and network audit |
| VEX-300 | Vex defaults and start experience | Planned | Brave/Chromium preferences and new-tab foundations | Preferences and isolated Vex UI where required | Avoid | Fresh-profile behavior, Shields, extensions, network review |
| VEX-400 | Vertical and horizontal tabs | Planned | Brave vertical tabs and sidebar foundations | Narrow UI integration and Vex-owned presentation logic | Possible | Ubuntu build, accessibility, multi-window, session restore |
| VEX-500 | Pinned tab area | Planned | Brave/Chromium pinned-tab state | Isolated sidebar presentation and interaction logic | Possible | State restore, drag and drop, audio/loading/discard states |
| VEX-600 | One-level tab folders | Planned | Brave/Chromium tab groups and tree-tab foundations | Vex-owned model only where upstream state is insufficient | Possible | Restore, multiple windows, moves, accessibility, sync impact |
| VEX-700 | Nested folder evaluation | Planned | To be determined by technical spike | Must remain optional and reversible | Likely | ADR, prototype, restore, accessibility, maintenance estimate |
| VEX-800 | Split View | Planned | Existing Brave split-view foundation | Small Vex UX delta | Possible | Focus, permissions, downloads, fullscreen, DevTools, restore |
| VEX-900 | Quick View | Planned | WebContents and existing Brave browser UI primitives | Isolated Vex component with narrow browser integration | Possible | Security, site isolation, storage, permissions, accessibility |
| VEX-1000 | Linux packaging and updates | Planned | Brave/Chromium packaging and updater foundations | Vex configuration, metadata, release tooling | Possible | Install, update, rollback, signing, notices, checksums |
| VEX-1100 | Vex Sync client configuration | Planned | Brave Sync client and protocol | Endpoint/configuration delta only where possible | Avoid | Encryption invariants, compatibility, network and recovery |
| VEX-1200 | Android product delta | Planned | Brave Android implementation | Mobile-specific isolated Vex changes | Possible | Build, permissions, privacy, Sync, signing, distribution |

The table records direction, not permission to begin multiple patchsets in
parallel. Follow the public roadmap and the one-major-feature rule.

## Required patchset record

When implementation begins, add a detailed section using this structure:

```markdown
## VEX-NNN — Short name

**Status:** Experimental | Active | Maintenance | Retiring | Retired
**Tracking issue:** https://github.com/VexBrowser/vex-browser/issues/...
**Feature flag:** name or `none` with justification
**First Vex commit:** SHA or `not merged`
**Last upstream verification:** Brave version/commit or `pending`

### User purpose

What user or maintenance problem does this patchset solve?

### Upstream foundation reused

Which Brave or Chromium behavior, component, preference, API, experiment, or
patch is reused?

### Lower-friction alternatives considered

Why were configuration, an existing feature flag, Vex-owned files, or a smaller
integration hook insufficient?

### Vex-owned paths

- `path/...`

### Inherited Brave-owned paths modified

- `path/...` — narrow reason for modification

### Chromium patch files and upstream targets

- patch path — upstream file/symbol touched — reason

### Generated files

- path — generation command

### Privacy, security, accessibility, and licensing impact

Describe data, network, permissions, process boundaries, accessibility, notices,
and brand implications.

### Validation contract

List the minimum tests and manual checks required for feature PRs and upstream
syncs.

### Rollback

How can the patchset be disabled or removed without reconstructing deleted
upstream code?

### Known upstream friction

List fragile integration points and likely conflict areas.

### Conflict history

| Upstream version or commit | Conflict area | Resolution | Follow-up |
| --- | --- | --- | --- |

### Upstream contribution opportunity

Could a generic hook, fix, or feature be contributed to Brave or Chromium to
reduce the Vex delta?
```

## Friction warning signs

A patchset requires redesign discussion when it shows one or more of these
patterns:

- repeated conflicts in the same inherited files;
- broad edits across unrelated upstream directories;
- copied upstream subsystems under Vex names;
- large deletion of inherited code that must be restored during sync;
- multiple overlapping representations of tab, profile, session, or preference
  state;
- deep changes to Blink, V8, networking, storage, sandboxing, or process models;
- inability to disable or revert the feature independently;
- tests that depend on private implementation details rather than behavior;
- generated files that cannot be reproduced by documented commands;
- a feature branch that remains open across multiple upstream cycles;
- an implementation that prevents timely security updates.

When these signs appear, create or update an ADR and consider moving behavior
into Vex-owned files, narrowing the integration hook, adopting upstream's
implementation, contributing a hook upstream, or retiring the customization.

## Conflict log requirements

Every sync PR must review the registry. When a patchset conflicts, update its
record with:

- the upstream version or commit;
- affected paths or symbols;
- whether the conflict was textual, generated, API-level, or behavioral;
- the chosen resolution;
- whether the Vex delta grew, shrank, or stayed stable;
- a follow-up issue when recurring friction should be reduced.

A conflict resolved only in Git history but not recorded here is unfinished
maintenance work.

## Retiring a patchset

Before marking a patchset **Retired**:

1. confirm why the behavior is no longer needed or which upstream feature
   replaces it;
2. remove its Vex-owned implementation and inherited integration edits;
3. remove or refresh associated Chromium patches and generated output;
4. remove flags, prefs, strings, metrics, tests, and documentation that no
   longer apply;
5. validate profiles, migrations, and rollback where relevant;
6. preserve a concise historical record in this file;
7. verify the next upstream sync no longer depends on the retired delta.
