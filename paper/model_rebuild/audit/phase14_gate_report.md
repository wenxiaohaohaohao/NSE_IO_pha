# Phase 14 Gate Report

- Phase: 14 - Assumption Discipline
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: 802963da6a7634f71aabac128069cdc51affdd77
- Overall gate: PASS
- P0: 0
- P1: 0

The pre-existing Shi Gu detailed-claim evidence issue remains deferred to
Phase 16 and is not a Phase 14 assumption defect.

## 1. Authoritative assumption taxonomy

| Block | Canonical IDs | Count | Result |
|---|---|---:|---|
| Demand and commercial return | `A-DEM-01`--`A-DEM-03` | 3 | PASS |
| Manufacturing technology | `B-MFG-01`--`B-MFG-05` | 5 | PASS |
| Project advancement | `C-ADV-01`--`C-ADV-06` | 6 | PASS |
| CMO-market regularity | `D-CMO-01`--`D-CMO-04` | 4 | PASS |
| Total | — | 18 | PASS |

The four blocks are the only active assumption taxonomy. All 46 earlier
`A-Pxx-*` IDs are mapped exactly once to a canonical assumption or an
`ARCH-*` guard; no approved earlier reference is orphaned.

## 2. Assumption discipline

- Primitive, maintained regularity, optimization-derived, derived conclusion
  and architecture restriction are separately defined: PASS.
- Optimization FOCs, SOCs, envelope signs and best responses are not
  assumptions: PASS.
- Cutoff existence, sorting, relevant-set gains, optimal advancement,
  equilibrium existence/uniqueness and equilibrium price order are recorded as
  derived conclusions: PASS.
- Endpoint crossing and `\nu\geq1` are proposition-specific sufficient
  conditions, not general conclusions: PASS.
- Failure of a sufficient condition produces an unsigned or zero-effect
  boundary rather than a stronger claim: PASS.

## 3. Proposition--assumption matrix

The matrix contains exactly six proposition rows and one novelty-corollary row.
Every row separates canonical assumptions, definition/derived parents,
architecture guards, strict conditions and zero-effect cases.

| Result | Main audit conclusion |
|---|---|
| Proposition 1 | `R_c<0` and `\Delta_{IE,k}>0` are derived; crossing is cell-specific and outside options remain binding |
| Proposition 2 | the MAH-relevant set follows from deterministic choice-set expansion; no universal gain is assumed |
| Proposition 3 | one common `x_i` and the value channel are retained; capability scaling names its extra curvature condition |
| Novelty corollary | `\rho_gF_g` uses the common control; no class ranking or `x_{ig}` appears |
| Proposition 4 | CMO existence/uniqueness follows from stated price-boundary and monotonicity conditions |
| Proposition 5 | the price order and scarcity attenuation are equilibrium results; no direct policy-price arrow is assumed |
| Proposition 6 | planning precedes route/realization and no patent outcome is created |

## 4. v1.2 and architecture boundaries

- `x_i` means original-drug innovation investment / project-advancement
  intensity: PASS.
- `x_i` is not limited to pure clinical development and is not patent
  applications, patent effort, basic research or upstream discovery: PASS.
- one common `x_i`; `g\in\{O,\mathrm{Inc}\}` is only an empirical classifier:
  PASS.
- only `M\to\tau_E(M)` is a direct policy channel: PASS.
- fixed price, equilibrium price, finite wedge and binary policy are distinct:
  PASS.
- holder rights, timing, accounting and partial-equilibrium scope are guards,
  not added assumptions: PASS.
- extension assumptions do not enter a baseline proof: PASS.

## 5. Automatic and compile audit

- IN_PROGRESS automated audit: 69 PASS / 0 FAIL.
- Four canonical blocks and 18 canonical IDs: PASS.
- Forty-six legacy aliases, each exactly once: PASS.
- Orphan legacy references: 0.
- Conclusion-as-assumption forbidden patterns: 0.
- Proposition checklist legacy IDs: 0.
- Phase 1--10 cumulative MiKTeX compile: PASS.
- Fatal errors, undefined references, duplicate labels, box warnings: 0.
- Manuscript diff against locked base: empty.
- Collaborator ZIP in rebuild worktree status: absent.

## 6. Traceability

| IDs | Result | Evidence |
|---|---|---|
| RL-01--RL-06 | PASS | no drug-direction control, permanent type, entry, dynamics, household or welfare assumption |
| RL-07--RL-11 | PASS | policy, technology, realization, price and holder-right guards remain bounded |
| RL-12--RL-20 | PASS | prohibited baseline mechanisms absent; notation and definition order preserved |
| RL-21--RL-28 | PASS | v1.2 `x_i`, patent, novelty and contribution boundaries are explicit |
| P14-D01 | PASS | four assumption blocks, architecture guards, 46-ID alias ledger and 7-row matrix |
| P14-G01 | PASS | primitive/derived/assumed distinction; no conclusion is substituted for an assumption |
| QA-PROOF-01 | PASS | objects and assumption IDs are defined before Phase 15 use |
| QA-PROOF-02 | PASS | exact sufficient conditions are stated for every proposition row |
| QA-PROOF-05 | PASS | fixed objects and definition parents are separated from assumptions |
| QA-PROOF-06 | PASS | binary policy uses finite comparisons |
| QA-PROOF-07 | PASS | fixed-price and equilibrium-price operations are distinct |
| QA-PROOF-09 | PASS | CMO fixed-point regularity is explicitly limited to Block D |
| QA-PROOF-10 | PASS | cumulative compile and reference audit pass |
| QA-ECON-01 | PASS | only the institutional route wedge is directly shifted |
| QA-ECON-04 | PASS | equilibrium-price claims remain derived equilibrium statements |
| QA-ECON-05 | PASS | extensions remain quarantined |

## 7. Gate decision

Phase 14 is READY FOR APPROVAL with zero P0. Under `EXEC-GOV-001`, the
zero-P0 gate may be recorded as APPROVED without another routine user prompt,
committed and pushed separately, after the APPROVED-state audit passes.

The next phase is Phase 15: comparative statics and assembly of
`12_full_derivation_draft.tex`. Phase 15 must run all specified boundary cases
and must not split the draft into manuscript candidates.
