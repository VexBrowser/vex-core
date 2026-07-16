# Vex engineering documentation

This directory contains the Vex-specific engineering rules that apply on top of
the inherited Brave and Chromium documentation.

Vex is a shallow, disciplined fork of `brave/brave-core`. The ability to bring
in upstream security fixes, bug fixes, and product improvements frequently is a
permanent architectural requirement. Local implementation convenience must not
silently take priority over long-term upstream maintainability.

## Sources of truth

Read the applicable documents in this order:

1. [`../../AGENTS.md`](../../AGENTS.md) — entry point for automated agents.
2. [Brave's inherited agent instructions](../../.claude/CLAUDE.md).
3. [`AGENT_RULES.md`](AGENT_RULES.md) — mandatory Vex-specific rules.
4. [`CONTRIBUTING.md`](CONTRIBUTING.md) — Vex contribution and PR workflow.
5. [`ARCHITECTURE.md`](ARCHITECTURE.md) — stable Vex architecture boundaries.
6. [`UPSTREAM.md`](UPSTREAM.md) — upstream synchronization policy and workflow.
7. [`PATCHSETS.md`](PATCHSETS.md) — registry of Vex divergence from upstream.
8. [`VALIDATION.md`](VALIDATION.md) — evidence required before merge.
9. [`adr/README.md`](adr/README.md) — architecture decision records and the
   exception process.

The public product roadmap lives in
[`VexBrowser/vex-browser`](https://github.com/VexBrowser/vex-browser/blob/main/ROADMAP.md).
It describes *what* the project intends to deliver. The documents here describe
*how* the browser must be engineered and maintained.

Root-level policies also apply:

- [`../../SECURITY.md`](../../SECURITY.md) — private vulnerability reporting and
  current support status;
- [`../../NOTICE`](../../NOTICE) — attribution and project independence;
- [`../../TRADEMARKS.md`](../../TRADEMARKS.md) — proprietary Vex brand boundary;
- [`../../.github/PULL_REQUEST_TEMPLATE.md`](../../.github/PULL_REQUEST_TEMPLATE.md)
  — required upstream-impact and validation fields for pull requests.

## Non-negotiable principles

- Prefer reuse over replacement.
- Prefer Vex-owned files over broad edits to inherited files.
- Prefer configuration, preferences, and feature flags over invasive changes.
- Treat Chromium patch files as a last resort, not the default implementation
  mechanism.
- Avoid unrelated refactors, renames, formatting churn, and dependency changes.
- Develop one major structural feature at a time.
- Keep upstream synchronization separate from Vex feature work.
- Do not claim a feature is complete until it has been built and validated on
  the current Ubuntu reference environment.
- Preserve license notices and keep proprietary Vex brand assets outside open
  source license grants.
- Never add telemetry, remote processing, persistent identifiers, or new
  external endpoints without explicit approval and documentation.

## Updating these documents

A code change that introduces a new long-lived divergence from Brave or
Chromium must update `PATCHSETS.md`. A change that makes an exception to the
shallow-fork policy must add an architecture decision record. Upstream sync
pull requests must update conflict notes when they expose recurring maintenance
cost.

These documents are part of the product's engineering controls. They must not
be bypassed merely because a change is generated or implemented by an agent.
