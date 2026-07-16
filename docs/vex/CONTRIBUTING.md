# Contributing to Vex Core

Vex welcomes focused issues, documentation, tests, fixes, and feature
contributions. The project is pre-alpha, so interfaces and priorities may change
while the technical foundation is established.

This document is the Vex-specific contribution addendum. Inherited Brave and
Chromium documentation remains applicable for code style, build tooling, tests,
and subsystem-specific practices, but Brave issue trackers, support channels,
release processes, and organizational permissions do not represent Vex.

## Before contributing

1. Read the public roadmap in
   [`VexBrowser/vex-browser`](https://github.com/VexBrowser/vex-browser/blob/main/ROADMAP.md).
2. Search existing Vex issues and discussions.
3. Open or identify a focused tracking issue in
   [`VexBrowser/vex-browser`](https://github.com/VexBrowser/vex-browser/issues).
4. Read `AGENTS.md` and the applicable files under `docs/vex/`.
5. For code work, establish a clean Ubuntu build of the current Vex baseline.
6. Investigate existing Brave and Chromium foundations before proposing a new
   subsystem.

Accepted product direction does not imply a release date or immediate
implementation priority.

## Scope discipline

- Address one coherent concern per pull request.
- Do not combine an upstream sync with a feature or fix.
- Do not combine branding, debloating, defaults, tabs, views, Sync, packaging,
  or unrelated refactors.
- Avoid broad renames, formatting churn, dependency updates, and generated-file
  changes outside the issue scope.
- Keep pull requests small enough to review, build, test, revert, and adapt to
  upstream changes independently.
- Only one major structural feature should be developed at a time.

When you discover unrelated work, open or reference a separate issue.

## Upstream-first design

Vex is a shallow fork. Follow the implementation preference order in
`AGENT_RULES.md`:

1. reuse existing behavior;
2. use configuration, preferences, or feature flags;
3. add isolated Vex-owned code;
4. make narrow Brave integration changes;
5. use Chromium patches only when necessary;
6. treat deep engine modifications as explicit architecture exceptions.

A proposal should explain why lower-friction alternatives are insufficient and
what recurring upstream cost it introduces.

## Branches

Use descriptive branches:

```text
feature/<short-name>
fix/<short-name>
docs/<short-name>
sync/brave-<version-or-date>
```

Do not work directly on protected `master`. Do not force-push shared or
protected branches.

## Commits

- Use logical commits with clear messages.
- Do not hide unrelated changes in generated output.
- Preserve upstream authorship and ancestry during Brave synchronization.
- Do not squash upstream sync history.
- Feature PR history may be cleaned according to the selected merge strategy,
  but review evidence must remain in the PR.

## Tests and evidence

Follow `VALIDATION.md`. Code contributions normally require:

- relevant automated tests;
- applicable presubmit and GN checks;
- a successful Ubuntu build;
- successful browser launch for runtime changes;
- manual evidence for visible behavior;
- honest reporting of anything not run;
- privacy and network review when services or endpoints are affected;
- state and restore testing when tabs, windows, profiles, or sessions are
  affected.

Do not change or disable tests simply to make a regression pass.

## Pull requests

Use the repository pull-request template. A complete PR must:

- link its Vex tracking issue;
- identify the Brave or Chromium foundation reused;
- list Vex-owned and inherited files changed;
- list Chromium patch files and targets changed;
- explain expected upstream conflicts;
- update `PATCHSETS.md` for long-lived divergence;
- link an accepted ADR when required;
- provide actual validation evidence;
- describe rollback;
- address privacy, security, accessibility, licensing, attribution, and brand
  impact.

A feature is not considered sustainably complete until it is checked against a
relevant upstream update.

## AI-assisted contributions

AI tools may help investigate, plan, implement, or review work. The submitting
human remains responsible for understanding the change and ensuring that all
claims about tests, builds, security, licensing, and behavior are accurate.

An agent must not:

- approve its own architecture exception;
- claim tests or builds it did not run;
- grant trademark permission;
- add secrets or private brand sources;
- bypass review controls;
- choose implementation convenience over documented upstream constraints.

Disclose meaningful AI assistance when it materially shaped the implementation
or investigation.

## Security reports

Do not disclose suspected vulnerabilities in a public issue, discussion, or PR.
Follow the private reporting process in `SECURITY.md`.

## Licensing and brand

By contributing, you must have the right to submit the material under its
applicable license. Preserve inherited and third-party notices.

Vex-specific source code is intended to remain under MPL-2.0 unless explicitly
stated otherwise. The Vex name, logos, icons, wordmarks, and visual identity are
proprietary; open-source contribution rights do not include trademark rights.
See `NOTICE` and `TRADEMARKS.md`.

## Conduct

Organization-wide contribution and conduct policies from
`VexBrowser/.github` apply where this repository does not define a more specific
rule.
