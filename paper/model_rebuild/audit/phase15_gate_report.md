# Phase 15 Gate Report

- Phase: 15 - Comparative Statics and Full Derivation Draft
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: 90cb8b867209f3776d14571544c8a29a70632a03
- Overall gate: PASS
- P0: 0
- P1 open: 0
- P1 corrected in phase: 1

The corrected P1 was a proof sentence in Phase 8. The total
\(\Delta_{IE,k}\) was already correctly positive, but its operating-cost
component is only weakly positive when \(s(q)=0\); strictness comes from the
setup-cost component. The proposition, architecture and sign conclusion did
not change.

## 1. Comparative-static coverage

| Result group | Differentiated/compared object | Price treatment | Result |
|---|---|---|---|
| Commercial return | \(p^*,\pi,R\) | conditional product price; no CMO equilibrium change | PASS |
| Commercialization route | \(\Delta_{IE},k^*,W_i^1-W_i^0\) | fixed candidate \(p_m\) and finite wedge | PASS |
| Project advancement | \(x_i^*\) and finite \(\Delta x_i\) | fixed candidate \(p_m\) | PASS |
| CMO capacity/price | supplier capacity, study demand, \(dp_m^*\) | continuous non-policy perturbation | PASS |
| Binary reform equilibrium | \(p_m^1-p_m^0,\Delta\Omega_i,\Delta x_i\) | regime-specific equilibrium prices | PASS |
| Planning/realized products | \(\Delta\Lambda_i^{plan},\Delta Y_i^{ret}\) | regime-specific equilibrium objects | PASS |

Every group states the object, held-fixed variables, algebra, sufficient sign
conditions, economic interpretation, empirical prediction and zero-effect
case. The module contains no derivative with respect to binary \(M\).

## 2. Independent FOC, SOC, sign, and dimension audit

- Product pricing FOC, SOC, feasibility and global maximum: PASS.
- Project-advancement KKT, SOC, zero-value corner and global uniqueness: PASS.
- Supplier-capacity FOC, SOC, zero-price corner and global uniqueness: PASS.
- \(R_q,R_c\), cutoff derivatives and advancement partials: PASS.
- Aggregate study-demand derivative contains both advancement and route terms:
  PASS.
- Continuous equilibrium perturbation has denominator
  \(S_{m,p}-D_{m,p}>0\): PASS.
- Product price and CMO price remain dimensionally and economically distinct:
  PASS.
- All derivative units in the independent audit are consistent: PASS.

## 3. Fixed price, equilibrium price, and binary policy

- Fixed-price direct option-value gain uses a positive-part finite comparison:
  PASS.
- Fixed-price project-advancement response is strict iff the expected value
  gain is positive: PASS.
- \(p_m^1\geq p_m^0\), strictly iff post-MAH study demand is positive at the
  old equilibrium price: PASS.
- \(0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir}\): PASS.
- \(0\leq\Delta x_i^{eq}\leq\Delta x_i^{dir}\): PASS.
- No direct \(M\to p_m^*\) arrow is introduced: PASS.
- No continuous derivative is evaluated at \(\tau_E(0)=+\infty\): PASS.

## 4. Mandatory limiting cases

| Boundary | Result |
|---|---|
| \(k_i\to\infty\) | internal manufacturing is weakly favored relative to entrusted production; PASS |
| \(k_i<\underline{k}(m)\) | internal route has value \(-\infty\); PASS |
| \(M=0\) | entrusted route and study demand are removed; PASS |
| \(p_m\to\infty\) | entrusted value vanishes and the old route-set value is preserved; PASS |
| \(W_i^E\leq W_i^0\) everywhere | \(\Delta\Omega_i=\Delta x_i=0\); PASS |
| perfectly elastic CMO supply | the common price eliminates equilibrium attenuation; PASS |
| \(\nu=1\) | \(x_i^*=(\beta a_i/\kappa)\Omega_i\); PASS |
| \(\rho_O=0\) | original-oriented class contribution is zero; PASS |
| \(\rho_{\mathrm{Inc}}=0\) | incremental class contribution is zero; PASS |
| class ranking | reverse-support construction proves no fixed ordering; PASS |

