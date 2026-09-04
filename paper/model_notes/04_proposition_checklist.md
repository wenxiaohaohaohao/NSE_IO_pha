# 04 Proposition Checklist

Phase status: PHASE 4--8 - APPROVED; PHASE 14 ASSUMPTION AUDIT - APPROVED

Canonical assumption IDs below are controlled by
`03_assumptions_and_scope.md`. Earlier `A-Pxx-*` IDs remain traceable aliases
but are no longer the active taxonomy. Architecture guards are listed
separately and are not counted as economic assumptions.

## Proposition 1 - Organizational sorting

- Status: formal Phase 8 proof and independent audit complete.
- Objects defined before statement: \(W_i^I,W_i^E,W^T,W^A,W_i,r_i^*,\Delta_{IE},k^*\).
- Assumptions used: A-DEM-01, A-DEM-03; B-MFG-01, B-MFG-02, B-MFG-04,
  B-MFG-05.
- Architecture guards: ARCH-02, ARCH-06, ARCH-08.
- Fixed objects in capability derivative: \(q,m,M,p_m\).
- Sufficient crossing conditions: continuous \(\Delta_{IE}\), negative lower-end limit, positive upper-end limit.
- Derived monotonicity: \(\Delta_{IE,k}=sR_c c_{I,k}-F_{I,k}>0\).
- Existence: intermediate value theorem under endpoint crossing.
- Uniqueness: strict positive slope.
- Conditional sorting: \(k_i<k^*\) selects \(E\) and \(k_i>k^*\) selects \(I\) only when both dominate \(T/A\).
- Structural finite-wedge derivative: \(\partial k^*/\partial\tau_E<0\).
- Fixed-price derivative: \(\partial k^*/\partial p_m<0\).
- Binary-policy boundary: \(M=0\) makes \(E\) unavailable and does not have a finite interior \(I/E\) cutoff.
- Zero-effect cases: \(E\) below the pre-reform maximum; \(T\) or \(A\) dominates; crossing conditions fail for the project--price cell.
- Economic interpretation: lower finite institutional burden expands the entrusted region; a higher fixed CMO price contracts it.
- P0 issues: none identified in the draft.

## Proposition 3 - Project-advancement response and firm heterogeneity

- Status: formal Phase 8 proof and independent audit complete.
- Objects defined before statement:
  \(\lambda_i^{\mathrm{plan}},C_X,\Omega_i,x_i^*,B_i,K_i\).
- Assumptions used: C-ADV-01, C-ADV-02 and C-ADV-03; B-MFG-02 and
  C-ADV-06 only for the manufacturing-capability sufficient result.
- Architecture guards: ARCH-01, ARCH-05, ARCH-06, ARCH-07.
- Fixed objects in the binary comparison: \(p_m,a_i,k_i,F\) and all
  policy-invariant primitives.
- Optimization: one common \(x_i\geq0\); no class-specific or
  research-versus-development controls.
- KKT: includes the zero-value corner and the positive-value interior FOC.
- SOC and global result: strict concavity and a superlinear cost give a unique
  optimizer.
- Closed form:
  \(x_i^*=[\beta a_i\Omega_i/\kappa]^{1/\nu}\).
- Zero-effect case: if the entrusted option does not improve expected
  optimized route value, the reform leaves \(x_i^*\) unchanged.
- Strict-effect condition: a positive expected route-value gain at fixed
  \(p_m\).
- Policy channel: MAH changes \(x_i^*\) only through \(\Omega_i\); it does not
  change \(a_i\), cost curvature or project characteristics.
- Research-capability scaling: holding route-value objects fixed,
  \(\partial\Delta x_i/\partial a_i=\Delta x_i/(\nu a_i)>0\) for a positive
  response.
- Manufacturing-capability sufficient conditions: \(\Omega_i^0\) weakly rises,
  \(\Delta\Omega_i\) weakly falls, and \(\nu\geq1\) makes the advancement
  transformation concave; together these imply \(\Delta x_i\) weakly falls in
  \(k_i\). No sign is claimed for \(0<\nu<1\) without another bound.
- Manufacturing role: \(k_i\) affects \(\Omega_i\) through route organization,
  not project-arrival productivity or advancement cost.
- Interpretation: \(K_i-B_i=\Omega_i\) is an appendix accounting identity, not
  a recursive state system.
- P0 issues: none identified in the draft.

## Proposition 4 - CMO market existence and uniqueness

- Status: formal Phase 8 proof and independent audit complete.
- Objects defined before statement:
  \(s_j,\Psi,s_j^*,S_m,\chi_i^E,D_m^{\mathrm{MAH}},D_m^B,D_m,p_m^*\).
- Assumptions used: B-MFG-03 and D-CMO-01--D-CMO-04.
- Architecture guards: ARCH-04, ARCH-06.
- Supplier optimization: unique capacity follows from strict convexity; supply
  rises with \(p_m\) and \(z_j\).
- Study demand: contains both the advancement response through
  \(\Omega_i\) and the deterministic route-selection response.
- Deterministic aggregation: aggregate continuity follows from zero-mass ties,
  continuous heterogeneity and dominated convergence, not logit smoothing.
- Demand monotonicity: both \(x_i^*(M,p_m)\) and
  \(\chi_i^E(p_m;M)\) are weakly decreasing in price.
