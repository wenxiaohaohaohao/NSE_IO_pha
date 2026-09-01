# Build and package validation

Validation date: 2026-09-01

Source branch: `codex/mah-model-rebuild`

Source commit: `8a99cc3bcebd51b5db025550a201e0eec273a8f0`

## Result

**PASS.** Both documents were compiled from the files inside this package, using the packaged build scripts, bibliography database, bibliography style, and appendix modules. No project source outside the package was used.

## Compilation checks

| Check | Main manuscript | Technical Appendix |
|---|---:|---:|
| Package-local build completed | PASS | PASS |
| Final LaTeX log: fatal/error hits | 0 | 0 |
| Final LaTeX log: undefined citation/reference hits | 0 | 0 |
| Final LaTeX log: duplicate-label/rerun/overfull/underfull hits | 0 | 0 |
| BibTeX warning/error hits | 0 | 0 |
| Project inputs read outside package | 0 | 0 |
| Title found on first PDF page | PASS | PASS |
| Final page count | 12 | 32 |

The source bibliography contains 31 entries. The main manuscript and appendix were built with the complete LaTeX–BibTeX–LaTeX–LaTeX resolution handled by the packaged scripts.

## Artifact hashes

| File | SHA256 |
|---|---|
| `formal/mah_route_indicator_friction_model.pdf` | `0EAA062D84142713C53077BFA8F15BBA22DD1390530A0A2D0AB25741D402A1E9` |
| `formal/mah_route_indicator_friction_model_appendix.pdf` | `45CD8F1A05A7BF8636FC4B5011146781AD89EA2BD1E7FCDBD44489D66E212C47` |
| `source/manuscript/mah_route_indicator_friction_model.bbl` | `B54FF8F497F5CE3120F57EC0B6938581ABCA252A6C4CFF2EA58EBFF2F0BD6E54` |
| `source/manuscript/mah_route_indicator_friction_model_appendix.bbl` | `402B428CEE4E9DEDC9261801BA786F80E6415F75260E666353F46C220B27D956` |
| `source/manuscript/aer.bst` | `0CC4608704B61DC49D10DA14085D0B54D64ABC8C324370EB68FC8924F92E6EEF` |

The PDFs in `formal/` are byte-identical to the final package-local build outputs. The two included `.bbl` files are byte-identical to the package-local BibTeX outputs.

## Source and scope checks

- Compared 17 copied project files against the active repository sources: 3 build scripts, 2 TeX wrappers, 1 BibTeX database, and 11 appendix modules.
- SHA256 mismatches among those 17 files: **0**.
- Confirmed the appendix has all 11 required `source/model_rebuild/*.tex` inputs.
- Confirmed no old technical memo, old lecture notes, execution specification, internal audit files, literature PDFs, or prior collaboration package is included.
- Added package-local `.gitattributes` rules that disable Git line-ending conversion for every packaged file, preserving the manifest bytes across Windows checkouts.
- Removed package-local LaTeX caches and duplicate `source/output/` files after validation. The official PDFs remain in `formal/`, and the scripts can reproduce `source/output/` when run.

## Non-blocking environment notices

MiKTeX printed its standard update-reminder message, and Perl reported a locale fallback from `C.UTF-8` to the Windows system locale. Both builds exited successfully; neither notice appears as a LaTeX or BibTeX document error, and neither affected the final checks above.
