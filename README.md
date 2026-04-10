# DANNI workspace

This repository manages the full `D:\working_paper\DANNI` research workspace.

## Current project status

- Benchmark theory source of truth: `output/doc/MAH_Policy.pdf`
- Canonical manuscript source entry: `paper/src/main.tex`
- Canonical planning entry: `research_notes/project_plans/`
- Legacy Phase 1-12 materials: archived at `research_notes/archive_candidates/phase1_12_legacy_2026-04-10/` (kept for traceability, not used as active workflow)

## Top-level structure

- `.codex/`: project-scoped Codex configuration and subagents
- `literatures/`: background papers, slides, and references
- `paper/`: canonical LaTeX manuscript source and build entry
- `output/`: generated outputs (including the benchmark PDF)
- `research_notes/`: working notes, empirical scripts, plan docs, and archives
- `slides_work/`: presentation generation workflow and assets

## Manuscript build

From workspace root:

```powershell
./paper/build.ps1
```

Clean build:

```powershell
./paper/build.ps1 -Clean
```

For standalone TeX notes:

```powershell
./paper/build_tex.ps1 -TexFile "paper/src/<your_note>.tex"
```

Build output is synced to:

- `output/doc/MAH_Policy.pdf`
- `output/doc/*.pdf` for standalone TeX builds via `paper/build_tex.ps1`

## Planning and governance

- Main plan files are maintained under `research_notes/project_plans/`.
- Plan updates are tracked in `research_notes/project_plans/plan_change_log_zh.md`.
- Version-drift control is defined in `research_notes/project_plans/master_version_dictionary_zh.md`.
- The previous Phase 1-12 derivation protocol has been retired and archived.

## Notes on historical materials

- Medium-risk legacy notes were moved to `research_notes/archive_candidates/` for rollback safety.
- Deprecated Phase 1-12 derivation materials (source/output/build artifacts and old protocol plan) are consolidated in `research_notes/archive_candidates/phase1_12_legacy_2026-04-10/`.
- The old standalone Git metadata from `research_notes/.git` was preserved under `.repo_backup/` and is ignored by the root repository.
