# Phase 6 Independent CMO-Market Audit

Status: APPROVED

This record independently re-derives supplier capacity, study demand and the
qualified-capacity clearing price. No other market is considered.

## 1. Supplier problem

Supplier \(j\) maximizes
\[
p_ms_j-\Psi(s_j;z_j)
\]
over \(s_j\geq0\). At \(p_m=0\), strict cost increase away from zero makes
\(s_j^*=0\) unique. At \(p_m>0\), the derivative at zero is positive and
the marginal cost becomes unbounded, so a finite interior solution exists.
The FOC and SOC are
\[
p_m=\Psi_s(s_j^*;z_j),\qquad -\Psi_{ss}<0.
\]
Strict convexity of cost gives uniqueness. Implicit differentiation gives
\[
s_{j,p_m}^*=\frac{1}{\Psi_{ss}}>0,\qquad
s_{j,z}^*=-\frac{\Psi_{sz}}{\Psi_{ss}}>0.
\]

Result: PASS for the supplier FOC/SOC, corners and comparative derivatives.

## 2. Aggregate supply

Integrating optimal capacity gives
\[
S_m(p_m)=\int s_j^*(p_m,z)\,dH_C(z).
\]
The supplier distribution is policy invariant. Continuity and strict
monotonicity pass through the integral under the stated domination
conditions. Since individual marginal cost is unbounded, individual capacity
and aggregate supply become unbounded as price grows.

Result: PASS for aggregate supply, boundaries and the no-direct-supply-shift
restriction.

## 3. Route and advancement price responses

Entrusted value has price slope \(-b(m)<0\), while the other route values are
price invariant. Thus the deterministic entrusted-choice indicator is weakly
decreasing in price for every project outside ties. Expected entrusted
capacity per planning-stage project,
\[
\chi_i^E(p_m;M)
=\int b(m)1\{r_i^*(q,m;M,p_m)=E\}\,dF,
\]
is also weakly decreasing.

At points without a route tie, the maximum-value envelope gives
\[
\Omega_{i,p_m}
=-\chi_i^E\leq0.
\]
For \(\Omega_i>0\),
\[
x_{i,p_m}^*
=\frac{x_i^*}{\nu\Omega_i}\Omega_{i,p_m}
=-\frac{x_i^*\chi_i^E}{\nu\Omega_i}\leq0.
\]
At the zero-value corner, \(x_i^*=0\), so global weak monotonicity is
preserved.

Result: PASS for both required demand feedbacks.

## 4. Aggregate study demand and continuity

Study-related demand is
\[
D_m^{\mathrm{MAH}}(p_m;M)
=\int a_ix_i^*(M,p_m)\chi_i^E(p_m;M)\,dH(a,k).
\]
It includes the price response of advancement and the price response of route
selection. Both factors in the integrand are nonnegative and weakly
decreasing, so their product and the aggregate are weakly decreasing.

For a convergent price sequence, deterministic indicators converge at every
developer--project pair outside the route-tie set. The tie set has zero
measure, and the common integrable envelope permits dominated convergence.
Therefore aggregate demand is continuous even though individual choices may
jump. No probabilistic route share is needed.

Result: PASS for monotonicity and scope-aware aggregate regularity.

## 5. Dimensions

- \(s_j\), \(S_m\), \(D_m^{\mathrm{MAH}}\), \(D_m^B\), and \(D_m\) have
  units \(\mathsf B\) per decision cohort.
- \(p_m\) has units \(\mathsf C/\mathsf B\).
- \(\Psi\) has units \(\mathsf C\), so \(\Psi_s\) matches \(p_m\).
- \(\chi_i^E\) has units \(\mathsf B/\mathsf P\).
- \(a_ix_i^*\) has units \(\mathsf P\), so
  \(a_ix_i^*\chi_i^E\) has units \(\mathsf B\).

Result: PASS for capacity-market dimensions.

## 6. Existence and uniqueness

Total demand is
\[
D_m(p_m;M)=D_m^B(p_m)+D_m^{\mathrm{MAH}}(p_m;M).
\]
At zero price,
\[
D_m(0;M)\geq D_m^B(0)>0=S_m(0).
\]
At high prices, entrusted value tends to minus infinity because \(b(m)>0\),
so entrusted demand vanishes. Background demand also vanishes, while supply
becomes unbounded. Continuity yields at least one positive intersection.

Total demand is weakly decreasing and supply is strictly increasing.
Therefore demand minus supply is strictly decreasing and the intersection is
unique.

Result: PASS for sufficient existence and uniqueness conditions.

## 7. Fixed-point closure and policy boundary

For a candidate price, route values, deterministic choices, expected value,
advancement, study demand and supplier capacity are all explicit. The unique
zero of the scalar demand-minus-supply function closes the only cycle.

When \(M=0\), entrusted production is unavailable and study demand is zero;
background demand supports the pre-MAH market. Under \(M=1\), study demand is
nonnegative and supply is unchanged, so the clearing price is weakly higher.
The increase is strict if study demand is positive at the pre-MAH price. This
is an equilibrium scarcity response, not a direct policy change in price or
supply.

Result: PASS for the scalar solution order, pre-MAH boundary and policy
interpretation.

Independent review conclusion: no P0 and no P1 detected in the Phase 6 CMO
supply, demand and market-clearing block.
