# 01 Symbols and Objects

This dictionary follows the current main text and technical appendix. New notation must not be introduced in other model notes before it is defined here.

## Policy and market objects

| Symbol | Meaning | Status and rule |
|---|---|---|
| \(M\in\{0,1\}\) | legal availability of the MAH-style retained entrusted route | Binary route-set variable; use finite differences only |
| \(\eta\in[0,1]\) | post-MAH implementation intensity | Continuous comparative-static variable conditional on \(M=1\); \(\eta=0\) when \(M=0\) |
| \(\beta\in(0,1)\) | discount factor | Required for the dynamic problem |
| \(\sigma_r>0\) | logit route-fit scale | Deterministic sorting is only the limit \(\sigma_r\to0\) |
| \(p_m^*(M,\eta)\) | equilibrium per-project effective cost of qualified CMO support | Endogenous only in the CMO support market; not a product-market price |
| \(D_m^B(p_m)\) | background support demand from non-MAH uses | Keeps the CMO market active before MAH |
| \(D_m^{tot}(p_m;M,\eta)\) | total demand for qualified support packages | Background demand plus planning-stage MAH-project demand |
| \(S_m(p_m)\) | qualified CMO support supply | May be indexed by support-market cell \(m\) |

## Firm and project objects

| Symbol | Meaning | Status and rule |
|---|---|---|
| \(a_i\) | productivity of R&D effort in generating route-planning-stage projects | Does not include downstream clinical or regulatory success |
| \(x_i\) | original-drug R&D effort | Chosen before route planning and final realization |
| \(\kappa>0\) | quadratic R&D cost scale | Requires normalization or external discipline in calibration |
| \(k_i\) | internal manufacturing capability | Higher \(k_i\) lowers \(C^I(k_i)\) |
| \(h_i^I\) | internal-route feasibility indicator | Controls whether \(I\) enters the route set |
| \(q_i^E\) | technical and regulatory eligibility for qualified entrusted production | Eligibility only; it is not an already secured producer match |
| \(C^I(k_i)\) | planning-stage internal production cost | Not multiplied by a realization probability |
| \(\tau_i^E(\eta)\) | MAH-reducible policy and contractual friction for route \(E\) | Conditional on route availability; \(\tau_{i\eta}^E\le0\) |
| \(\mu_i^E\) | residual holder-side burden under entrusted production | Preserves holder responsibility after MAH |
| \(S_i-\tau_i^T\) | net value of the non-retained transfer route | Exogenous outside option in the baseline |

## Route and payoff objects

| Symbol | Meaning | Status and rule |
|---|---|---|
| \(\mathcal R_i(M)\) | feasible set of abandonment \(A\), transfer \(T\), internal \(I\), and entrusted \(E\) routes | Only \(M\) changes legal route availability |
| \(R_i^{event}\), \(\bar R_i^E\) | route-period commercialization returns | Separate from existing-stock flow payoff and continuation value |
| \(v\) | marginal continuation value of one retained realized product | Added only through retained realized routes |
| \(\rho^r\) | retained-stock indicator | \(\rho^I=\rho^E=1\); \(\rho^T=\rho^A=0\) |
| \(s_i\) | common downstream clinical and regulatory success | Component of retained-route realization |
| \(\chi_i^r\) | route-specific implementation conditional on common success | Component of retained-route realization |
| \(\zeta_i^r=s_i\chi_i^r\) | composite realization probability for retained route \(r\) | The retained factorization; approval data generally identify only the product |
| \(G_i^r\) | planning-stage route payoff | Includes route-period payoff, retained continuation value where applicable, and planning costs |
| \(P_i(r\mid M,\eta,p_m)\) | planned logit route probability | Evaluated at \(p_m^*(M,\eta)\) in equilibrium |
| \(\Gamma_i(M,\eta,p_m)\) | inclusive value of one route-planning-stage project | Enters the R&D first-order condition |

## Arrival and observed-outcome objects

| Symbol | Meaning | Status and rule |
|---|---|---|
| \(Y_{i,t+1}^{plan}\) | random number of projects reaching route planning | Upstream of final success, approval, launch, and observed holder--producer arrangement |
| \(\lambda_i^{plan}=a_i x_i\) | conditional mean of planning-stage project arrivals | Never label as successful or approved output |
| \(\lambda_i^{obs,ret}\) | realized retained-product outcome | Multiplies planning arrival by route choice and route realization |
| \(\lambda_i^{obs,E}\) | realized entrusted-route outcome | \(a_i x_i^*P_i(E)\zeta_i^E\) |
| \(s_E^{obs}\) | holder--producer split among comparable realized retained products | Aggregate realized-weighted ratio, not a representative-firm product |
| \(\omega_i^{r,d}\) | optional data-specific observation weight | Use when the empirical outcome differs from retained approvals or launches |
| \(n_{it}\) | existing stock of retained products or certificates | Bellman state; its transition is written in conditional expectation |

## Identification rules

1. Approval-side data do not separately identify \(s_i\), \(\chi_i^r\), \(\tau_i^E\), \(\mu_i^E\), \(p_m^*\), or route-specific returns.
2. Realized counts jointly discipline planning-stage arrival, route choice, realization, and observation definitions.
3. Aggregate holder--producer shares must be generated by integration or simulation over heterogeneity.
4. Jia et al. represent an approval-delay/review-capacity alternative; Barwick et al. represent a demand/market-size alternative. Neither defines the baseline MAH mechanism.
