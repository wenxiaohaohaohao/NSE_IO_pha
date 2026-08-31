# 04 Proposition Checklist

Phase status: PHASE 4 - APPROVED; PHASE 5 - APPROVED; PHASE 6 - APPROVED

## Draft P4-ORG - Organizational sorting

- Status: draft for Phase 4 gate; final proposition numbering and proof audit are reserved for Phase 8.
- Objects defined before statement: \(W_i^I,W_i^E,W^T,W^A,W_i,r_i^*,\Delta_{IE},k^*\).
- Assumptions used: A-P02-PV-01, A-P03-INT-01, A-P03-INT-02, A-P04-CHOICE-01, A-P04-CUTOFF-01, A-P04-CUTOFF-02, A-P04-PRICE-01, A-P04-POLICY-01.
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

## Draft P5-ADV - Project-advancement response

- Status: derivation draft for the Phase 5 gate; final proposition numbering
  and proof audit are reserved for Phase 8.
- Objects defined before statement:
  \(\lambda_i^{\mathrm{plan}},C_X,\Omega_i,x_i^*,B_i,K_i\).
- Assumptions used: A-P05-COST-01, A-P05-VALUE-01, A-P05-TIME-01,
  A-P05-CHANNEL-01 and A-P05-GAP-01.
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
- Manufacturing role: \(k_i\) affects \(\Omega_i\) through route organization,
  not project-arrival productivity or advancement cost.
- Interpretation: \(K_i-B_i=\Omega_i\) is an appendix accounting identity, not
  a recursive state system.
- P0 issues: none identified in the draft.

## Draft P6-CMO - CMO market existence and uniqueness

- Status: derivation draft for the Phase 6 gate; final proposition numbering
  and proof audit are reserved for Phase 8.
- Objects defined before statement:
  \(s_j,\Psi,s_j^*,S_m,\chi_i^E,D_m^{\mathrm{MAH}},D_m^B,D_m,p_m^*\).
- Assumptions used: A-P06-SUPPLY-01, A-P06-BACKGROUND-01,
  A-P06-AGG-01 and A-P06-PRICE-01.
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
