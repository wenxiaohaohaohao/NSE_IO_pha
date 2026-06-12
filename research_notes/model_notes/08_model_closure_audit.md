# 08 Model Closure Audit

This file is the first checklist before any future manuscript edit. It records which objects are primitive, endogenous, composite, calibration-facing, and out of scope. The goal is to keep the MAH model narrow: a partial-equilibrium dynamic route-choice model with one CMO service-market closure.

## 1. Object-status table

| Class | Objects | Status in baseline | Required manuscript treatment |
|---|---|---|---|
| Primitive / exogenous firm objects | \(a_i,\kappa,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T\) | Taken as firm characteristics or cost parameters | Define before route payoffs; do not claim these are identified from approval records alone |
| Policy and route feasibility objects | \(M,\mathcal R_i(M),\tau_i^E(M)\) | \(M\) changes feasibility and the MAH-reducible entrusted-route friction | Keep MAH as route-set expansion plus conditional friction reduction, not as demand, science, or clinical-trial-cost shock |
| Endogenous CMO-market object | \(p_m^*(M)\) | Solves \(D_m(p_m;M)=S_m(p_m)\) | Treat as the only market-clearing price in the baseline; use it as an attenuation channel |
| Endogenous firm-choice objects | \(P_i(r\mid M,p_m^*(M)),\Gamma_i(M,p_m^*(M)),x_i^*(M),\lambda_i^{lat,*}(M),\lambda_i^{obs,*}(M)\) | Derived sequentially from route payoffs, CMO service-market clearing, logit route choice, and the R&D FOC | Keep the sequence \(G,p_m^*\rightarrow P,\Gamma\rightarrow x^*\rightarrow\lambda^{lat}\rightarrow\lambda^{obs}\) explicit |
| Composite realization objects | \(\zeta_i^E(M,p_m),\bar R_i^E,\zeta_i^E\bar R_i^E,\omega_E\) | Route-realization and payoff aggregates | Do not claim separate identification without application-to-approval, launch, payoff, CMO service-condition, or risk data |
| Calibration targets | route share, realized original-drug counts, CMO capacity/price proxies | Mechanism-calibration moments | Map each moment to a composite object and state what it cannot identify |
| Future / sensitivity modules | entry-cost distribution \(F_e\), application-stage conversion, firm-year entry, richer CMO supply | Optional extensions | Do not make them baseline conclusions unless the needed panels are available |
| Explicit non-goals | product-market GE, R&D input GE, free-entry equilibrium, exit/invariant distribution, full bargaining, welfare | Outside current model | Mention only as boundaries or future work |

## 2. Required equation chain

\[
M
\Rightarrow
\left(\mathcal R_i(M),\tau_i^E(M),\zeta_i^E(M,p_m^*(M)),p_m^*(M)\right)
\Rightarrow
G_i^E
\Rightarrow
\left(P_i(E\mid M,p_m^*(M)),\Gamma_i(M,p_m^*(M))\right)
\Rightarrow
x_i^*(M)
\Rightarrow
\lambda_i^{lat,*}(M)
\Rightarrow
\lambda_i^{obs,*}(M).
\]

The CMO service market must use entrusted-route demand:

\[
D_m(p_m;M)=
\int
a_i x_i^*(M,p_m)
P_i(E\mid M,p_m)
\zeta_i^E(M,p_m)
dH_i.
\]

This is not the same as total observed output. Total observed output is:

\[
\lambda_i^{obs,*}(M)
=
a_i x_i^*(M)
\sum_{r\in\mathcal R_i(M)}P_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

## 3. Claim audit rules

1. If a result says MAH raises innovation, specify the margin: latent opportunities, entrusted-route realized outcomes, total observed realizations, or entry.
2. If a result uses \(p_m^*(M)\), state whether the derivative holds the service price fixed or includes CMO price feedback.
3. If a result uses route share, say it disciplines a relative route-realization wedge, not \(\tau^E\), \(\mu^E\), or \(\zeta^E\) separately.
4. If a result uses approval counts, say they are realized downstream outcomes, not direct observations of latent scientific ideas.
5. If a result uses entry, say it is a future or sensitivity module unless a credible firm-year entry panel is available.

## 4. Minimal reality mechanisms to keep

| Reality mechanism | Model object | Why it stays |
|---|---|---|
| Not every firm can self-produce | \(h_i^I,k_i,C^I(k_i)\) | Makes route relevance heterogeneous |
| Not every project can be entrusted | \(q_i^E,\zeta_i^E\) | Prevents universal route availability |
| Holder responsibility remains | \(\mu_i^E\) | Prevents entrusted production from being costless |
| CMO capacity can be scarce | \(p_m^*(M)\) | Prevents unconditional positive effects |
| Transfer/outside option matters | \(S_i-\tau_i^T\), GHM appendix | Keeps the non-retained alternative in the choice set |
