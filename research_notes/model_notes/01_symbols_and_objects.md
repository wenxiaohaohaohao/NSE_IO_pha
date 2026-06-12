# 01 Symbols and Objects

This file fixes the meaning of all model objects. Do not introduce a symbol in the main text unless it is classified here.

## 1. Core policy and environment objects

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(M\) | MAH regime indicator | policy state | yes | yes | \(M=0\) pre-MAH, \(M=1\) MAH regime |
| \(\mathcal R_i(M)\) | feasible route set | derived from policy and firm type | partly | yes conceptually | Route set may differ by firm |
| \(\bar\tau^E\) | pre-MAH entrusted-route friction | primitive/policy wedge | no | no | Enters with \(\Delta\tau^E\) |
| \(\Delta\tau^E\) | MAH-induced reduction in entrusted-route friction | policy effect | no | no | Empirically composite |
| \(\tau^E(M)\) | MAH-reducible entrusted-route friction | derived policy wedge | no | no | \(\tau^E(M)=\bar\tau^E-\Delta\tau^E M\) |
| \(p_m^*(M)\) | CMO service price | endogenous equilibrium object | proxy possible | partially | Determined by CMO market clearing |

## 2. Firm and project characteristics

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(a_i\) | research ability | primitive/effective ability | no | no | Absorbs latent research productivity and unobserved success probability |
| \(k_i\) | manufacturing ability | primitive/proxy | proxy possible | no | Production license/capacity proxies possible |
| \(h_i^I\) | internal production feasibility | firm-type indicator | proxy possible | partially | \(h_i^I=0\) for research-oriented firms without production capability |
| \(q_i^E\) | entrusted-production feasibility / CMO match suitability | firm-project feasibility indicator | proxy possible | partially | \(q_i^E=1\) is required for the retained entrusted route under MAH |
| \(\mu_i^E\) | residual holder-side burden | primitive cost | no | no | Monitoring, quality, technical transfer, coordination |
| \(S_i\) | gross transfer value | payoff object | no | no | Should potentially depend on outside option |
| \(\tau_i^T\) | transfer/transaction friction | primitive cost | no | no | Enters transfer payoff |

## 3. Risk and payoff objects

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(R_t\) | market-return / commercialization payoff | reduced-form payoff | proxy possible | no | Keep fixed in baseline |
| \(\widetilde R_i^E\) | post-production risk-adjusted payoff under \(E\) | composite payoff | proxy possible | no | Includes aggregate post-production risk |
| \(\zeta_i^E(M,p_m)\) | route-realization / landing probability under \(E\) | composite / derived object | proxy possible | no | May depend on policy friction, feasibility, firm type, and CMO service conditions; do not claim separate structural identification without additional data |
| \(\mathcal V_i^E(M,p_m)\) | composite route-realization value | composite payoff | no | partially | \(\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E\) |
| \(\omega_i\) | post-production aggregate risk shock | optional appendix object | no | no | Not a baseline state variable |
| \(F_{post}^E\) | distribution of post-production aggregate risk | optional appendix object | no | no | Baseline uses risk-adjusted payoff |

## 4. Route payoff objects

| Symbol | Meaning | Type | Includes continuation value? | Notes |
|---|---|---|---|---|
| \(b_i^r\) | non-stock payoff from route \(r\) | payoff component | no | Excludes \(v\rho^r\) |
| \(G_i^r\) | full route value | route value | yes if retained | \(G_i^r=b_i^r+v\rho^r\), or risk-adjusted equivalent |
| \(\rho^r\) | retention indicator | route property | no | \(\rho^I=\rho^E=1\), \(\rho^T=\rho^A=0\) |
| \(\Gamma_i(M,p_m)\) | value of a successful opportunity | derived object | yes | Logit inclusive value evaluated at the relevant CMO service price; deterministic max only as \(\sigma_r\to0\) limit |

## 5. Innovation and output objects

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(x_i\) | R&D intensity | control | usually no | no | Chosen before opportunity realization |
| \(\kappa\) | R&D cost scale | primitive | no | no | Requires normalization or external calibration |
| \(Y_{i,t+1}\) | latent opportunity count | latent random variable | no | no | Not equal to approvals |
| \(\lambda_i^{latent}\) | expected latent opportunity arrival | derived | no | no | \(a_i x_i\) |
| \(\lambda_i^{obs}\) | observed commercialization realization | derived/data counterpart | yes | outcome | Approvals, launch, product realization |
| \(P_i(r\mid M,p_m)\) | route-use probability | derived | route-share proxy | partially | Logit route probability evaluated at the relevant CMO service price |

## 6. Identification rules

1. Do not claim separate identification of:
   \[
   a_i,\ \kappa,\ \Gamma_i,\ \zeta_i^E,\ \widetilde R_i^E,\ \tau^E,\ \mu_i^E.
   \]

2. Route-share data identify an effective relative route wedge, not \(\tau^E\) alone.

3. Product counts identify realized outcomes, not latent opportunities.

4. The object most defensible for calibration is:
   \[
   \text{effective commercialization wedge}\quad \text{or}\quad \text{composite route-realization value}.
   \]
