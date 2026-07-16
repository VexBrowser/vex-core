# Vex security policy

## Project status and supported versions

Vex is currently in pre-alpha development. There are no official supported
releases or guaranteed security-support windows yet.

Development builds may be incomplete, unsigned, stale, or unsuitable for normal
browsing. Do not use pre-alpha builds for sensitive activity unless you
understand and accept the risks.

This policy will be updated before Vex publishes a supported release channel.

## Reporting a vulnerability

Do not open a public issue, discussion, or pull request for a suspected security
vulnerability.

Use GitHub Private Vulnerability Reporting for the Vex project:

https://github.com/VexBrowser/vex-browser/security/advisories/new

Include, when available:

- the affected Vex commit, branch, tag, or build identifier;
- Ubuntu version, architecture, and relevant environment details;
- a clear description of the impact;
- minimal reproduction steps or proof of concept;
- whether the same behavior occurs in the corresponding Brave or Chromium
  version;
- relevant logs with secrets and personal data removed;
- any known mitigations;
- your preferred disclosure or credit information.

Do not include live credentials, private keys, Sync secrets, personal browsing
data, or unnecessary user information.

## Upstream coordination

Vex is derived from Brave and Chromium. A report may affect Vex only, may already
exist upstream, or may require coordinated fixes and disclosure with Brave,
Chromium, or another dependency.

The Vex Team will determine the appropriate coordination path. Reporters should
not assume that submitting a Vex report also notifies upstream projects.
Likewise, the Brave HackerOne program is not the reporting channel for
Vex-specific vulnerabilities.

When a vulnerability is clearly inherited and already reported upstream, include
available references without publicly disclosing embargoed details.

## Disclosure

Please allow reasonable time for investigation, upstream coordination, a fix,
and user migration before public disclosure. Because Vex is pre-alpha and has
no staffed response-time commitment, no response SLA is currently promised.

The project may request additional information, close reports that are not
security issues, or direct an inherited issue to the appropriate upstream
process.

## Security-sensitive changes

Changes involving credentials, passwords, Sync, encryption, permissions,
sandboxing, site isolation, process models, network security, storage, or remote
services must follow `docs/vex/AGENT_RULES.md`, `docs/vex/VALIDATION.md`, and the
ADR process under `docs/vex/adr/`.
