# Model Notes for Codex: MAH Route-Choice Model Closure

## Purpose

This folder is the model-closure control panel for the MAH paper. The main LaTeX manuscript should remain a single compilable file while the model is still being stabilized. Do **not** scatter unstable derivations directly into the main text.

The current target is **not** a full GE model, **not** a full free-entry model, and **not** a full Hopenhayn/Klette--Kortum dynamic industry model.

The target is:

\[
\boxed{\text{partial-equilibrium dynamic route-choice model}+\text{CMO service-market closure}+\text{composite route-realization value}+\text{Bellman payoff accounting}}
\]

## Required workflow

1. Freeze the current main `.tex` and `.pdf` in `archive/`.
2. Use these notes to lock primitives, composite objects, and equation dependencies.
3. Only after the notes are internally consistent, update the main manuscript.
4. Codex should make local, section-specific edits only. Do not ask Codex to rewrite the entire manuscript from all reviews at once.

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

## Core instruction for Codex

Before modifying the main `.tex`, check whether the proposed edit is consistent with:

1. `00_model_closure_status.md`
2. `01_symbols_and_objects.md`
3. `02_equation_dependency_map.md`
4. `06_bellman_accounting.md`
5. `07_revision_decision_log.md`

If not consistent, do not edit the manuscript. Update the notes first.
