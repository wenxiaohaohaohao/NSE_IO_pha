# Phase 17 P1 Correction Ledger

Date: 2026-09-01

All items below were found during independent Phase 17 review. None changes a
primitive, control, proposition, equilibrium closure, or approved empirical
result. Each was corrected before the gate audit.

| ID | Finding | Correction | Verification |
|---|---|---|---|
| `P17-C01` | `01_primitives_and_timing.tex` encoded pre-MAH `E` unavailability both through a regime-dependent route domain and through `tau_E(0)=+infinity` | fixed the label domain at `{I,E,T,A}` and encoded effective availability solely through the infinite/finite wedge; aligned the dependency map | `M -> tau_E(M)` is now the only direct arrow; `W_i^E=-infinity` at `M=0` |
| `P17-C02` | Appendix evidence prose treated patent outcomes as direct upstream-research evidence | narrowed the conclusion to divergence between clinical-trial and patenting margins | primary-source claim boundary preserved |
| `P17-C03` | Authorized Shi Gu wording broadened trial registrations to generic clinical development | changed it to clinical-trial registrations | matches Tables II and VIII |
| `P17-C04` | Resource-heterogeneity evidence was said to require a binding financial constraint | clarified that a financing/allocation extension may explain the pattern, but the evidence neither identifies nor requires that structure | baseline remains mechanism-agnostic |
| `P17-C05` | The pricing module, comparative statics, symbol ledger, and main candidate used `varphi in [0,1]`, conflicting with the frozen effective specification | aligned every active definition to `varphi in [0,1)` and rewrote `varphi=1` as a limiting check | effective specification line 1816 and all active files now agree; `1-beta varphi>0` remains strict |
| `P17-C06` | Initial occurrence catalog omitted `10_empirical_mapping.tex` and the full-draft container | added both formal surfaces | regenerated catalog has 1,489 rows |
| `P17-C07` | Initial compiler accepted a two-pass run even if cross-reference rerun warnings remained and did not match hyphenated duplicate-label wording | compile from a verified clean build directory until stable, at most five passes; check both duplicate-label wordings and all rerun/undefined warnings | main 2 passes; appendix 3; full draft 3; final logs clean |
| `P17-C08` | Symbol and dependency ledgers had stale phase-status headings | updated their status to Phase 17 in progress and the active registry through Phase 16 | note-layer status now matches the phase machine |
| `P17-C09` | The appendix placed a binding-finance phrase immediately after the pure-researcher transition result, allowing an unintended mechanism inference | separated the entry interpretation from possible financing/allocation extensions and stated that the evidence neither identifies nor requires a binding constraint | Table IX transition and resource-heterogeneity mechanisms now have distinct boundaries |
| `P17-C10` | The dependency map and appendix opening retained wording that could be read as legal availability plus the institutional wedge being two policy channels | rewrote both locations so the infinite/finite value of `tau_E(M)` itself encodes effective availability | all active policy-channel statements now have the single direct arrow `M -> tau_E(M)` |
| `P17-C11` | Mathematical symbols in eleven empirical-interface headings generated `hyperref` PDF-string warnings in the full draft | wrapped only those title symbols in `texorpdfstring` with plain-text bookmark alternatives and made the compiler reject any recurrence | final logs for all three candidates contain zero PDF-string, reference, label, or box warnings |
| `P17-C12` | The patent interface still called applications an upstream-research proxy, stronger than the Phase 9 and appendix evidence boundary | reclassified applications as a patenting-side signal that may reflect but does not directly observe or identify upstream research | Phase 9, Phase 10, appendix, and Shi Gu evidence note now use the same construct-validity boundary |

Severity after correction:

- open P0: 0
- open P1: 0
- architecture change: NO
- re-audit required: YES, completed through the Phase 17 automated and manual
  gates
