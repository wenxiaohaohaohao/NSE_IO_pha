# Phase 17 Gate Report

Date: 2026-09-01  
Entry commit: `8d0ef8902d88f129e3ac3be41fcca6416f869398`  
Effective-spec SHA256:
`855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`

## 1. Scope and result

Phase 17 audited every active occurrence of the thirteen required core
objects, answered all sixteen mandatory consistency questions, corrected all
independent-review findings, rebuilt all three candidates, and preserved the
Phase 18 manuscript boundary.

- Automated Gate: 166 PASS, 0 FAIL at the final `IN_PROGRESS` checkpoint;
  168 PASS, 0 FAIL at both `READY_FOR_APPROVAL` and `APPROVED` checkpoints.
- Manual consistency audit: PASS.
- Independent final reviews: no remaining P0 or P1.
- P0: 0.
- P1 remaining: 0.
- Locked-architecture change: NO.
- Unresolved evidence blocker: NONE.
- Manuscript modification: NONE.
- Overall gate: PASS.

## 2. Phase deliverable and Gate IDs

| ID | Requirement | Result | Evidence |
|---|---|---|---|
| `P17-D01` | global consistency audit and exhaustive occurrence ledger | PASS | `paper/model_notes/07_consistency_audit.md`; `audit/phase17_occurrence_catalog.csv` |
| `P17-G01` | zero P0; candidate consistency; legacy manuscript unchanged | PASS | `audit/phase17_audit_results.json`; this report |

The occurrence catalog has 1,489 classified rows. Counts are: `M` 135,
`tau_E` 31, `p_m` 295, `a_i` 173, `k_i` 79, `q` 230, `m` 232, `s(q)` 34,
`W_I` 13, `W_E` 30, `W_T` 10, `Omega_i` 88, and `x_i` 139.

## 3. Absolute Red Lines

| ID | Result | Phase 17 evidence |
|---|---|---|
| `RL-01` | PASS | novelty class remains an exogenous empirical classifier; no original-versus-generic R&D direction |
| `RL-02` | PASS | no permanent A/B/C firm taxonomy in active candidates |
| `RL-03` | PASS | no multi-product firm state or portfolio closure |
| `RL-04` | PASS | entry is excluded from baseline and named only as an inactive extension |
| `RL-05` | PASS | no Hopenhayn distribution or stationary firm-population block |
| `RL-06` | PASS | no household, capital accumulation, balanced growth, or welfare closure |
| `RL-07` | PASS | `M` has no direct arrow to `a_i` |
| `RL-08` | PASS | `M` has no direct arrow to `A`, `q`, or demand |
| `RL-09` | PASS | `s(q)` and `s_g(q)` are exogenous and MAH-invariant |
| `RL-10` | PASS | `p_m^*` is an equilibrium object and is not assumed to fall after MAH |
| `RL-11` | PASS | route `E` retains holder rights and is not ownership transfer |
| `RL-12` | PASS | logit and inclusive value are quarantined in `11_extensions_not_baseline.tex` |
| `RL-13` | PASS | the sole `eta` occurrence is a negative deletion crosswalk; no active continuous implementation parameter |
| `RL-14` | PASS | no reference-paper state variable enters the baseline graph |
| `RL-15` | PASS | `paper/manuscript/` is byte-identical to locked base `cd5b6e4` |
| `RL-16` | PASS | empirical interfaces explicitly reject primitive-by-primitive identification claims |
| `RL-17` | PASS | formal equations, proofs, dependency map, and independent derivations remain the evidence; pseudo-code is not substituted |
| `RL-18` | PASS | the exhaustive ledger and symbol registry verify unique meanings across active files |
| `RL-19` | PASS | every proposition object is defined in preceding primitive/technology/value modules |
| `RL-20` | PASS | no welfare conclusion is drawn from private value or realized output |
| `RL-21` | PASS | `x_i` is project-advancement intensity, not upstream patent-generating research |
| `RL-22` | PASS | no theoretical statement claims that MAH must raise patent applications |
| `RL-23` | PASS | no theoretical statement claims that MAH must raise upstream scientific research |
| `RL-24` | PASS | original/breakthrough responses have no forced positive sign |
| `RL-25` | PASS | no baseline `x_i^R`, `x_i^D`, binding finance constraint, or research-development allocation |
| `RL-26` | PASS | a negative patent response is stated not to falsify the commercialization mechanism by itself |
| `RL-27` | PASS | original and incremental reform gains have no imposed ranking |
| `RL-28` | PASS | financing is an inactive possible extension; the paper remains about commercialization organization and CMO scarcity |