## 5. Equation dependency and full-draft assembly

- New Phase 15 equation labels: 20.
- Unique Phase 15 labels: 20.
- Phase 15 dependency-ledger rows: 20.
- Missing or extra Phase 15 dependency labels: 0.
- Full-draft input modules: 12, in the approved logical order.
- New baseline control, state, route or market: 0.
- Main/appendix candidates created early: 0.
- Main manuscript modifications: 0.

The full draft inputs Phases 1--11, the six propositions and novelty
corollary, and the Phase 15 comparative statics. The extension module remains
explicitly quarantined and cannot supply a baseline assumption.

## 6. Compilation and rendered PDF

- Phase 15 wrapper, two MiKTeX passes: PASS.
- `12_full_derivation_draft.tex`, two MiKTeX passes: PASS.
- Fatal errors: 0.
- Undefined references: 0.
- Duplicate labels: 0.
- Overfull/underfull box warnings: 0.
- Full-draft PDF pages: 36.
- Seven visually inspected pages: 1, 23, 26, 27, 29, 32 and 36.
- Clipped, overlapping, broken or unreadable content: 0.
- All build, render and temporary files remained on D drive.

## 7. Economic and evidence boundaries

- \(x_i\) retains its v1.2 project-advancement meaning: PASS.
- One common \(x_i\); no \(x_{ig}\): PASS.
- Project advancement, route choice and realized products are distinguished:
  PASS.
- Holder--producer separation follows route assignment and retains holder
  rights: PASS.
- Patent applications and upstream research are outside baseline outcomes:
  PASS.
- Empirical interfaces remain conditional and do not identify every primitive:
  PASS.
- Detailed Shi Gu claims remain `UNVERIFIED` and are not used in the full
  draft: PASS for Phase 15; this evidence item must be resolved before Phase 16
  empirical-boundary prose can pass.

## 8. Traceability

| IDs | Result | Evidence |
|---|---|---|
| RL-01--RL-06 | PASS | no direction-specific control, permanent type, entry, dynamics, household or welfare block |
| RL-07--RL-11 | PASS | only the institutional wedge shifts directly; technology, realization, price and holder-right boundaries preserved |
| RL-12--RL-20 | PASS | prohibited mechanisms absent; formal derivation, notation and definition order audited |
| RL-21--RL-28 | PASS | v1.2 project-advancement, patent, novelty and contribution boundaries explicit |
| P15-D01 | PASS | comparative-static module plus complete full derivation draft |
| P15-G01 | PASS | fixed/equilibrium and finite/derivative distinctions, boundaries and compilation |
| QA-PROOF-01--QA-PROOF-04 | PASS | independent FOC/SOC/corner, dimensions and sign audit |
| QA-PROOF-05--QA-PROOF-07 | PASS | objects/held-fixed variables, binary finite comparisons and price distinction |
| QA-PROOF-08--QA-PROOF-10 | PASS | limiting cases, scalar fixed point, labels/references and compilation |
| QA-ECON-01--QA-ECON-04 | PASS | policy wedge, timing, holder rights and endogenous CMO price |
| QA-ECON-05--QA-ECON-08 | PASS | extension quarantine, identification limit, precise terminology and UNVERIFIED evidence boundary |
| SUCCESS-01--SUCCESS-10 | PASS at derivation-draft scope | locked mechanism, endogenous organization, scarcity attenuation and interpretable primitives |
| SUCCESS-11--SUCCESS-13 | PASS at derivation-draft scope | patent-compatible baseline and distinct commercialization contribution |

## 9. Gate decision

Phase 15 is READY FOR APPROVAL with zero P0 and no open P1. Under
`EXEC-GOV-001`, it may be recorded as APPROVED, committed and pushed without
another routine user prompt after the APPROVED-state audit passes.

Phase 16 may only split the approved full draft. Its empirical-boundary
subsection cannot pass while detailed Shi Gu claims remain `UNVERIFIED`.
