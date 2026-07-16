# ADR-0000: Decision title

- **Status:** Proposed
- **Date:** YYYY-MM-DD
- **Decision owners:** The Vex Team
- **Tracking issue:** https://github.com/VexBrowser/vex-browser/issues/...
- **Roadmap milestone:** link or name
- **Related patchset:** VEX-NNN or `none`
- **Supersedes:** ADR-NNNN or `none`
- **Superseded by:** ADR-NNNN or `none`

## Context

Describe the user problem, maintenance problem, constraint, or incident that
requires a durable architectural decision.

Explain why this decision cannot be handled as an ordinary focused change under
the existing architecture rules.

## Decision drivers

- Security and timely upstream updates.
- Correctness and preservation of user data.
- Privacy and clear network behavior.
- Upstream maintenance cost.
- Accessibility and platform behavior.
- Product value.
- Reversibility.

Add or remove drivers that are genuinely relevant.

## Existing Brave and Chromium foundations

Describe the existing components, preferences, feature flags, APIs, patches,
experiments, or product behavior that were investigated.

Include links or paths where possible.

## Options considered

### Option A — Highest-level, lowest-friction option

Describe the configuration, reuse, feature-flag, or extension-point approach.

**Advantages**

- ...

**Disadvantages**

- ...

**Upstream impact**

- Inherited files modified:
- Chromium patches:
- Expected recurring conflicts:

### Option B — Isolated Vex-owned implementation

Describe a Vex-owned component with narrow integration hooks.

**Advantages**

- ...

**Disadvantages**

- ...

**Upstream impact**

- Inherited files modified:
- Chromium patches:
- Expected recurring conflicts:

### Option C — More invasive option

Describe the deeper implementation only when it is a serious candidate.

**Advantages**

- ...

**Disadvantages**

- ...

**Upstream impact**

- Inherited files modified:
- Chromium patches:
- Deep subsystems affected:
- Expected recurring conflicts:

## Decision

State the selected option and the precise boundaries of what is approved.

Explicitly state what remains out of scope.

## Why lower-friction options are insufficient

Explain why the selected decision cannot meet its requirements through a
higher-level or less divergent approach. Implementation speed alone is not a
sufficient reason.

## Consequences

### Positive

- ...

### Negative and recurring cost

- ...

### Risks

- ...

## Upstream synchronization impact

- Vex-owned paths:
- Brave-owned paths modified:
- Chromium patch files:
- Upstream files and symbols touched:
- Likely conflict areas:
- Expected conflict frequency:
- Proposed friction-reduction strategy:
- Upstream contribution opportunity:

## Security and privacy impact

Describe data, metadata, endpoints, permissions, process boundaries, isolation,
credentials, encryption, logging, retention, and abuse considerations.

Write `No new impact` only after checking these areas.

## Accessibility impact

Describe keyboard, focus, screen-reader, contrast, motion, scaling, and platform
convention implications.

## State, migration, and compatibility

Describe persistent state, serialization, profile behavior, session restore,
migrations, backward compatibility, invalid-state recovery, and future Sync
implications.

## Validation plan

List automated tests, builds, manual checks, security checks, network inspection,
and upstream-sync verification required before and after merge.

## Rollback plan

Explain how the change can be disabled or removed, what happens to persistent
state, and how users recover safely.

## Implementation plan

Break implementation into independently reviewable steps. Do not combine the
architecture exception with unrelated product work.

## Revisit conditions

List upstream changes, conflict frequency, incidents, product changes, or
maintenance thresholds that should trigger reconsideration.

## Approval

- **Human decision:** Pending | Accepted | Rejected
- **Approved by:**
- **Approval date:**
- **Notes:**

Automated agents must leave the human decision as **Pending** until a human
project owner explicitly approves or rejects the proposal.
