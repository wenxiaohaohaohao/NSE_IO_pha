# 00 Model Closure Status

## 1. Baseline model type

The baseline model is:

\[
\boxed{\text{partial-equilibrium dynamic route-choice model with a Bellman foundation}}
\]

It is **not**:

- a full general-equilibrium product-market model;
- a full free-entry model;
- a full Hopenhayn-style stationary industry equilibrium;
- a full Klette--Kortum multi-product innovation model;
- a full dynamic structural estimation model.

## 2. Main mechanism

The paper studies how MAH changes the **innovation-to-commercialization route** for original-drug projects.

Baseline mechanism:

\[
MAH\Rightarrow \mathcal R_i(M)\text{ changes}\Rightarrow \tau^E(M)\downarrow\Rightarrow \Gamma_i(M)\uparrow\Rightarrow x_i^*(M)\uparrow\Rightarrow \lambda_i^{obs}(M)\uparrow.
\]

The model must avoid making the mechanism a pure option-value tautology:

\[
\max\{I,E,T,A\}\geq \max\{I,T,A\}.
\]

The model should emphasize **sorting, boundary conditions, and CMO-market feedback**.

## 3. Closed block in the baseline

The only market closed in the baseline is the **contract-manufacturing / CMO service market**.

### Endogenous object

\[
p_m^*(M)
\]

### Clearing condition

\[
\boxed{D_m(p_m;M)=S_m(p_m)}
\]

### Economic role

MAH may increase demand for external production services. This can raise \(p_m\), partially offsetting the direct benefit from lower \(\tau^E\).

## 4. Blocks not closed in the baseline

| Block | Baseline treatment | Reason |
|---|---|---|
| Product market | \(R_t\) is fixed/reduced-form | Paper is not about product-market GE. |
| R&D input market | \(\kappa\) fixed | Paper is not about scientist/labor market clearing. |
| Free entry | Entry treated as latent-firm activation or response margin | Avoid full Hopenhayn closure. |
| Firm exit | Not baseline | Avoid invariant distribution. |
| Invariant industry distribution | Not solved | Not a full dynamic industry model. |
| Full welfare | Not claimed | Partial-equilibrium mechanism paper. |

## 5. Risk kernel

The model must distinguish:

\[
\text{latent opportunity arrival}\neq \text{observed commercialization realization}.
\]

But the model should not over-identify risk components.

### Baseline rule

Use a **composite route-realization value**:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

Then:

\[
G_i^E=\mathcal V_i^E(M)-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

### Interpretation

- \(\zeta_i^E(M)\): route-realization / landing probability component.
- \(\widetilde R_i^E\): risk-adjusted post-production payoff.
- \(\zeta_i^E\widetilde R_i^E\): composite route-realization value.

### Identification warning

Without additional data, do **not** claim separate identification of \(\zeta_i^E\) and \(\widetilde R_i^E\).

## 6. Route choice

Choose one route-choice framework for the baseline.

### Recommended if route-share calibration is used

Use logit route choice:

\[
P_i(r\mid M)=\frac{\exp(\bar G_i^r/\sigma_r)}{\sum_{\ell\in\mathcal R_i(M)}\exp(\bar G_i^\ell/\sigma_r)}.
\]

Inclusive value:

\[
\Gamma_i(M)=\sigma_r\log\sum_{\ell\in\mathcal R_i(M)}\exp(\bar G_i^\ell/\sigma_r).
\]

### Deterministic version

Use only as limiting case:

\[
\Gamma_i(M)=\max_{r\in\mathcal R_i(M)}G_i^r\quad \text{as }\sigma_r\to0.
\]

Do not mix deterministic comparative statics with logit calibration unless the deterministic case is explicitly stated as a limit.

## 7. Output objects

### Latent opportunity arrival

\[
\lambda_i^{latent}(M)=a_i x_i^*(M).
\]

### Observed realization

\[
\lambda_i^{obs}(M)=\lambda_i^{latent}(M)\sum_{r\in\mathcal R_i(M)}P_i(r\mid M)\zeta_i^r(M).
\]

If focusing on entrusted route:

\[
\lambda_i^{obs,E}(M)=a_i x_i^*(M)P_i(E\mid M)\zeta_i^E(M).
\]

## 8. Current unresolved issues

| Issue | Decision status |
|---|---|
| Whether to include GHM hold-up in main model | Should be included conceptually; may be formalized lightly. |
| Whether to endogenize transfer value \(S_i\) | Recommended as extension or main proposition if manageable. |
| Whether \(\zeta^E\) is primitive or composite | Composite / route-realization object. |
| Whether to model post-production risk distribution explicitly | Baseline uses risk-adjusted payoff; distribution discussion can go to appendix. |
