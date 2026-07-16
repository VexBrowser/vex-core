# Mandatory Vex agent rules

## Scope and precedence

These rules apply to the entire `VexBrowser/vex-core` repository and to every
automated agent, script, or contributor acting on it.

Read and preserve the inherited Brave instructions in `.claude/CLAUDE.md`.
These Vex rules add project-specific constraints; they do not waive upstream
safety, build, style, or testing requirements.

When two instructions appear incompatible, stop, describe the conflict in the
tracking issue or pull request, and request a project decision. Do not silently
choose the instruction that makes implementation easier.

## Primary engineering objective

Vex is a shallow, disciplined fork of `brave/brave-core`.

Every Vex-specific behavior must remain a minimal, isolated, auditable, and
reversible delta over a continuously updated Brave upstream. The ability to
integrate upstream security fixes and improvements frequently is a permanent
product requirement.

A solution is not acceptable merely because it works locally. It must also be
reasonable to maintain across future Brave and Chromium updates.

## Meaning of "patch"

In Vex documentation, a *patch* normally means the complete Vex delta from
upstream. It does not mean that every change must be stored in a `.patch` file.

Use Chromium patch files only when the required behavior cannot be implemented
sustainably inside `brave-core`. New Vex-owned files, configuration, feature
flags, and small integration hooks are usually lower-friction choices.

## Required implementation preference order

Consider solutions in this order and document why lower-friction options were
insufficient before moving down the list:

1. Reuse existing Brave or Chromium behavior without modification.
2. Configure an existing preference, policy, feature flag, build flag, or
   extension point.
3. Add isolated Vex-owned code or assets with the smallest possible integration
   surface.
4. Make a focused change to a small number of Brave-owned files.
5. Add or modify a Chromium patch through the repository's established patch
   mechanism.
6. Modify Blink, V8, networking, storage, sandboxing, process isolation, or
   another deep Chromium subsystem only as an explicitly approved exception.

The preferred solution is the highest viable option in this list, not the one
with the fewest lines in the first implementation.

## Required investigation before implementation

Before writing code for a feature or structural fix:

1. Read the linked issue and relevant roadmap milestone.
2. Search Brave for an existing implementation, experiment, preference, feature
   flag, component, or abandoned foundation.
3. Search Chromium for an existing implementation or supported extension point.
4. Identify which inherited files would be modified and which Vex-owned files
   could contain the new behavior.
5. Identify whether the change requires a Chromium patch.
6. Estimate likely recurring conflict areas during upstream sync.
7. Define the smallest independently useful version.
8. Decide whether experimental behavior should start behind a feature flag.
9. Record validation requirements before implementation starts.

Do not create a parallel subsystem without explaining why the existing Brave or
Chromium foundation cannot be reused or extended.

## Change isolation rules

- One pull request must address one coherent concern.
- One major structural feature may be active at a time.
- Upstream synchronization must not be mixed with Vex product work.
- Branding, debloating, defaults, tabs, views, Sync, packaging, and unrelated
  refactors must not be combined in one pull request.
- Avoid repository-wide formatting, broad renames, file moves, namespace churn,
  and aesthetic refactors.
- Do not update dependencies outside the issue's scope.
- Do not remove inherited code solely because its UI is hidden. Prefer disabling
  or isolating it unless removal has a documented maintenance benefit.
- Do not change tests merely to hide a regression.
- Do not disable checks, lint rules, security controls, or warnings to make a
  change pass.
- Keep generated changes separate and reproducible.

A pull request that exposes unrelated problems should open or reference separate
issues rather than expanding its scope.

## Ownership zones

Prefer placing Vex-specific documentation under `docs/vex/` and isolated product
code in clearly named Vex-owned files or components.

Inherited Brave files should be modified only at narrow integration points.
Chromium-owned files outside `src/brave` should normally be changed through the
existing patch system rather than by maintaining an untracked local edit.

Do not duplicate large upstream files under Vex names to avoid small edits. Such
copies silently fork behavior and make security and bug-fix propagation harder.

## Chromium patch rules

When a Chromium patch is necessary:

- keep it focused on one concern;
- use the repository's existing patch-generation and application workflow;
- never hand-edit generated patch output when an official update command exists;
- document the owning Vex patchset in `PATCHSETS.md`;
- record the upstream files and symbols touched;
- explain why a `brave-core` implementation was not sustainable;
- add focused validation steps;
- check whether the change is suitable for contribution upstream;
- record recurring conflicts after each relevant sync.

Changes to Blink, V8, networking, storage, sandboxing, site isolation, process
models, cryptography, or password handling require an architecture decision
record and explicit human approval before implementation.

## Feature flags and reversibility

Experimental or high-risk behavior should start behind an existing or new
feature flag when technically practical. This is especially important for tab
folders, folder hierarchy, Split View, Quick View, Sync changes, and structural
sidebar behavior.

