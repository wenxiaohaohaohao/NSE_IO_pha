# 00 Model Rebuild Closure Status

## Specification checkpoint

- Branch: `codex/mah-model-rebuild`
- Locked base commit: `cd5b6e49608749e0bf32f3d9aa235a84f378347b`
- Effective specification: `paper/model_rebuild/spec/MAH_model_rebuild_effective_spec_v1.2.md`
- Effective specification SHA256: `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`
- Specification status: `APPROVED`
- Specification approved to commit/push: `Yes`
- Phase 1 authorized: `Yes`
- User approval recorded: `2026-08-30T13:11:40.9653412+08:00`
- Current P0 issues: `None`
- Deferred evidence issue: detailed Shi Gu claims remain `UNVERIFIED` and block Phase 16/18 claims if unresolved

## Phase state machine

Legal transition:

`NOT STARTED -> IN PROGRESS -> AUDIT FAILED / READY FOR APPROVAL -> APPROVED`

`APPROVED` requires either phase-specific user approval or the user's standing authorization for a zero-P0 gate. A P0 finding, locked-architecture change, unresolved phase-blocking evidence problem, or requested manuscript-scope expansion always suspends that standing authorization and requires a new user decision.

## Execution authorization

- Governance decision: `EXEC-GOV-001`
- Recorded: `2026-08-30T17:38:13.5981404+08:00`
- Phase 1 gate: explicitly approved by the user.
- Phase 2 through Phase 18: the user authorized continuous rigorous execution. Every internal preflight, derivation review, automated audit, compile check, gate report, separate commit and push remains mandatory.
- Routine zero-P0 gates: record `APPROVED` under the standing authorization and continue without another prompt.
- Mandatory pause: any P0 issue, change to locked architecture, unresolved evidence that blocks the current phase, or expansion beyond the approved manuscript-integration scope.

| Phase | Status | Main output | P0 issue | Approved to continue? |
|---|---|---|---|---|
| 1 Objects/timing | APPROVED | `01_primitives_and_timing.tex` | — | Yes — explicit Phase 1 approval |
| 2 Demand/profit | APPROVED | `02_demand_profit_derivation.tex` | — | Yes — `EXEC-GOV-001`, zero P0 |
| 3 Technologies | APPROVED | `03_internal_external_technologies.tex` | — | Yes — `EXEC-GOV-001`, zero P0 |
| 4 Routes/sorting | NOT STARTED | `04_route_values_and_sorting.tex` | — | No |
| 5 Project advancement | NOT STARTED | `05_rd_problem.tex` | — | No |
| 6 CMO equilibrium | NOT STARTED | `06_cmo_supply_demand_equilibrium.tex` | — | No |
| 7 Equilibrium definition | NOT STARTED | `07_equilibrium_definition.tex` | — | No |
| 8 Six propositions + corollary | NOT STARTED | proposition checklist/modules | — | No |
| 9 Outcomes/data boundary | NOT STARTED | `09_observed_outcomes.tex` | — | No |
| 10 Empirical mapping | NOT STARTED | `10_empirical_mapping.tex` | — | No |
| 11 Extensions | NOT STARTED | `11_extensions_not_baseline.tex` | — | No |
| 12 Old-to-new crosswalk | NOT STARTED | `05_old_to_new_model_crosswalk.md` | — | No |
| 13 Equation dependency map | NOT STARTED | `02_equation_dependency_map.md` | — | No |
| 14 Assumption discipline | NOT STARTED | `03_assumptions_and_scope.md` | — | No |
| 15 Comparative statics/full draft | NOT STARTED | `08_comparative_statics.tex`; `12_full_derivation_draft.tex` | — | No |
| 16 Main/appendix candidates | NOT STARTED | `13_main_text_model_candidate.tex`; `14_appendix_model_candidate.tex` | — | No |
| 17 Consistency audit | NOT STARTED | `07_consistency_audit.md` | — | No |
| 18 Manuscript integration | BLOCKED | manuscript and final build | — | No |

## Scope protection

- `paper/manuscript/` remains byte-identical to the locked base until Phase 18 approval.
- The original checkout's modified collaborator ZIP is outside this worktree and must never enter this branch.
- Phase 1 began after the approved specification commit was pushed. Phase 2 and subsequent phases are authorized under `EXEC-GOV-001`, subject to their full internal gates and mandatory-pause conditions.