- Existence: demand exceeds supply at zero; demand vanishes and supply becomes
  unbounded at high prices.
- Uniqueness: total demand is weakly decreasing and aggregate supply strictly
  increasing.
- Solution order: all choices are explicit functions of a candidate price,
  leaving one scalar clearing equation.
- Pre-MAH boundary: study demand is zero but background demand supports the
  CMO market.
- Price interpretation: any cross-regime price change is endogenous; supply
  technology is not shifted by policy.
- Scope: no entry or second market-clearing condition.
- P0 issues: none identified in the draft.

## Proposition 2 - MAH-relevant project set

- Status: formal Phase 8 proof and independent audit complete.
- Objects defined before statement: \(W_i^0,W_i^1,\mathcal C_i\).
- Assumptions used: B-MFG-04.
- Architecture guards: ARCH-01, ARCH-06.
- Fixed objects: developer, project draw and support price.
- Identity: \(W_i^1-W_i^0=[W_i^E-W_i^0]_+\).
- Relevant set: strict gain occurs exactly on
  \(\mathcal C_i(p_m)=\{(q,m):W_i^E>W_i^0\}\).
- Zero-effect cases: entrusted value does not beat the old maximum; the set is
  null; or CMO price is prohibitive.
- Interpretation: adding route \(E\) preserves the old choice-set value.
- P0 issues: none identified.

## Corollary - Novelty composition is theoretically ambiguous

- Status: formal Phase 8 proof and independent audit complete.
- Status in hierarchy: corollary of Proposition 2, not a seventh proposition.
- Objects defined before statement: \(\Omega_{ig}^0,\Omega_{ig}^1,\Delta\Omega_{ig}\).
- Common-control restriction: one \(x_i\); no \(x_{ig}\).
- Assumptions used: C-ADV-04, C-ADV-05.
- Architecture guards: ARCH-05, ARCH-07.
- Mixture identity: \(\Delta\Omega_i=\sum_g\rho_g\Delta\Omega_{ig}\).
- Ranking: neither original nor incremental class is ordered without explicit
  primitive restrictions; reverse-support examples establish ambiguity.
- Boundary cases: \(\rho_O=0\), \(\rho_{\mathrm{Inc}}=0\), and either class gain
  equal to zero.
- P0 issues: none identified.

## Proposition 5 - CMO scarcity attenuation

- Status: formal Phase 8 proof and independent audit complete.
- Fixed objects: policy-invariant supply, supplier distribution and background
  demand; compare \(p_m^0=p_m^*(0)\) with \(p_m^1=p_m^*(1)\).
- Assumptions used: B-MFG-03 and D-CMO-01--D-CMO-04.
- Architecture guards: ARCH-01, ARCH-06.
- Price result: \(p_m^1\geq p_m^0\), strict if post-MAH study demand is positive
  at \(p_m^0\).
- Value bound:
  \(0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir}\).
- Advancement bound:
  \(0\leq\Delta x_i^{eq}\leq\Delta x_i^{dir}\).
- Zero-effect cases: no new demand; no entrusted advantage; or perfectly
  elastic supply at a common price.
- Interpretation: scarcity attenuates a gain but cannot reduce the old
  choice-set value.
- P0 issues: none identified.

## Proposition 6 - Planning-stage and observed outcomes

- Status: formal Phase 8 proof and independent audit complete.
- Objects defined before statement:
  \(\Lambda_i^{plan},Y_i^{ret},Y_i^E,Y_{ig}^{ret},Q_i^{ret,h}\).
- Assumptions used: B-MFG-04 and C-ADV-02--C-ADV-05.
- Architecture guards: ARCH-03, ARCH-05, ARCH-07.
- Timing: common advancement precedes project draw, route assignment and
  observed holder--producer separation.
- Common-control restriction: type-specific outcomes use \(\rho_gF_g\) and
  the same \(x_i^*\).
- Exact decomposition: advancement/planning-arrival component plus retained
  route-composition component.
- Realization boundary: \(s(q)\) and \(s_g(q)\) are policy invariant.
- Zero/ambiguity cases: either class may have zero response; neither novelty
  ranking is imposed.
- Interpretation: the outcome formulas do not make patent generation,
  upstream research or downstream success a direct policy outcome.
- P0 issues: none identified.

## Count and scope audit

- Main-text substantive propositions: exactly 4 (organizational sorting,
  MAH-relevant set, project advancement, and CMO equilibrium).
- Appendix proof-ledger substantive propositions: exactly 6.
- Appendix corollaries: exactly 1.
- Additional substantive propositions: 0.
- New baseline markets or controls: 0.
- Proposition rows with canonical assumptions: 6.
- Novelty corollary rows with canonical assumptions: 1.
- Proposition conclusions written as assumptions: 0.

## Inactive financing-extension result status (2026-09-04)

- File: `15_financing_commercialization_extension.tex`.
- Status: preserved, mathematically nested, and explicitly inactive.
- It introduces no numbered proposition in the main text or appendix.
- Its local financing corridor is not a baseline result and does not change
  baseline CMO demand, advancement, or the six-item appendix proof ledger.
- Exact nesting holds when financing capacity exceeds both extension-only
  liquidity thresholds.
- Promotion requires independent empirical evidence and new user
  authorization.
- Unconditional finance or patent-sign claims: 0.
