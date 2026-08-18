# 03 Assumptions and Scope

## Baseline maintained assumptions

1. \(M\in\{0,1\}\) controls legal route availability. Conditional on \(M=1\), \(\eta\in[0,1]\) controls implementation intensity; \(\eta=0\) when \(M=0\).
2. \(\beta\in(0,1)\), \(\kappa>0\), \(\sigma_r>0\), and retained-route realization probabilities lie in \([0,1]\).
3. \(a_i x_i\) is route-planning-stage project arrival. Common downstream clinical and regulatory success remains in \(s_i\), with \(\zeta_i^r=s_i\chi_i^r\).
4. Conditional on route \(E\) being feasible, \(\tau_{i\eta}^E\le0\), \(\zeta_{i\eta}^E\ge0\), and \(\zeta_{ip}^E\le0\).
5. \(q_i^E\) is technical and regulatory eligibility. Matching pressure and scarcity are represented through the qualified-support market and \(p_m^*(M,\eta)\).
6. Existing-stock flow payoff, route-period commercialization payoff, and marginal continuation value are distinct objects.
7. Route choice is logit. Hard sorting is a limiting interpretation, not a second baseline.
8. CMO excess demand is continuous, crosses zero on a compact support-cost domain, and is strictly decreasing. These conditions deliver existence and uniqueness; differentiability and \(D_{mp}^{tot}<S_{mp}\) support the IFT comparative static.

## Baseline policy exclusions

The baseline does not let \(M\) or \(\eta\) directly shift:

- research productivity \(a_i\);
- demand or market-return objects \(R_i^{event}\) and \(\bar R_i^E\);
- internal production technology \(C^I(k_i)\);
- the residual holder-side burden \(\mu_i^E\).

MAH acts through route availability, entrusted-route friction and implementation, and the equilibrium cost of qualified support.

## Only closed market

The baseline closes

\[
D_m^B(p_m)
+\int a_i x_i^*(M,\eta,p_m)P_i(E\mid M,\eta,p_m)\,dH_i
=S_m(p_m),
\]

which determines the unique \(p_m^*(M,\eta)\). Support demand is formed at route planning and therefore excludes \(\zeta_i^E\).

No product-market, R&D-input, labor, capital, entry, exit, or invariant-distribution equilibrium is added.

## Timing and outcome boundary

- Planning-stage arrival is upstream of clinical success, approval, launch, and the observed holder--producer arrangement.
- The Bellman stock transition is a conditional expectation. A realized transition would require project-level route and realization indicators.
- Approval-side counts and holder--producer splits are realized outcomes, not direct observations of project arrival or scientific productivity.
- The observed entrusted share is an aggregate realized-weighted ratio. A narrow-cell log-odds equation is valid only under homogeneous or sufficiently narrow two-route \(I\)-\(E\) comparisons and must include relative realization.

## Alternative mechanisms

- **Jia et al.:** approval delay, review capacity, and pipeline composition. This is the approval-side alternative.
- **Barwick et al.:** demand and market-size incentives. This is the demand-side alternative.
- **MAH baseline:** commercialization-route availability and friction with qualified-support scarcity.

The alternatives may coexist empirically, but they must not be used as definitions of the MAH mechanism.

## Out-of-scope modules

The following remain extensions or sensitivity exercises unless the required data and equilibrium blocks are explicitly added:

- full product-market demand and pricing;
- free entry and an entry-cost distribution;
- exit and an invariant firm distribution;
- endogenous scientific productivity;
- producer matching as a separate state;
- cross-cell CMO substitution or a national producer network;
- social welfare.

## Allowed claims

The model may claim private route-option value, route sorting, R&D effort responses, CMO support-cost attenuation, and realized-output implications under stated conditions. It may not claim universal innovation gains, separately identified primitive frictions, a representative-firm interpretation of aggregate shares, or a general-equilibrium welfare result.
