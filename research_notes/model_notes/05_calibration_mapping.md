# 05 Calibration Mapping

This file defines what the data can discipline and what cannot be claimed.

## 1. Core calibration principle

The model should discipline **composite objects**, not claim full structural identification of every primitive.

Use language such as:

- discipline an effective commercialization wedge;
- discipline a composite route-realization value;
- discipline a route-use index;
- discipline an innovation-arrival scale.

Avoid language such as:

- estimate \(\tau^E\) structurally;
- identify \(\zeta^E\) separately;
- recover true research ability \(a_i\);
- estimate all primitives.

## 2. Route-use moments

Data moments:

- holder-producer split share;
- share of approvals where MAH holder differs from producer;
- entrusted-production route-use share;
- research-oriented holder using external producer.

Model object:

\[
P_i(E\mid M).
\]

If logit:

\[
\log\frac{P_i(E)}{P_i(I)}=\frac{G_i^E-G_i^I}{\sigma_r}.
\]

Identified object:

\[
\frac{G_i^E-G_i^I}{\sigma_r}.
\]

This may include:

\[
p_m^*(M),\quad \tau^E(M),\quad \mu_i^E,\quad C^I(k_i),\quad \mathcal V_i^E(M)-R_i^I.
\]

Not separately identified:

\[
\tau^E,\quad \mu_i^E,\quad p_m,\quad C^I(k_i),\quad \sigma_r
\]

unless extra moments or normalizations are imposed.

## 3. Original-drug count moments

Data moments:

- IND applications;
- NDA approvals;
- original-drug approvals;
- marketed original drugs;
- observed launch or commercialization realization.

Latent model object:

\[
\lambda_i^{latent}=a_i x_i^*=\frac{\beta a_i^2}{\kappa}\Gamma_i.
\]

Observed model object:

\[
\lambda_i^{obs}=a_i x_i^*\sum_rP_i(r\mid M)\zeta_i^r(M).
\]

Identified object:

\[
\frac{\beta a_i^2}{\kappa}\Gamma_i\sum_rP_i(r\mid M)\zeta_i^r(M).
\]

Not separately identified:

\[
a_i,\quad \kappa,\quad \Gamma_i,\quad \zeta_i^r.
\]

## 4. CMO market moments

Data moments:

- number of qualified manufacturers;
- B-license firms;
- CMO capacity proxies;
- regional manufacturing capacity;
- entrusted-production supply availability;
- manufacturing-service price proxies if available.

Model object:

\[
S_m(p_m),\quad D_m(p_m;M),\quad p_m^*(M).
\]

Calibration target:

Use CMO capacity to discipline the slope or shifter of \(S_m\). Use route-use demand to discipline \(D_m\).

## 5. Entry or activation moments

Data moments:

- number of new research-oriented firms;
- first-time MAH holders;
- new firms with original-drug applications;
- new firms without production licenses but with original-drug approvals.

Model object:

\[
N_E(M)=N_0\Pr(A_i(M)\ge f_i^e).
\]

Do not claim full free-entry equilibrium unless the model includes a marginal entrant zero-profit condition and solves industry size.

## 6. Risk-realization moments

Data moments:

- conditional probability from key clinical stage to approval;
- probability from approval to production/launch;
- approval-to-marketed-product conversion;
- holder-producer matched projects that successfully launch.

Model object:

\[
\zeta_i^E(M)\quad \text{or}\quad \mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

Baseline warning:

If no separate data on expected payoff \(\widetilde R_i^E\), estimate only a composite route-realization object.

## 7. Recommended calibration table

| Block | Data moment | Model moment | Disciplined object | Identification warning |
|---|---|---|---|---|
| Route use | Holder-producer split | \(P_i(E\mid M)\) | Relative route wedge | Cannot isolate \(\tau^E\) |
| Innovation counts | IND/NDA/original approvals | \(\lambda_i^{obs}\) | Innovation-realization scale | Cannot isolate \(a_i,\kappa,\Gamma,\zeta\) |
| CMO capacity | Qualified manufacturers / B-license firms | \(S_m(p_m)\) | CMO supply shifter/slope | Price may be proxied imperfectly |
| Realization risk | approval/launch conversion | \(\zeta_i^E\) or composite value | route-realization object | Separate \(\zeta\) only if payoff separately measured |
| Entry activation | new research-oriented firms | \(N_E(M)\) | activation threshold | Not full free entry |
