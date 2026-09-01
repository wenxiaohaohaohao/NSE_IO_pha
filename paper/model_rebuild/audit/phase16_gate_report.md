# Phase 16 Gate Report

Date: 2026-09-01

## Overall result

- Overall gate: PASS
- P0: 0
- P1: 0
- Locked-architecture change: NO
- Current-phase evidence blocker: NONE
- Manuscript-scope expansion: NO
- Status at gate: `APPROVED` under `EXEC-GOV-001`

The READY-state audit passed 122 checks with zero failures. Under
`EXEC-GOV-001`, the user's standing authorization therefore approves this
zero-P0 gate without a repeat approval prompt.

## Entry and scope checks

| Check | Result | Evidence |
|---|---|---|
| Effective specification hash is unchanged | PASS | `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666` |
| Phase 15 is approved, committed, and pushed | PASS | `a181ff874a53371d2dfc775e0df2cb60b409641c` |
| Work is on the isolated rebuild branch | PASS | `codex/mah-model-rebuild` |
| Locked manuscript remains unchanged | PASS | empty diff from `cd5b6e4` under `paper/manuscript/` |
| Original checkout collaborator ZIP is isolated | PASS | absent from the rebuild worktree status and change set |
| Formal Phase 16 scope only | PASS | automated exact-scope audit |

## Deliverables

| Deliverable | Result | Evidence |
|---|---|---|
| Restrained main-text model candidate | PASS | `paper/model_rebuild/13_main_text_model_candidate.tex`; 4-page PDF |
| Full technical appendix candidate | PASS | `paper/model_rebuild/14_appendix_model_candidate.tex`; 33-page PDF |
| Approved-draft split ledger | PASS | `paper/model_rebuild/audit/phase16_split_ledger.md` |
| Shi Gu source provenance | PASS | `paper/model_rebuild/evidence/shigu_2024_ssrn_4770849_manifest.md` |
| Claim-by-claim evidence boundary | PASS | `paper/model_notes/08_shigu_empirical_boundary_check.md` |
| Independent split audit | PASS | `paper/model_rebuild/audit/phase16_independent_split_audit.md` |
| PDF render audit | PASS | `paper/model_rebuild/audit/phase16_pdf_render_audit.md` |

## Shi Gu evidence gate

The user-identified source is the August 22, 2024, 74-page version of
Shi Gu, *Production Outsourcing and Innovation: Evidence from China's
Pharmaceutical Industry*. Its frozen SHA256 is
`A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB`.

| Evidence ID | Result | Boundary |
|---|---|---|
| `SG-01` | PASS | clinical-trial response among innovators without production facilities |
| `SG-02` | PASS | response is concentrated in first-stage trials |
| `SG-03` | PASS | patent applications decline, concentrated among firms with fewer financial resources |
| `SG-04` | PASS | no statistically significant decline in granted/core patent proxies |
| `SG-05` | PASS WITH PRECISION LIMIT | incremental-chemical point estimates exceed original-chemical estimates; no reported equality test |
| `SG-06` | PASS WITH PRECISION LIMIT | original-biological response is positive and numerically smaller; no reported equality test |
| `SG-07` | PASS | pure-researcher-to-developer transition rises |

No required Phase 16 Shi Gu claim remains `UNVERIFIED` for this PDF version.
The candidates do not convert these findings into a financial-constraint,
entry, or separate research-versus-development-control mechanism.

## Mathematical and economic review

- The main candidate uses the v1.2 definition of `x_i` and contains no
  class-specific control.
- MAH enters only through `tau_E(M)` and affects advancement only through
  `Omega_i`.
- Entrusted production preserves holder rights; it is not transfer.
- Route choice remains deterministic, with no baseline logit or inclusive
  value.
- The partial equilibrium retains exactly
  `{p_m^*,x_i^*,r_i^*(q,m),s_j^*}`.
- Fixed-price and equilibrium-price effects remain distinct.
- Planning, route assignment, and observed outcomes retain the approved
  timing.
- Patent applications and upstream research remain outside the baseline.
- The original/incremental classifier is empirical only; no fixed ranking is
  imposed.
- The appendix preserves the full approved derivations and places every
  non-baseline mechanism after the explicit extensions boundary.

## LaTeX and render checks

| Candidate | Passes | Pages | Fatal/undefined/duplicate-reference warnings | Box warnings | Visual result |
|---|---:|---:|---:|---:|---|
| Main text | 2 | 4 | 0 | 0 | PASS, all pages inspected |
| Appendix | 2 | 33 | 0 | 0 | PASS, boundary and extension transition inspected |

MiKTeX ran with project-local D-drive temporary and build directories.

## Traceability disposition

All absolute red lines were checked:

`RL-01`, `RL-02`, `RL-03`, `RL-04`, `RL-05`, `RL-06`,
`RL-07`, `RL-08`, `RL-09`, `RL-10`, `RL-11`, `RL-12`,
`RL-13`, `RL-14`, `RL-15`, `RL-16`, `RL-17`, `RL-18`,
`RL-19`, `RL-20`, `RL-21`, `RL-22`, `RL-23`, `RL-24`,
`RL-25`, `RL-26`, `RL-27`, `RL-28`: PASS.

Phase deliverable and gate: `P16-D01`, `P16-G01`: PASS.

Proof QA: `QA-PROOF-01`, `QA-PROOF-02`, `QA-PROOF-03`,
`QA-PROOF-04`, `QA-PROOF-05`, `QA-PROOF-06`, `QA-PROOF-07`,
`QA-PROOF-08`, `QA-PROOF-09`, `QA-PROOF-10`: PASS or preserved from
the approved Phase 15 derivations and rechecked after the split.

Economic QA: `QA-ECON-01`, `QA-ECON-02`, `QA-ECON-03`,
`QA-ECON-04`, `QA-ECON-05`, `QA-ECON-06`, `QA-ECON-07`,
`QA-ECON-08`: PASS.

Success criteria: `SUCCESS-01`, `SUCCESS-02`, `SUCCESS-03`,
`SUCCESS-04`, `SUCCESS-05`, `SUCCESS-06`, `SUCCESS-07`,
`SUCCESS-08`, `SUCCESS-09`, `SUCCESS-10`, `SUCCESS-11`,
`SUCCESS-12`, `SUCCESS-13`: PASS at the Phase 16 candidate boundary.

## Old-model conflicts

The locked manuscript still contains the scheduled old logit, inclusive-value,
continuous-`eta`, and generic-R&D formulations. They are listed in
`paper/model_notes/08_shigu_empirical_boundary_check.md` and the approved
Phase 12 crosswalk. They remain read-only scheduled replacement targets for
Phase 18, not Phase 16 candidate defects.

## Next action

Rerun the APPROVED-state audit, commit and push Phase 16, then begin the
Phase 17 global consistency audit.

