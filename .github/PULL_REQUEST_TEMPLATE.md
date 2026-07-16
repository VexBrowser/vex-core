<!-- Link the Vex tracking issue that this PR resolves. -->
- Resolves VexBrowser/vex-browser#

## Change summary

<!-- Describe one coherent change. Do not combine unrelated features, refactors, or upstream synchronization. -->

## Change type

- [ ] Vex feature or fix
- [ ] Brave upstream synchronization
- [ ] Chromium patch update
- [ ] Build, packaging, or dependency change
- [ ] Documentation or repository governance only

## Upstream foundation and Vex delta

<!-- Identify existing Brave/Chromium behavior, flags, prefs, components, or patches that were investigated and reused. -->

**Brave/Chromium foundation reused:**

**Vex-owned files added or changed:**

**Inherited Brave-owned files changed:**

**Chromium patch files and upstream targets changed:**

**Why a lower-friction option was insufficient:**

**Expected recurring conflict areas:**

**Rollback or feature-disable path:**

## Validation evidence

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

## Vex checklist

- [ ] I read `AGENTS.md` and the applicable documents under `docs/vex/`.
- [ ] This PR addresses one coherent concern and contains no unrelated refactor, broad rename, formatting churn, or dependency update.
- [ ] I investigated existing Brave and Chromium foundations before creating parallel behavior.
- [ ] The change uses the highest viable option in the implementation preference order from `docs/vex/AGENT_RULES.md`.
- [ ] Long-lived divergence is recorded in `docs/vex/PATCHSETS.md`.
- [ ] An ADR is linked when the change creates an architecture exception or substantial recurring upstream cost.
- [ ] Generated files were produced by documented commands rather than edited manually.
- [ ] Privacy, security, accessibility, licensing, attribution, and proprietary brand impact were reviewed.
- [ ] No secrets, profile data, private brand source files, or sensitive logs are included.
- [ ] Validation results above describe only checks that were actually run.
- [ ] A feature PR does not contain an upstream sync, and a sync PR does not contain Vex product work.
- [ ] The change can be reverted or disabled without reconstructing broad deleted upstream code.

<!-- CI-related labels that can be applied to this PR:
* CI/disable-pipeline-step-cache - do not cache build steps between runs for the same commit hash
* CI/enable-coverage - enable coverage reporting
* CI/enable-test-only-affected - only run tests affected by changes in the PR
* CI/run-audit-deps (1) - run audit_deps
* CI/run-linux-arm64, CI/run-macos-x64, CI/run-windows-arm64, CI/run-windows-x86 - run builds that would otherwise be skipped
* CI/run-network-audit (1) - run network-audit
* CI/run-perf-smoke-tests - run perf_tests
* CI/run-upstream-tests - run Chromium unit and browser tests on Linux and Windows (otherwise only on Linux)
* CI/skip - do not run CI builds (except noplatform)
* CI/skip-android, CI/skip-macos-arm64, CI/skip-ios, CI/skip-windows-x64 - skip CI builds for specific platforms
* CI/skip-origin - do not run any builds for Brave Origin
* CI/skip-upstream-tests - do not run Chromium unit, or browser tests (otherwise only on Linux)
* CI/storybook-url (1) - deploy storybook and provide a unique URL for each build

(1) applied automatically when some files are changed (see: https://github.com/brave/brave-core/blob/master/.github/labeler.yml)
-->

<!--
## Inherited upstream review reminders

- Review relevant Chromium browser design principles and style guides.
- Add focused unit and browser tests, including edge cases.
- Explain why classes and methods exist, not only what they do.
- Request security, privacy, dependency, or other specialist review when applicable.
- Write a clear PR and commit description.
- Keep review-fix history clean according to the repository's merge policy.
- Run the relevant inherited Brave tests and presubmit checks.
- Feature branches may be updated from Vex `master` as needed. Upstream sync branches must follow `docs/vex/UPSTREAM.md` and preserve upstream ancestry.
-->
