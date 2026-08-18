# Model Notes for Codex: MAH Route-Choice Model Closure

## Purpose

This directory is the model-design control panel for the MAH paper. It prevents future edits from changing timing, closure, calibration meaning, or claim scope without an explicit decision.

## Source of truth

Always read the current working-tree versions of:

1. paper/manuscript/mah_route_indicator_friction_model.tex
2. paper/manuscript/mah_route_indicator_friction_model_appendix.tex

These manuscript files are authoritative. The numbered notes summarize and audit them. COMBINED_model_closure_notes_for_codex.md is generated output and must not be edited directly.

## Non-negotiable baseline

- The model is partial equilibrium and closes only the qualified CMO support market.
- \(M\in\{0,1\}\) changes the route set. \(\eta\in[0,1]\) supplies continuous post-MAH comparative statics.
- The equilibrium support cost is \(p_m^*(M,\eta)\).
- \(a_i x_i\) is route-planning-stage project arrival, not successful or approved output.
- Retained realization satisfies \(\zeta_i^r=s_i\chi_i^r\).
- \(q_i^E\) is technical and regulatory eligibility, not an already secured producer match.
- CMO demand is \(D_m^B+\int a_i x_i^*P_i(E)dH_i\); it excludes final realization.
- CMO regularity gives existence and uniqueness; the IFT gives \(dp_m^*/d\eta\).
- The observed holder--producer split is an aggregate realized-weighted ratio.
- Log odds are valid only in a homogeneous or sufficiently narrow two-route \(I\)-\(E\) cell and include \(\log(\zeta_i^E/\zeta_i^I)\).
- The Bellman stock transition is a conditional expectation and \(\beta\in(0,1)\).
- Jia et al. are the approval-delay/review-capacity alternative. Barwick et al. are the demand/market-size alternative.

## File responsibilities

| File | Role |
|---|---|
| 00_model_closure_status.md | One-page baseline status and claim boundary |
| 01_symbols_and_objects.md | Canonical symbol dictionary and identification status |
| 02_equation_dependency_map.md | Solve order and upstream/downstream equation dependencies |
| 03_assumptions_and_scope.md | Maintained assumptions, exclusions, and extension boundary |
| 04_comparative_statics_checklist.md | Finite route-set and continuous implementation sign checks |
| 05_calibration_mapping.md | Data moments, model counterparts, and normalization rules |
| 06_bellman_accounting.md | Timing, retained-stock transition, and no-double-counting rules |
| 07_revision_decision_log.md | Current model decisions and reasons |
| 08_model_closure_audit.md | Pass/fail closure checklist |
| 09_file_layering_rules.md | Main-text, appendix, and note-layer responsibilities |
| 10_main_appendix_consistency_audit.md | Cross-file equation and claim consistency |
| 11_proposition_dependency_audit.md | Assumptions required by each theoretical result |
| 12_calibration_claim_audit.md | Valid and invalid calibration interpretations |
| rebuild_combined.ps1 | Deterministic combined-note generator |
| COMBINED_model_closure_notes_for_codex.md | Generated concatenation of numbered notes |

## Required workflow

1. Read both authoritative manuscript files.
2. Read 00, 01, 02, and 03 before proposing a model change.
3. Use 04, 06, and 11 before changing a theoretical result.
4. Use 05 and 12 before changing a calibration statement.
5. Update only the relevant numbered source notes.
6. Run:

   powershell -ExecutionPolicy Bypass -File research_notes/model_notes/rebuild_combined.ps1

7. Rerun the old-notation and claim-boundary scans.
8. Confirm that no unrelated path changed.

## Combined-file rule

The rebuild script concatenates 00 through 12 in fixed filename order, including the unchanged layering rules in 09. It normalizes line endings, writes UTF-8 without a BOM, and adds no timestamp. Identical source notes therefore produce identical combined output.
