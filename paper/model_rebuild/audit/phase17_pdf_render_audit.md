# Phase 17 PDF Render Audit

Date: 2026-09-01

Source PDF:
`paper/model_rebuild/audit/build_phase17/14_appendix_model_candidate.pdf`

Method: Poppler rendered the selected pages at 144 dpi into
`paper/model_rebuild/tmp/pdfs/phase17/`. Each image was inspected at original
resolution after the clean, stable MiKTeX build.

| Page | Audit target | Result |
|---:|---|---|
| 4 | common route-label domain; effective pre-MAH exclusion through the infinite wedge; v1.2 definition of `x_i` | PASS -- notation and prose are complete, legible, and not clipped |
| 7 | frozen `varphi in [0,1)` domain and the `varphi` approaching one limiting check | PASS -- open upper endpoint and limiting language render correctly |
| 24 | comparative-statics sufficient conditions with the same `varphi` domain | PASS -- definition and derivatives are legible with no overlap |
| 31 | patent/upstream-research boundary and unique `tau_E(M)` policy-channel wording | PASS -- evidence boundary, equation, and footnote render correctly |

Visual defects found: 0.

The rendered PNG files are temporary, ignored build evidence. The durable
evidence is this audit record, the compiled PDF, and the warning-free final
LaTeX log.
