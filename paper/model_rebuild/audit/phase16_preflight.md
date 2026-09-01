# Phase 16 Preflight

Date: 2026-09-01

## Entry state

- Branch: `codex/mah-model-rebuild`
- Locked base: `cd5b6e49608749e0bf32f3d9aa235a84f378347b`
- Phase 15 commit: `a181ff874a53371d2dfc775e0df2cb60b409641c`
- Phase 15 local/remote equality: PASS
- Effective specification SHA256:
  `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`
- Worktree state before Phase 16 evidence intake: clean
- Phase 15 status: `APPROVED` under `EXEC-GOV-001`
- Phase 16 entry condition (approved full derivation draft): PASS
- Phase 17 status at entry: `NOT STARTED`
- Manuscript diff from locked base: none
- Collaborator ZIP in the rebuild worktree or Phase 15 commit: absent

## Material reread

The following controlling material was reread before writing Phase 16 outputs:

1. effective specification, Phase 16 and the Shi Gu evidence checkpoint;
2. all 28 absolute red lines;
3. `01_symbols_and_objects.md`;
4. `03_assumptions_and_scope.md`;
5. `02_equation_dependency_map.md`;
6. `06_open_issues_log.md`;
7. the approved `12_full_derivation_draft.tex` and its input modules;
8. the current manuscript only as a read-only conflict-audit target.

## Authorized scope

Phase 16 may create only:

- `13_main_text_model_candidate.tex`;
- `14_appendix_model_candidate.tex`;
- `paper/model_notes/08_shigu_empirical_boundary_check.md`;
- Phase 16 provenance, split-ledger, compilation, audit, and gate records.

The candidates must be a restrained split of the approved Phase 15 draft.
They may not introduce a new baseline mechanism, alter any approved primitive,
or modify `paper/manuscript/`.

## Evidence gate

The user identified `D:\所有下载内容\ssrn-4770849 (1).pdf` as the relevant
Shi Gu paper. A byte-identical copy was placed in the local D-drive worktree
for page/table verification. The source is the August 22, 2024, 74-page
version. Its SHA256 is:

`A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB`.

The binary and extracted full text are ignored by Git. Only provenance,
page/table verdicts, and short paraphrases may enter the Phase 16 commit.

## Preflight gate

| Check | Result |
|---|---|
| Effective-spec hash matches the approved hash | PASS |
| Phase 15 is approved, committed, pushed, and remote-synchronized | PASS |
| Full derivation draft exists and compiled in Phase 15 | PASS |
| Phase 16 source PDF is identified and byte-frozen locally | PASS |
| 28 red lines, symbols, assumptions, dependency map, and issues reread | PASS |
| Phase 16 output scope is bounded | PASS |
| Manuscript remains byte-identical to the locked base | PASS |
| No locked architecture change is requested | PASS |
| P0 issue at preflight | NONE |

Preflight verdict: PASS. Phase 16 may proceed to the page/table evidence
check and approved-draft split.
