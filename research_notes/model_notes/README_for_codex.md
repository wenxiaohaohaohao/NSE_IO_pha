# Model Notes for Codex: MAH Route-Choice Model Closure

## Purpose

This folder is the model-closure control panel for the MAH paper. It is not the main manuscript and not the formal appendix. Do **not** scatter unstable derivations directly into the main text.

The current target is **not** a full GE model, **not** a full free-entry model, and **not** a full Hopenhayn/Klette--Kortum dynamic industry model.

The target is:

\[
\boxed{\text{partial-equilibrium dynamic route-choice model}+\text{CMO service-market closure}+\text{composite route-realization value}+\text{Bellman payoff accounting}}
\]

## File layering

The complete model is supported by three layers:

| Layer | Location | Role |
|---|---|---|
| Main text | `paper/manuscript/mah_route_indicator_friction_model.tex` | Short reader-facing model statement and paper argument. |
| Technical appendix | `paper/manuscript/mah_route_indicator_friction_model_appendix.tex` | Formal derivations, object-status audit, proof details, CMO closure, and calibration boundaries. |
| Model notes | `research_notes/model_notes/` | Model-design control panel for Codex and the author. |

## Required workflow

1. Put new model ideas in `research_notes/model_notes/` first.
2. Check primitives, composite objects, equation dependencies, Bellman accounting, and claim boundaries.
3. Promote only stable formal derivations to the technical appendix.
4. Promote only the minimal reader-facing version needed for the paper's central claim to the main text.
5. Codex should make local, section-specific edits only. Do not ask Codex to rewrite the entire manuscript from all reviews at once.

## Files

| File | Purpose |
|---|---|
| `00_model_closure_status.md` | Master control file: what is closed, what is not closed, and what the baseline model is. |
| `01_symbols_and_objects.md` | Symbol dictionary: primitive vs derived vs composite vs data counterpart. |
| `02_equation_dependency_map.md` | Equation dependency chain: CMO market, route value, route choice, R&D, output. |
| `03_assumptions_and_scope.md` | Scope restrictions and explicit non-goals. |
| `04_comparative_statics_checklist.md` | Checks each proposition/comparative static must pass. |
| `05_calibration_mapping.md` | What moments discipline what composite objects; what cannot be separately identified. |
| `06_bellman_accounting.md` | Payoff accounting rules to avoid double counting \(R\), \(v\), \(b^r\), and \(\pi n\). |
| `07_revision_decision_log.md` | Final decisions on disputed review issues. |
| `08_model_closure_audit.md` | Final pre-edit audit table: object status, equation chain, claim boundaries, and minimal reality mechanisms. |
| `09_file_layering_rules.md` | Rules for separating main text, technical appendix, and model notes. |
| `10_main_appendix_consistency_audit.md` | Audit record for consistency between the reader-facing main text, the technical appendix, and the model notes. |
| `11_proposition_dependency_audit.md` | Audit record checking that each proposition depends only on closed, exogenous, composite, or explicitly optional objects. |
| `12_calibration_claim_audit.md` | Audit record checking that calibration moments discipline only composite objects unless additional data justify stronger identification. |

## Core instruction for Codex

Before modifying the main `.tex`, check whether the proposed edit is consistent with:

1. `00_model_closure_status.md`
2. `01_symbols_and_objects.md`
3. `02_equation_dependency_map.md`
4. `06_bellman_accounting.md`
5. `07_revision_decision_log.md`
6. `08_model_closure_audit.md`
7. `09_file_layering_rules.md`
8. `10_main_appendix_consistency_audit.md`
9. `11_proposition_dependency_audit.md`
10. `12_calibration_claim_audit.md`

If not consistent, do not edit the manuscript. Update the notes first.
