# Brave upstream synchronization policy

## Purpose

Vex depends on frequent Brave and Chromium updates for security fixes, platform
compatibility, web-platform behavior, and browser improvements. Upstream
synchronization is therefore core product work, not optional repository
maintenance.

The goal is to preserve upstream history and reapply a small, explicit Vex delta
on top of it.

## Canonical remotes

A normal local checkout should use:

```text
origin    git@github.com:VexBrowser/vex-core.git
upstream  https://github.com/brave/brave-core.git
```

Verify remotes before syncing:

```bash
git remote -v
git fetch --all --prune
```

Do not repoint `upstream` to a personal fork or an unreviewed mirror.

## Branch model

```text
upstream/master               Brave source of truth
origin/master                 integrated Brave + reviewed Vex delta
sync/brave-<version-or-date>  one upstream synchronization
feature/<name>                one Vex feature
fix/<name>                    one focused Vex fix
docs/<name>                   documentation-only work
```

`master` remains the Vex integration branch because the inherited Brave branch
uses that name. Do not rename it merely for stylistic consistency with other Vex
repositories.

## Invariants

- Preserve upstream commit ancestry.
- Never force-push `master`.
- Never combine an upstream sync with a product feature.
- Never use a sync PR to perform opportunistic refactors.
- Do not squash away upstream ancestry when merging a sync PR.
- Keep conflict-resolution changes limited to restoring the existing Vex delta
  on the new upstream structure.
- Prefer upstream's new implementation when it makes an older Vex customization
  unnecessary.
- Record recurring conflicts and reduce their cause.

## Standard synchronization workflow

### 1. Start from a clean, current Vex branch

```bash
git fetch origin
git fetch upstream
git checkout master
git pull --ff-only origin master
git checkout -b sync/brave-<version-or-date>
```

Do not begin from a feature branch or a worktree with unrelated changes.

### 2. Merge Brave upstream

```bash
git merge --no-ff upstream/master
```

The merge may be conflict-free. A conflict-free merge still requires build and
validation because generated files, patch application, APIs, runtime behavior,
and dependencies may have changed.

Do not rebase the published Vex `master` onto Brave. Rebasing rewrites the Vex
integration history and makes shared maintenance harder.

### 3. Resolve conflicts with an upstream-first rule

For each conflict:

1. understand the upstream change before editing;
2. preserve Brave's new structure and behavior when compatible with Vex goals;
3. reapply the smallest Vex-specific delta;
4. remove obsolete Vex code when upstream now provides an acceptable solution;
5. avoid restoring old upstream code merely because it reduces immediate work;
6. record the patchset and reason when the conflict is likely to recur.

Do not resolve conflicts mechanically by choosing all of `ours` or all of
`theirs` across a directory.

### 4. Refresh repository state through inherited tooling

Follow the current Brave documentation for synchronization, dependency updates,
patch application, generated files, and hooks. Do not hard-code old commands in
a way that overrides newer upstream guidance.

At minimum, record:

- the previous Vex commit;
- the upstream commit merged;
- Brave and Chromium versions after sync;
- dependency or toolchain changes;
- Chromium patches that required refresh;
- generated-file changes;
- every manually resolved conflict.

### 5. Validate before opening the PR

Use `VALIDATION.md`. A normal sync requires, at minimum:

- successful repository initialization or sync on the Ubuntu reference
  environment;
- successful relevant presubmit and GN checks;
- a desktop build;
- successful browser launch;
- focused regression checks for every active Vex patchset;
- confirmation that proprietary brand boundaries and attribution remain intact;
- review of new or changed upstream network behavior where relevant.

Do not report a sync as complete when only Git conflicts have been resolved.

### 6. Open a dedicated sync pull request

The PR title should identify the Brave version or upstream range. The body must
include:

- previous and new upstream commits;
- version changes;
- conflict list;
- Vex customizations removed, simplified, or rewritten;
- patchsets affected;
- tests and build evidence;
- untested platforms;
- known regressions or follow-up issues.

Merge the sync PR with a merge commit. Do not squash it.

## Feature branches during a sync

Avoid long-lived feature branches. When a sync lands while a feature is still
open:

1. update the feature branch from the new Vex `master`;
2. resolve conflicts in the feature branch, not in the sync PR;
3. repeat relevant validation;
4. update the PR's upstream-impact section.

If the feature becomes substantially harder to carry after the sync, reconsider
its design instead of accumulating compatibility layers.

## Emergency security changes

A targeted upstream security fix may occasionally need to land before a full
sync. Such a cherry-pick must:

- reference the upstream commit and advisory when disclosure permits;
- remain isolated from unrelated Vex changes;
- receive the same validation appropriate to its risk;
- be reconciled during the next full sync to avoid duplicate history or code;
- never be used as a substitute for maintaining regular upstream cadence.

## Recurring conflict policy

A conflict is a warning about architectural friction. After the same Vex area
requires repeated manual resolution, open a maintenance issue and consider:

- moving behavior into Vex-owned files;
- using a narrower integration hook;
- adopting an upstream implementation;
- contributing a reusable hook upstream;
- reducing or removing the customization;
- replacing a deep patch with configuration or a feature flag.

Update `PATCHSETS.md` with the conflict history and chosen mitigation.

## Upstream lag and feature freezes

Security and maintenance updates take precedence over feature development.
Feature work should pause when the fork is materially behind a security-relevant
Brave or Chromium release, when sync is blocked by an unresolved Vex change, or
when the current Vex baseline no longer builds reproducibly.

The project must not publish a release based on a knowingly stale or unvalidated
security baseline merely to preserve a feature schedule.

## Baselines and tags

Create a baseline tag only after the corresponding commit has been built,
launched, documented, and independently reviewed. Tags must identify what was
validated; they must not imply public support or production readiness.

Do not move or recreate published baseline or release tags.
