# Paper Source and Build Entry

This directory is the canonical manuscript source tree.

Legacy Phase 1-12 derivation files are archived at `research_notes/archive_candidates/phase1_12_legacy_2026-04-10/` and are not part of the active manuscript workflow.

## Layout

- `src/main.tex`: main manuscript source.
- `bib/`: bibliography files (if moved out of embedded references later).
- `figs/`: figure sources and exported figures.
- `build/`: local LaTeX build artifacts.
- `build.ps1`: build entry script.

## Build

From workspace root:

```powershell
./paper/build.ps1
```

Optional clean build:

```powershell
./paper/build.ps1 -Clean
```

Build any standalone TeX file and sync PDF to `output/doc/`:

```powershell
./paper/build_tex.ps1 -TexFile "paper/src/mah_bellman_state_variable_note.tex"
```

Optional output filename:

```powershell
./paper/build_tex.ps1 -TexFile "paper/src/mah_bellman_state_variable_note.tex" -OutputName "mah_bellman_state_variable_note"
```

The build script automatically checks MiKTeX under `D:\application\miktex` first, then falls back to tools available in `PATH`.

## Sync rule

- Edit source only in `paper/src/main.tex`.
- The generated PDF is synced to `output/doc/MAH_Policy.pdf` by the build script.
- For standalone notes, use `paper/build_tex.ps1`; generated PDF is synced to `output/doc/`.
- Do not edit the synced PDF manually.
