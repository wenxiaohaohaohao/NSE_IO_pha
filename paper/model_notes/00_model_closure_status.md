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
- Shi Gu evidence checkpoint: resolved from the user-identified August 22,
  2024 PDF; the two cross-class comparisons retain a no-equality-test
  precision limit

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
| 4 Routes/sorting | APPROVED | `04_route_values_and_sorting.tex` | `audit/phase04_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 5 Project advancement | APPROVED | `05_rd_problem.tex` | `audit/phase05_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 6 CMO equilibrium | APPROVED | `06_cmo_supply_demand_equilibrium.tex` | `audit/phase06_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 7 Equilibrium definition | APPROVED | `07_equilibrium_definition.tex` | `audit/phase07_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 8 Six propositions + corollary | APPROVED | `08_required_propositions.tex`; proposition checklist | `audit/phase08_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 9 Outcomes/data boundary | APPROVED | `09_observed_outcomes.tex` | `audit/phase09_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 10 Empirical mapping | APPROVED | `10_empirical_mapping.tex` | `audit/phase10_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 11 Extensions | APPROVED | `11_extensions_not_baseline.tex` | `audit/phase11_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 12 Old-to-new crosswalk | APPROVED | `05_old_to_new_model_crosswalk.md` | `audit/phase12_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 13 Equation dependency map | APPROVED | `02_equation_dependency_map.md` | `audit/phase13_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 14 Assumption discipline | APPROVED | `03_assumptions_and_scope.md` | `audit/phase14_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 15 Comparative statics/full draft | APPROVED | `08_comparative_statics.tex`; `12_full_derivation_draft.tex` | `audit/phase15_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 16 Main/appendix candidates | APPROVED | `13_main_text_model_candidate.tex`; `14_appendix_model_candidate.tex` | `audit/phase16_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0 |
| 17 Consistency audit | APPROVED | `07_consistency_audit.md` | `audit/phase17_gate_report.md` | Yes — `EXEC-GOV-001`, zero P0; Phase 18 requires separate explicit approval |
| 18 Manuscript integration | APPROVED | manuscript and final build | `audit/phase18_gate_report.md` | Yes — explicit Phase 18 approval; zero P0/P1 |

## Scope protection

- `paper/manuscript/` was byte-identical to the locked base through the
  Phase 18 approval checkpoint. A verified pre-integration backup now permits
  the bounded manuscript changes specified for Phase 18.
- The original checkout's modified collaborator ZIP is outside this worktree and must never enter this branch.
- Phase 1 began after the approved specification commit was pushed. Phase 2 and subsequent phases are authorized under `EXEC-GOV-001`, subject to their full internal gates and mandatory-pause conditions.
