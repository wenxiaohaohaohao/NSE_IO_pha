# Paper Source and Build Entry

This directory is the canonical manuscript source tree.

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

The build script automatically checks MiKTeX under `D:\application\miktex` first, then falls back to tools available in `PATH`.

## Sync rule

- Edit source only in `paper/src/main.tex`.
- The generated PDF is synced to `output/doc/MAH_Policy.pdf` by the build script.
- Do not edit the synced PDF manually.
