# Model Rebuild Workspace

Independent workspace for the MAH model rebuild. Governed by
`paper/spec/MAH_model_rebuild_execution_note_for_Codex.md` +
`paper/spec/MAH_model_rebuild_amendment_v1.1_for_Codex.md` (frozen, verbatim,
hashes in `paper/spec/00_spec_manifest.md`).

- `paper/manuscript/` — **the real, pre-existing manuscript** (found on
  `review-model@cd5b6e4`), read-only until Phase 18. See
  `paper/spec/00_spec_manifest.md` for why this, and not any PDF handed
  over separately, is the canonical current model.
- `paper/model_rebuild/` — derivation modules (`.tex`), one per phase.
- `paper/model_notes/` — status, symbols, dependency map, assumptions,
  crosswalk, open issues, consistency audit.
- `paper/spec/` — frozen spec sources + manifest + reference-only material.
- `research_notes/model_notes/` — pre-existing notes documenting the
  *old* model (the one being replaced). Left untouched; used as crosswalk
  reference (Phase 12), not as part of this workspace.

Status, phase gates, and approvals: see `paper/model_notes/00_model_closure_status.md`.
Requirement-by-requirement tracking: see `paper/model_notes/09_instruction_traceability_matrix.md`.

Branch: `codex/mah-model-rebuild`, based at `review-model@cd5b6e4` (the
commit the spec names). Each phase pauses for explicit user approval
before the next phase begins. Only approved phases are committed.
