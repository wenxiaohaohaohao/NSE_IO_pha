# Post-Phase 18 Title-Only Update Audit

Date: 2026-09-01  
Base commit: `eb7013b5211f72dd2e4be25e839e39222f98cf33`

## Requested title

`Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform`

## Authorized change

The active main manuscript uses the requested title exactly. The active
technical appendix uses the same paper title with the reader-facing prefix
`Technical Appendix:`. File names remain unchanged.

The source edit is limited to the two `\title{...}` commands in:

- `paper/manuscript/mah_route_indicator_friction_model.tex`;
- `paper/manuscript/mah_route_indicator_friction_model_appendix.tex`.

No abstract, model primitive, equation, proof, proposition, empirical claim,
bibliography entry, technical memo, frozen source, or Phase 18 backup changed.

## Verification

- Exact requested title in active main source: PASS.
- Exact requested title after `Technical Appendix:` in active appendix source:
  PASS.
- Previous active title absent from both active sources: PASS.
- Main build through `paper/build.ps1`: PASS; 12 pages.
- Appendix build through `paper/build_appendix.ps1`: PASS; 32 pages.
- Final logs: zero fatal errors, undefined references/citations,
  multiply-defined labels, rerun requests, or overfull/underfull boxes.
- Rendered main title page: PASS; balanced two-line title, no clipping.
- Rendered appendix title page: PASS; balanced two-line title, no clipping.
- Temporary rendered PNGs remain project-local and are excluded from the
  commit.

## Artifact-hash treatment

`phase18_artifact_hashes.md` now reports the current hashes for the two active
sources and two final PDFs. The original Phase 18 closeout hashes remain
recoverable at base commit `eb7013b`.

## Result

PASS -- title-only change; no model or evidence-boundary change.
