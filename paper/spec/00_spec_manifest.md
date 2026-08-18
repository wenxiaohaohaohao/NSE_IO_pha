# Spec Manifest — Frozen Source Documents

These files are copied **verbatim** and must not be edited. Any change to
the project spec must arrive as a new amendment file, never as an in-place
edit of the files below.

**Revision note:** this manifest replaces an earlier version written
before `codex/mah-model-rebuild` was correctly based. See
`paper/model_notes/06_open_issues_log.md` OI-01/OI-02 for the full
correction history; summary at the bottom of this file.

| File | Source path (as provided) | Size | Source mtime | SHA-256 |
|---|---|---|---|---|
| `MAH_model_rebuild_execution_note_for_Codex.md` | `/Users/fangyi/Downloads/MAH_model_rebuild_execution_note_for_Codex.md` | 38,122 bytes | 2026-08-18 11:00:45 | `f6c11377d71e4e25d40ffb8ac9fe2ea7aa051ad7e123ba7e3a32dba895342b24` |
| `MAH_model_rebuild_amendment_v1.1_for_Codex.md` | `/Users/fangyi/Downloads/MAH_model_rebuild_amendment_v1.1_for_Codex.md` | 22,008 bytes | 2026-08-18 11:00:39 | `d76856241e460d31087ab60690e85d5681806e53bd42991f725458727ccd1ea9` |

**Effective spec = execution note + amendment v1.1**, read together per
amendment Section 5 ("Instruction to Codex"): the amendment changes only
the sections it names; everything else in the execution note stands as
written.

## Canonical current manuscript (read-only until Phase 18, RL-15)

The real, already-committed manuscript source, found on branch
`review-model` at commit `cd5b6e4` (the exact base commit the execution
note names):

| File | SHA-256 (at branch point) |
|---|---|
| `paper/manuscript/mah_route_indicator_friction_model.tex` | `e467501b17ae58ae3f7fbc22af44ffd18b5abeaaeab855737bed28820a221eb9` |
| `paper/manuscript/mah_route_indicator_friction_model_appendix.tex` | `09441c737408a24386bbdbaa3a1ec81b6b33097db9c7e779321d8b2c5e43e1a9` |
| `paper/manuscript/mah_route_indicator_friction_model_technical_memo.tex` | `099c5075c235125171536e7baca3d0350f55aa289d09cd8c006b950951b7dff9` |
| `paper/manuscript/mah_route_indicator_friction_refs.bib` | `2cba6f443dc204b534055ba4f56bc00c76b6f1ebb5601e154f04827f34e70227` |

This `.tex` source matches the execution note's premise closely: it uses
$\eta\in[0,1]$ (continuous post-MAH implementation intensity), a logit
route-choice model, and an inclusive value $\Gamma_i(M,\eta,p_m)$ — the
exact objects red lines RL-12 and RL-13 target for baseline removal, and
the exact objects the note's own §17 crosswalk table names
($R_i^{event}$, $\bar R_i^E$, $\zeta_i^E$, logit $P_i(r)$, $\Gamma_i$,
$\eta$, quadratic R&D cost $C_i^R(x_i)=\frac{\kappa}{2}x_i^2$, etc., all
present verbatim). This is the manuscript Phase 12 (crosswalk) and Phase
18 (integration) target — **not** the PDF below.

There is also a pre-existing, parallel note system at
`research_notes/model_notes/` (files `00`–`12` plus a combined-notes
generator) documenting this same old model. It is **prior art / crosswalk
reference only** — its own README states it governs
`paper/manuscript/mah_route_indicator_friction_model.tex` directly and is
not part of the new `paper/model_rebuild/` + `paper/model_notes/`
structure this spec calls for. Left untouched.

## Reference-only material (not authoritative)

| File | Source path | SHA-256 | Status |
|---|---|---|---|
| `reference_only/new-2_target_draft_unverified.pdf` | `/Users/fangyi/Downloads/new-2.pdf` | `febd3e99fa492559d9db102f2c664a32bdae66b2d31398614383d93f24c0e136` | Shares the manuscript's title but has none of $\eta$/$\Gamma$/logit. Per user confirmation, this is understood to be a target/draft output of `paper/MAH_model_revision_plan_for_codex.md` (a different, earlier revision plan than the current spec), produced elsewhere and never committed to this repo. **Not used as a source of truth for any phase.** Kept only as background context on where the paper's thinking has been. |

## Correction history

An earlier session attempt initialized a **fresh, disconnected git repo**
in this directory (no `origin` remote was known at the time) and built
Phase 1–2 on a fabricated empty root, treating `new-2.pdf` as the current
manuscript. Once the real remote
(`https://github.com/wenxiaohaohaohao/NSE_IO_pha`) was provided, fetching
it revealed `review-model` branch at `cd5b6e4` — exactly the commit this
spec names — carrying the real manuscript, `research_notes/`, and prior
history. The disconnected branch was tagged
`archive/codex-mah-model-rebuild-orphaned-attempt` for audit trail and
deleted; `codex/mah-model-rebuild` was recreated from `review-model@cd5b6e4`
per the spec's actual instruction, and Phase 1–2 derivation content
(which did not depend on manuscript specifics and remains spec-compliant)
was replayed onto the correct base, with the Phase 2 crosswalk note
corrected to point at the real legacy objects. Full detail in
`paper/model_notes/06_open_issues_log.md` (OI-01, OI-02).
