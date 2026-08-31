# Phase 12 Preflight

- Phase: 12 - Old-to-New Model Crosswalk
- Status at start: IN PROGRESS
- Checked: 2026-08-31 Asia/Shanghai
- Branch: codex/mah-model-rebuild
- Entry commit: b06be5ac3499df9b7493081f5febde0fb68274a6
- Entry remote commit: b06be5ac3499df9b7493081f5febde0fb68274a6
- Locked base: cd5b6e49608749e0bf32f3d9aa235a84f378347b
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Previous phase: Phase 11 APPROVED
- Phase 13 at start: NOT STARTED

## Scope

Authorized writes are the Phase 12 crosswalk, its mechanically generated
legacy occurrence index, state/traceability records, compile wrapper, audit
evidence, gate report, hash record, and approval record. The main manuscript,
technical appendix, and research_notes/model_notes are read-only evidence.

## Required checks

| Check | Result |
|---|---|
| frozen base, v1.1, v1.2 image, v1.2 transcription, and effective-spec hashes | PASS |
| branch equals codex/mah-model-rebuild | PASS |
| local entry equals remote entry | PASS |
| Phase 11 status APPROVED | PASS |
| Phase 13 status NOT STARTED | PASS |
| paper/manuscript diff from locked base empty | PASS |
| collaborator ZIP absent from rebuild worktree status | PASS |
| old research_notes/model_notes used read-only | PASS |
| outputs and temporary files confined to D-drive worktree | PASS |

No P0 issue was found at preflight.
