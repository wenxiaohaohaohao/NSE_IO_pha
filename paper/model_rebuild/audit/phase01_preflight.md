# Phase 1 Preflight

Status: `PASS — PHASE 1 IN PROGRESS`  
Checked at: 2026-08-30 Asia/Shanghai

## Repository and approval checks

| Check | Result | Evidence |
|---|---|---|
| Branch | PASS | `codex/mah-model-rebuild` |
| Clean worktree before Phase 1 | PASS | `git status --short` returned no paths |
| Local specification commit | PASS | `5fc7f352cb244dac09da4d4567bc331eaaa29dda` |
| Remote specification commit | PASS | `origin/codex/mah-model-rebuild` resolved to the same commit |
| Specification status | PASS | `APPROVED` in `paper/model_notes/00_model_closure_status.md` |
| Phase 1 authorization | PASS | `Yes` in the same status file |
| Phase 2 authorization | PASS | none; Phase 2 remains `NOT STARTED` |

## Hash checks

| Object | Required SHA256 | Result |
|---|---|---|
| Frozen base note | `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24` | PASS |
| Frozen v1.1 amendment | `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9` | PASS |
| Frozen v1.2 image | `1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5` | PASS |
| v1.2 transcription | `06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E` | PASS |
| Effective specification | `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666` | PASS |

## Required reread

The following material was reread before any Phase 1 formal file was created:

- effective-spec precision block for \(x_i\);
- `RL-01`--`RL-28`;
- frozen agents and heterogeneity;
- project heterogeneity and the \(g\in\{O,\mathrm{Inc}\}\) classifier;
- Phase 1 task, timing, deliverables and gate;
- proof/economic QA and explicit non-tasks;
- `00_model_closure_status.md`;
- `06_open_issues_log.md`;
- `07_specification_decision_log.md`.

The Phase 1 symbols, assumptions and dependency-map files did not yet exist; creating their initial versions is a Phase 1 deliverable. No prior definitions were available to inherit silently.

## Scope and issues

- `paper/manuscript/` remains unchanged relative to `cd5b6e4`.
- The modified collaborator ZIP remains only in the original checkout and is clean in this worktree.
- `ISSUE-SPEC-001` and `ISSUE-SPEC-002` are P1 issues scheduled for later phases; neither changes Phase 1 architecture.
- Current P0 count: `0`.

## Preflight decision

All entry conditions pass. Phase 1 may move from `NOT STARTED` to `IN PROGRESS`. This decision does not authorize Phase 2.
