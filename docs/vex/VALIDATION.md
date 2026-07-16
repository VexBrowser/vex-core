# Vex validation and evidence requirements

## Purpose

Validation must prove both immediate correctness and sustainable integration
with Brave upstream. A change is not complete because it compiles once, and an
upstream sync is not complete because Git reports no unresolved conflicts.

Never report a build, test, or manual check as passing unless it was actually
performed. Clearly label anything not run, not available, or not applicable.

## Reference environment

The initial reference environment is Linux on Ubuntu. Every code-changing pull
request must record:

- Ubuntu release;
- CPU architecture;
- desktop environment when UI behavior is relevant;
- relevant toolchain versions;
- starting Vex commit;
- upstream Brave/Chromium versions;
- exact commands executed;
- build target and output location;
- known local workarounds.

Validation on Ubuntu does not imply support for other Linux distributions or
platforms.

## Validation levels

### Level 0 — Documentation-only

Required for changes that cannot affect build or runtime behavior:

- links and paths checked;
- commands checked for consistency with current upstream documentation;
- terminology and branch names reviewed;
- no accidental modification of generated or inherited source files;
- licensing and trademark statements reviewed when applicable.

Documentation that prescribes a command should identify whether the command was
executed during the change.

### Level 1 — Repository metadata, scripts, flags, or build configuration

Required in addition to Level 0:

- syntax or parser validation for changed formats;
- relevant script or configuration tests;
- `npm run presubmit` where applicable;
- `npm run gn_check` where applicable;
- confirmation that generated files are reproducible;
- clean diff inspection for unrelated dependency or lockfile churn;
- initialization or sync step when dependency resolution is affected.

### Level 2 — Browser code or visible product behavior

Required in addition to Levels 0 and 1:

- successful relevant build on the Ubuntu reference environment;
- successful browser launch;
- focused unit, browser, or integration tests;
- manual verification of the changed behavior;
- comparison with the corresponding Brave behavior;
- screenshots or recordings for visible changes;
- verification with a fresh profile when defaults or onboarding are affected;
- rollback or feature-flag verification when applicable.

### Level 3 — State, session, window, tab, or profile behavior

Required in addition to Level 2:

- normal and private windows;
- multiple windows where supported;
- browser restart and session restore;
- crashed or discarded tabs where relevant;
- profile separation;
- keyboard and pointer interaction;
- accessibility behavior;
- migration from prior Vex state when a schema changes;
- invalid or partial state recovery;
- feature disablement and rollback.

Tabs, pins, folders, Split View, and Quick View normally require Level 3.

### Level 4 — Network, service, privacy, credential, or security boundaries

Required in addition to all lower applicable levels:

- documented threat or privacy analysis;
- endpoint and traffic inspection;
- data and metadata inventory;
- authentication and identifier review;
- logging and retention review;
- offline and failure behavior;
- permission and process-isolation checks;
- secret scanning and log sanitization;
- security-focused tests;
- explicit human approval;
- ADR when required by `AGENT_RULES.md`.

Sync, password handling, telemetry, external services, networking, storage,
sandboxing, and Quick View security-sensitive paths normally require Level 4.

## Minimum commands

Use the current inherited Brave documentation as the source of truth for exact
build and test commands. Common checks include:

```bash
npm run presubmit
npm run gn_check
```

Run relevant unit, browser, and integration tests for the changed area. Do not
run an obsolete command merely because it is listed in an old Vex pull request.
When upstream changes a command, update the applicable Vex documentation.

A full desktop build is required for code changes unless the PR explains why it
cannot affect compiled output and reviewers accept that justification.

## Change-specific validation

### Branding

- visible product name and approved icons;
- About page and primary user-facing strings;
- profile and installation identifiers;
- desktop entry and package metadata when applicable;
- no accidental Brave branding presented as Vex;
- required Brave, Chromium, and third-party attribution;
- proprietary asset license boundary;
- launch with a fresh profile.

### Debloating

For each component:

- UI surface absent or intentionally retained;
- service initialization reviewed;
- scheduled and background work reviewed;
- network traffic reviewed;
- local storage and profile state reviewed;
- build-time inclusion documented;
- related settings and onboarding reviewed;
- no false privacy claim based solely on hidden UI.

### Defaults and onboarding

- fresh profile;
- upgraded existing profile when applicable;
- Shields behavior;
- extension installation and operation;
- search and first-run choices;
- import behavior;
- network requests during startup and first run;
- reset-to-default behavior.

### Tabs, pins, and folders

- open, close, select, move, pin, unpin, reorder;
- multiple windows;
- private windows;
- keyboard navigation;
- drag and drop;
- loading, audio, attention, crashed, and discarded states;
- restart and session restore;
- moving tabs between windows;
- invalid-state recovery;
- horizontal and vertical modes when both are supported.

### Split View and Quick View

- focus and keyboard behavior;
- resize and close behavior;
- restart and safe restoration when applicable;
- downloads and external protocols;
- pop-ups and JavaScript dialogs;
- camera, microphone, notifications, and other permissions;
- fullscreen;
- authentication and cookies;
- site isolation and process behavior;
- DevTools and extensions;
- promotion to a normal tab or Split View when supported;
- accessibility and screen-reader behavior.

### Packaging and updates

- clean installation;
- launch from installed package;
- update from the previous test version;
- rollback or recovery path;
- uninstallation;
- profile preservation and location;
- signing and checksum verification;
- license notices and software inventory;
- architecture and supported Ubuntu version declaration.

### Sync

- encryption invariants;
- new-device and existing-device flows;
- device revocation;
- offline and retry behavior;
- incompatible-version behavior;
- server failure and partial data behavior;
- bookmarks, tabs, history, and passwords separately;
- password data only after the required security review;
- metadata, logs, retention, and endpoint ownership.

## Upstream sync validation

Every upstream sync PR must record:

- old and new upstream commits;
- old and new Brave/Chromium versions;
- manually resolved conflicts;
- refreshed Chromium patches;
- generated-file changes;
- dependency and toolchain changes;
- a successful initialization or sync;
- relevant presubmit and GN checks;
- a desktop build and browser launch on Ubuntu;
- focused regression checks for every active Vex patchset;
- patchsets simplified or retired because of upstream changes;
- untested areas and follow-up issues.

A sync should also confirm that new upstream product behavior did not re-enable
removed services, introduce unexpected network calls, overwrite Vex defaults,
or restore unapproved branding.

## Evidence format in pull requests

Use concise, reproducible evidence:

```text
Environment:
Starting commit:
Upstream commit/version:
Commands run:
Build target/output:
Automated tests:
Manual checks:
Network/privacy checks:
Screenshots or recordings:
Not run / not applicable:
Known limitations:
Rollback verified:
```

Long logs should be attached or linked rather than pasted in full. Remove
secrets, tokens, credentials, profile data, URLs containing personal data, and
other sensitive material before sharing logs.

## Failure handling

Do not hide a failure by disabling a test, weakening a check, changing an
expected result without understanding it, or deleting local machine state.

When validation fails:

1. preserve the relevant evidence;
2. determine whether the failure is inherited, environmental, or introduced by
   the Vex delta;
3. compare with the matching Brave baseline when possible;
4. reduce the change to the smallest reproducer;
5. open a follow-up issue only when the current PR can still meet its own exit
   criteria;
6. do not merge with an unexplained security, data-integrity, or upstream-sync
   failure.

## Completion rule

A feature may be functionally complete after its first validated merge, but it
is not considered sustainably complete until it survives a relevant Brave
upstream synchronization or the next sync explicitly verifies its patchset.
