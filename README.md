# DANNI workspace

This repository manages the full `D:\working_paper\DANNI` research workspace.

## Current project status

- Benchmark theory source of truth: `output/doc/MAH_Policy.pdf`
- Canonical manuscript source entry: `paper/src/main.tex`
- Canonical planning entry: `research_notes/project_plans/`

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

Build output is synced to:

- `output/doc/MAH_Policy.pdf`

## Planning and governance

- Main plan files are maintained under `research_notes/project_plans/`.
- Plan updates are tracked in `research_notes/project_plans/plan_change_log_zh.md`.
- Version-drift control is defined in `research_notes/project_plans/master_version_dictionary_zh.md`.

## Notes on historical materials

- Medium-risk legacy notes were moved to `research_notes/archive_candidates/` for rollback safety.
- The old standalone Git metadata from `research_notes/.git` was preserved under `.repo_backup/` and is ignored by the root repository.
