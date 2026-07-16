# Vex architecture decision records

Architecture decision records (ADRs) document deliberate exceptions,
long-lived tradeoffs, and decisions that materially affect upstream
maintainability, security, privacy, data models, or repository structure.

ADRs do not replace issues or pull requests. The issue describes the work, the
ADR records the durable decision, and the pull request implements an accepted
decision.

## When an ADR is required

Create an ADR before implementation when a proposal:

- deeply modifies Chromium or an engine-level subsystem;
- creates a large parallel subsystem instead of extending Brave;
- introduces a new persistent state model or migration;
- changes security, privacy, permission, isolation, or encryption boundaries;
- introduces a new production network service, protocol, or external endpoint;
- adds a dependency with substantial security, build, or maintenance impact;
- accepts repeated upstream conflicts as a permanent cost;
- cannot be disabled or reverted independently;
- changes the shallow-fork or upstream synchronization strategy;
- requires an exception to `docs/vex/AGENT_RULES.md` or
  `docs/vex/ARCHITECTURE.md`.

An ADR may also be used for a non-exceptional decision when future contributors
would otherwise repeatedly revisit the same tradeoff.

## Naming

Use sequential four-digit identifiers and a short lowercase name:

```text
0001-example-decision.md
0002-another-decision.md
```

Do not reuse identifiers from rejected or superseded ADRs.

## Status values

- **Proposed** — open for review; implementation must not rely on approval.
- **Accepted** — approved project direction.
- **Rejected** — considered and intentionally not adopted.
- **Superseded** — replaced by a newer ADR.
- **Deprecated** — still historically relevant but no longer recommended.

## Required review

An ADR that weakens an existing boundary, introduces substantial recurring
upstream cost, handles credentials or browsing data, or modifies a deep browser
subsystem requires explicit human approval from the project owner before code
implementation begins.

Automated agents may draft and analyze an ADR. They must not mark their own
exception as accepted.

## Decision criteria

Every ADR must compare lower-friction alternatives and address:

- user or maintenance value;
- existing Brave and Chromium foundations;
- Vex-owned versus inherited files;
- Chromium patches required;
- recurring upstream conflict risk;
- security and privacy impact;
- accessibility impact;
- data model and migration impact;
- validation and rollback;
- opportunity to contribute a generic hook or fix upstream;
- conditions under which the decision should be revisited.

"Faster to implement" is not sufficient justification for permanent
architecture cost.

## Lifecycle

1. Copy `0000-template.md` to the next identifier.
2. Set status to **Proposed**.
3. Link the tracking issue and relevant roadmap milestone.
4. Complete alternatives and upstream-impact analysis.
5. Obtain the required review.
6. Set the final status and record the decision date.
7. Link implementation pull requests.
8. Update `PATCHSETS.md` when the decision creates long-lived divergence.
9. Revisit the ADR after recurring conflicts, major upstream changes, incidents,
   or changed product requirements.

Do not rewrite an accepted ADR to hide that a decision changed. Add a new ADR
that supersedes it and link both records.