A feature flag is not a substitute for testing. It is a containment and rollback
mechanism.

Every structural change must have a documented rollback path. Reverting the
change should not require reconstructing removed upstream code from history.

## Upstream synchronization rules

- Treat `brave/brave-core` as a live upstream, not a one-time source import.
- Preserve upstream history.
- Never force-push the protected `master` branch.
- Perform sync work on `sync/brave-<version-or-date>` branches.
- Keep sync commits and conflict resolutions separate from product features.
- Do not squash away upstream ancestry in a sync pull request.
- Resolve conflicts by preserving upstream structure first and reapplying the
  smallest Vex delta second.
- Record recurring conflicts in `PATCHSETS.md`.
- Prefer simplifying or deleting a Vex customization when upstream provides an
  acceptable equivalent.
- Pause feature work when the fork is materially behind security-sensitive
  upstream releases.

Follow the complete process in `UPSTREAM.md`.

## Validation and evidence

Do not state that a build, test, or behavior passed unless it was actually run
and the result is available.

For code changes, provide as applicable:

- the Ubuntu version and architecture used;
- exact commands executed;
- relevant logs or concise result summaries;
- the produced binary or build target;
- screenshots or recordings for visible behavior;
- focused test results;
- presubmit and GN check results where applicable;
- network observations for telemetry, endpoint, service, or debloating changes;
- session-restore and multi-window results for tab and view changes;
- comparison with the corresponding Brave behavior;
- known limitations and untested areas.

Use `VALIDATION.md` to determine the minimum evidence for each change class.

## Privacy, security, and network behavior

Do not add any of the following without explicit human approval, documentation,
and appropriate review:

- telemetry or analytics;
- persistent or cross-context identifiers;
- remote content processing;
- new external services or endpoints;
- collection of browsing data;
- background network requests;
- logging of URLs, page content, credentials, tokens, or personal data;
- weakened sandbox, site-isolation, certificate, permission, or encryption
  behavior.

Hiding a UI surface does not prove that a product component is disabled. Audit
background services, scheduled work, local storage, network traffic, and build
inclusion before making privacy claims.

Never commit secrets, private keys, signing certificates, cloud credentials,
profile data, cookies, Sync keys, access tokens, or logs containing sensitive
information.

## Licensing, attribution, and brand boundaries

- Preserve Brave, Chromium, and third-party copyright and license notices.
- Do not relicense inherited files without a verified legal basis.
- Vex-specific source code is intended to remain under MPL-2.0 unless a file
  clearly states another applicable license.
- Third-party code remains under its own license.
- The Vex name, logo, icons, wordmarks, and visual identity are proprietary and
  are not licensed under MPL-2.0.
- Do not copy private brand source files into this public repository.
- Only approved build-ready exports may be added, and their separate branding
  terms must remain clear.
- Do not imply affiliation with Brave Software or Google.

See `TRADEMARKS.md` and `NOTICE`.

## Generated files and dependencies

- Use the established generator or update command for generated files.
- Record the exact generation command in the pull request.
- Do not manually edit generated output to bypass the source of truth.
- Avoid new third-party dependencies when existing upstream functionality is
  sufficient.
- A new dependency requires license, security, maintenance, binary-size, build,
  and upstream-friction analysis.
- Dependency lockfile changes must be scoped and explained.

## Destructive operations and local machine safety

Follow the inherited destructive-operation rules in `.claude/CLAUDE.md`.
Never delete caches, build outputs, profiles, or machine state outside the
repository working tree without explicit human approval after explaining the
cost and consequences.

Do not use destructive Git operations to conceal unexpected changes. Stop and
report an unfamiliar worktree, branch, or generated-file state.

## Architecture exception process

An architecture decision record is required before implementing a change that:

- creates a large parallel subsystem;
- deeply modifies Chromium;
- repeatedly conflicts with upstream;
- changes security or privacy boundaries;
- introduces a new network service or protocol;
- makes a Vex feature impossible to disable or revert cleanly;
- changes the shallow-fork strategy;
- accepts substantial recurring maintenance cost.

Use the template in `docs/vex/adr/0000-template.md`. The record must compare at
least one lower-friction alternative and state the expected upstream cost.

## Pull request completion requirements

A Vex change is ready for review only when the pull request:

- links its tracking issue in `VexBrowser/vex-browser`;
- identifies reused Brave or Chromium foundations;
- lists inherited files and Chromium patches modified;
- explains expected upstream conflict risk;
- updates `PATCHSETS.md` for long-lived divergence;
- links an ADR when required;
- reports validation honestly;
- documents privacy, security, accessibility, licensing, and brand impact;
- contains no unrelated refactor or generated churn;
- states a rollback path.

A feature is not considered sustainably complete until it has survived a
relevant upstream synchronization or has a documented plan to verify that in
the next sync cycle.
