# Build and package validation

Validation date: 2026-09-03

Source branch: `codex/mah-model-rebuild`

Source commit: `28da4281cd0d34d8400f997edef18227aef6baf5`

## Result

**PASS.** Both documents were compiled from files inside this package, using
the packaged build scripts, bibliography database, bibliography style, and
appendix modules. No project source outside the package was used.

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
| Final page count | 14 | 38 |

The source bibliography contains 31 entries. The main manuscript and appendix
were built with the complete LaTeX--BibTeX--LaTeX--LaTeX resolution handled by
the packaged scripts.

## Research--development/patent extension checks

| Check | Result |
|---|---:|
| Separate extension module included and imported | PASS |
| Two extension controls excluded from the baseline model/equilibrium | PASS |
| Complete KKT and complementary slackness conditions | PASS |
| Strict-concavity determinant stated and used | PASS |
| Slack-resource comparative statics independently re-derived | PASS |
| Binding-resource comparative statics independently re-derived | PASS |
| Planning-mass derivative reduces to a nonnegative squared term | PASS |
| Patent equation and conditional sign boundary explicit | PASS |
| Binary `M` treated by finite comparison, not differentiation | PASS |
| CMO-price feedback retains one scalar market clearing | PASS |
| Gu (2024) resource-proxy/KKT identification boundary explicit | PASS |
| Original/incremental fixed ranking excluded | PASS |

The constrained-firm patent decline is not assumed. It follows only from a
strict equilibrium increase in commercialization value, a binding resource
ceiling, the development-biased sufficient condition, and a locally
increasing patent-production mapping. Slack resources, a zero net value gain,
a regime switch, a patent-mapping plateau, or failure of the sufficient
condition receive separate zero/ambiguous-result treatment.

## Artifact hashes

| File | SHA256 |
|---|---|
| `formal/mah_route_indicator_friction_model.pdf` | `B33F3D657F4D2DF35ABF8C69BB02D323317725442129EBAD9DFD32A8BE761635` |
| `formal/mah_route_indicator_friction_model_appendix.pdf` | `E3D59195E9125F10CA604AF575CE3C8B1ED6EF757A0F06E41986FC489D28D6AE` |
| `source/manuscript/mah_route_indicator_friction_model.bbl` | `B54FF8F497F5CE3120F57EC0B6938581ABCA252A6C4CFF2EA58EBFF2F0BD6E54` |
| `source/manuscript/mah_route_indicator_friction_model_appendix.bbl` | `402B428CEE4E9DEDC9261801BA786F80E6415F75260E666353F46C220B27D956` |
| `source/manuscript/aer.bst` | `0CC4608704B61DC49D10DA14085D0B54D64ABC8C324370EB68FC8924F92E6EEF` |

The PDFs in `formal/` are byte-identical to the final package-local build
outputs. The included `.bbl` files are byte-identical to the package-local
BibTeX outputs.

## Source and scope checks

- Compared 18 copied project files against active repository sources: three
  build scripts, two TeX wrappers, one BibTeX database, and 12 appendix
  modules.
- SHA256 mismatches among those 18 files: **0**.
- Confirmed the appendix has all 12 required
  `source/model_rebuild/*.tex` inputs, including
  `15_research_development_patent_extension.tex`.
- Confirmed no old technical memo, old lecture notes, execution
  specification, internal audit files, literature PDFs, or prior
  collaboration package is included.
- Package-local `.gitattributes` rules disable Git line-ending conversion for
  every packaged file, preserving manifest bytes across Windows checkouts.
- Package-local LaTeX caches and duplicate `source/output/` files are removed
  after validation. The official PDFs remain in `formal/`, and the scripts can
  reproduce `source/output/` when run.

## Visual inspection

The title/abstract page, all main-text extension pages, the empirical mapping
table, and all appendix extension pages were rendered and inspected. Equation
blocks, theorem headings, table cells, citations, and page breaks are legible
and not clipped.

## Non-blocking environment notices

MiKTeX printed its standard update-reminder message, and Perl reported a
locale fallback from `C.UTF-8` to the Windows system locale. Both builds
exited successfully; neither notice appears as a LaTeX or BibTeX document
error, and neither affected the final checks above.