## 4. Proof and economic QA

| IDs | Result | Evidence |
|---|---|---|
| `QA-PROOF-01`--`QA-PROOF-05` | PASS | Phase 15 independent derivation audit; assumptions/proposition matrix; comparative-statics module |
| `QA-PROOF-06` | PASS | binary `M` is handled by finite comparison, never by a derivative |
| `QA-PROOF-07` | PASS | fixed candidate `p_m` and equilibrium `p_m^*` are separated throughout |
| `QA-PROOF-08` | PASS | mandatory limits and zero-effect cases remain in the approved full draft |
| `QA-PROOF-09` | PASS | dependency map closes the scalar `p_m^*` fixed point and states regularity |
| `QA-PROOF-10` | PASS | main, appendix, and full draft compile stably with zero reference, label, box, or PDF-string warnings |
| `QA-ECON-01` | PASS | the only direct policy arrow is `M -> tau_E(M)`; the wedge itself encodes effective route availability |
| `QA-ECON-02` | PASS | planning, route assignment, holder-producer observation, and realization have distinct timing |
| `QA-ECON-03` | PASS | retained route `E` is separated from transfer route `T` |
| `QA-ECON-04` | PASS | equilibrium claims use the market-clearing `p_m^*` |
| `QA-ECON-05` | PASS | logit, dynamics, matching, entry, financing, and research-development allocation remain quarantined |
| `QA-ECON-06` | PASS | every empirical interface states grain, keys, availability, and identification limits |
| `QA-ECON-07` | PASS | innovation wording names project advancement, route choice, or realized products as appropriate |
| `QA-ECON-08` | PASS | Shi Gu claims are tied to the frozen PDF, page/table evidence, and explicit inference limits |

## 5. Corrected findings

`P17-C01`--`P17-C12` are all closed. They cover the common route-label
domain, evidence wording, frozen `varphi in [0,1)` domain, complete catalog
scope, stable compilation, note-layer status, finance-boundary wording,
single-policy-channel wording, PDF bookmark warnings, and the patenting-side
construct boundary. Full evidence is in
`audit/phase17_p1_corrections.md`.

## 6. Compilation and visual verification

| Artifact | Stable passes | Pages | Final-log result |
|---|---:|---:|---|
| `13_main_text_model_candidate.tex` | 2 | 4 | PASS; zero audited warnings |
| `14_appendix_model_candidate.tex` | 3 | 33 | PASS; zero audited warnings |
| `12_full_derivation_draft.tex` | 3 | 36 | PASS; zero audited warnings |

Appendix pages 4, 7, 24, and 31 were rendered at 144 dpi and visually
inspected. `audit/phase17_pdf_render_audit.md` records zero visual defects.

## 7. Candidate-level success criteria

| IDs | Phase 17 verdict |
|---|---|
| `SUCCESS-01`--`SUCCESS-03` | PASS at candidate level: one institutional primitive, explicit technologies/profits, endogenous route choice |
| `SUCCESS-04`--`SUCCESS-06` | PASS at candidate level: project-advancement channel, zero effects, heterogeneous responses, no novelty ranking |
| `SUCCESS-07`--`SUCCESS-10` | PASS at candidate level: equilibrium CMO attenuation, partial-equilibrium scope, no baseline logit tautology, interpretable comparative statics |
| `SUCCESS-11`--`SUCCESS-13` | PASS at candidate level: clinical-trial and patent margins may diverge; patent reallocation remains outside baseline; contribution remains commercialization organization, mismatch, and CMO scarcity |

Final manuscript-level verification of `SUCCESS-01`--`SUCCESS-13` remains a
Phase 18 obligation and is not claimed here.

## 8. Protected scope and next state

- Original checkout collaborator ZIP: absent from this worktree and from the
  Phase 17 diff.
- Existing manuscript: unchanged relative to the locked base.
- Scheduled old-model conflict: `ISSUE-SPEC-002 / P1-SCHEDULED-CROSSWALK`
  remains only in the read-only manuscript and is deferred to Phase 18.
- Phase 18 remains `BLOCKED` until separate explicit authorization to modify
  the manuscript.

Because the gate has zero P0, no architecture change, no unresolved evidence
blocker, and no manuscript-scope expansion, `EXEC-GOV-001` authorizes the
Phase 17 approval transition, commit, and push without another routine user
prompt. It does not authorize Phase 18 manuscript modification.

Approval recorded at 2026-09-01T20:05:00.9239947+08:00 in
`spec/approvals/phase17_standing_authorization.md`.
