# Combined Model Closure Notes for Codex



---

# README_for_codex.md


# Model Notes for Codex: MAH Route-Choice Model Closure

## Purpose

This folder is the model-closure control panel for the MAH paper. The main LaTeX manuscript should remain a single compilable file while the model is still being stabilized. Do **not** scatter unstable derivations directly into the main text.

The current target is **not** a full GE model, **not** a full free-entry model, and **not** a full Hopenhayn/Klette--Kortum dynamic industry model.

The target is:

\[
\boxed{\text{partial-equilibrium dynamic route-choice model}+\text{CMO service-market closure}+\text{composite route-realization value}+\text{Bellman payoff accounting}}
\]

## Required workflow

1. Freeze the current main `.tex` and `.pdf` in `archive/`.
2. Use these notes to lock primitives, composite objects, and equation dependencies.
3. Only after the notes are internally consistent, update the main manuscript.
4. Codex should make local, section-specific edits only. Do not ask Codex to rewrite the entire manuscript from all reviews at once.

## Files

| File | Purpose |
|---|---|
| `00_model_closure_status.md` | Master control file: what is closed, what is not closed, and what the baseline model is. |
| `01_symbols_and_objects.md` | Symbol dictionary: primitive vs derived vs composite vs data counterpart. |
| `02_equation_dependency_map.md` | Equation dependency chain: CMO market, route value, route choice, R&D, output. |
| `03_assumptions_and_scope.md` | Scope restrictions and explicit non-goals. |
| `04_comparative_statics_checklist.md` | Checks each proposition/comparative static must pass. |
| `05_calibration_mapping.md` | What moments discipline what composite objects; what cannot be separately identified. |
| `06_bellman_accounting.md` | Payoff accounting rules to avoid double counting \(R\), \(v\), \(b^r\), and \(\pi n\). |
| `07_revision_decision_log.md` | Final decisions on disputed review issues. |

## Core instruction for Codex

Before modifying the main `.tex`, check whether the proposed edit is consistent with:

1. `00_model_closure_status.md`
2. `01_symbols_and_objects.md`
3. `02_equation_dependency_map.md`
4. `06_bellman_accounting.md`
5. `07_revision_decision_log.md`

If not consistent, do not edit the manuscript. Update the notes first.


---

# 00_model_closure_status.md


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


---

# 01_symbols_and_objects.md


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
| \(\mu_i^E\) | residual holder-side burden | primitive cost | no | no | Monitoring, quality, technical transfer, coordination |
| \(S_i\) | gross transfer value | payoff object | no | no | Should potentially depend on outside option |
| \(\tau_i^T\) | transfer/transaction friction | primitive cost | no | no | Enters transfer payoff |

## 3. Risk and payoff objects

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(R_t\) | market-return / commercialization payoff | reduced-form payoff | proxy possible | no | Keep fixed in baseline |
| \(\widetilde R_i^E\) | post-production risk-adjusted payoff under \(E\) | composite payoff | proxy possible | no | Includes aggregate post-production risk |
| \(\zeta_i^E(M)\) | route-realization / landing probability under \(E\) | composite / derived object | proxy possible | no | Do not claim separate structural identification without additional data |
| \(\mathcal V_i^E(M)\) | composite route-realization value | composite payoff | no | partially | \(\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E\) |
| \(\omega_i\) | post-production aggregate risk shock | optional appendix object | no | no | Not a baseline state variable |
| \(F_{post}^E\) | distribution of post-production aggregate risk | optional appendix object | no | no | Baseline uses risk-adjusted payoff |

## 4. Route payoff objects

| Symbol | Meaning | Type | Includes continuation value? | Notes |
|---|---|---|---|---|
| \(b_i^r\) | non-stock payoff from route \(r\) | payoff component | no | Excludes \(v\rho^r\) |
| \(G_i^r\) | full route value | route value | yes if retained | \(G_i^r=b_i^r+v\rho^r\), or risk-adjusted equivalent |
| \(\rho^r\) | retention indicator | route property | no | \(\rho^I=\rho^E=1\), \(\rho^T=\rho^A=0\) |
| \(\Gamma_i(M)\) | value of a successful opportunity | derived object | yes | max value or logit inclusive value |

## 5. Innovation and output objects

| Symbol | Meaning | Type | Observed? | Separately identified? | Notes |
|---|---|---|---|---|---|
| \(x_i\) | R&D intensity | control | usually no | no | Chosen before opportunity realization |
| \(\kappa\) | R&D cost scale | primitive | no | no | Requires normalization or external calibration |
| \(Y_{i,t+1}\) | latent opportunity count | latent random variable | no | no | Not equal to approvals |
| \(\lambda_i^{latent}\) | expected latent opportunity arrival | derived | no | no | \(a_i x_i\) |
| \(\lambda_i^{obs}\) | observed commercialization realization | derived/data counterpart | yes | outcome | Approvals, launch, product realization |
| \(P_i(r\mid M)\) | route-use probability | derived | route-share proxy | partially | If logit route choice is used |

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


---

# 02_equation_dependency_map.md


# 02 Equation Dependency Map

This file describes the order in which equations depend on each other. The main text should introduce objects in this order.

## 1. Environment

Baseline environment:

\[
\mathcal E=(R, H, G_N, M, \bar\tau^E,\Delta\tau^E, S_m(\cdot)).
\]

If the baseline closes the CMO market, \(p_m\) should not be listed as an exogenous primitive. It is an endogenous object:

\[
p_m=p_m^*(M).
\]

## 2. Firm type and route set

Firm type:

\[
\theta_i=(a_i,k_i,h_i^I,\mu_i^E,S_i,\tau_i^T).
\]

Route set:

\[
\mathcal R_i(M)=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1, q_i^E=1\}.
\]

For research-oriented firms without internal manufacturing capability:

\[
h_i^I=0.
\]

But do not impose \(h_i^I=0\) for all firms in the general model.

## 3. CMO service market

Demand:

\[
D_m(p_m;M)=\int \lambda_i^{obs}(M,p_m)P_i(E\mid M,p_m)dH_i.
\]

Supply:

\[
S_m(p_m)=\int s_j(p_m;z_j^C)dH_C(j).
\]

Clearing:

\[
D_m(p_m;M)=S_m(p_m).
\]

This pins down:

\[
p_m^*(M).
\]

## 4. Route values

Internal production:

\[
G_i^I=R_i^I+v-C^I(k_i)\quad \text{if } h_i^I=1.
\]

Entrusted production / MAH route:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

\[
G_i^E=\mathcal V_i^E(M)-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

Alternative expanded notation:

\[
G_i^E=\zeta_i^E(M)\widetilde R_i^E-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

Do not claim \(\zeta_i^E\) and \(\widetilde R_i^E\) are separately identified unless extra data are introduced.

Transfer:

\[
G_i^T=S_i-\tau_i^T.
\]

Possible GHM extension:

\[
S_i=S_i(\max\{G_i^I,G_i^E,G_i^A\}),
\]

where better retained outside options raise bargaining value.

Abandonment:

\[
G_i^A=0.
\]

## 5. Route choice

If using logit baseline:

\[
P_i(r\mid M)=\frac{\exp(G_i^r/\sigma_r)}{\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r)}.
\]

\[
\Gamma_i(M)=\sigma_r\log\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r).
\]

Deterministic limit:

\[
\Gamma_i(M)=\max_{r\in\mathcal R_i(M)}G_i^r.
\]

Use this only as a limiting case or in a separate deterministic version.

## 6. R&D choice

Problem:

\[
\max_{x_i\ge0}\left\{\beta a_i x_i \Gamma_i(M)-\frac{\kappa}{2}x_i^2\right\}.
\]

FOC:

\[
x_i^*(M)=\frac{\beta a_i}{\kappa}\Gamma_i(M).
\]

Latent opportunity arrival:

\[
\lambda_i^{latent}(M)=a_i x_i^*(M)=\frac{\beta a_i^2}{\kappa}\Gamma_i(M).
\]

## 7. Observed realization

General:

\[
\lambda_i^{obs}(M)=a_i x_i^*(M)\sum_{r\in\mathcal R_i(M)}P_i(r\mid M)\zeta_i^r(M).
\]

Entrusted-route component:

\[
\lambda_i^{obs,E}(M)=a_i x_i^*(M)P_i(E\mid M)\zeta_i^E(M).
\]

## 8. Comparative-static chain

MAH affects observed realization through:

\[
M\Rightarrow \mathcal R_i(M)\Rightarrow G_i^E\Rightarrow P_i(E\mid M),\Gamma_i(M)\Rightarrow x_i^*(M)\Rightarrow \lambda_i^{obs}(M).
\]

With CMO feedback:

\[
M\Rightarrow D_m(\cdot;M)\uparrow\Rightarrow p_m^*(M)\uparrow\Rightarrow G_i^E\downarrow\quad \text{partial offset}.
\]


---

# 03_assumptions_and_scope.md


# 03 Assumptions and Scope

This file states what the baseline does and does not do.

## 1. What the baseline does

The baseline model:

1. Models MAH as a change in commercialization-route feasibility and route-specific friction.
2. Allows firms to differ in research ability, manufacturing capability, residual holder burden, and outside options.
3. Distinguishes latent opportunity arrival from observed commercialization realization.
4. Closes the CMO service market to determine \(p_m^*(M)\).
5. Allows MAH to affect the composite route-realization value of entrusted production.
6. Provides comparative statics for route value, route adoption, R&D intensity, and observed original-drug realization.

## 2. What the baseline does not do

The baseline does not:

1. Solve product-market GE.
2. Endogenize \(R_t\) through the CES price index.
3. Solve an R&D labor/scientist market.
4. Solve a full free-entry zero-profit condition.
5. Solve firm exit.
6. Solve an invariant industry distribution.
7. Claim full structural identification of all primitives.
8. Model sales, after-sales service, pharmacovigilance, regulatory penalties, and partner default as separate states.
9. Estimate welfare.

## 3. Justification for not doing full GE

The paper's mechanism is not about aggregate product-market competition or welfare. The core mechanism is a route-specific commercialization friction:

\[
\tau^E(M),
\]

and the external production service market response:

\[
p_m^*(M).
\]

Therefore, the minimal necessary closure is the CMO market, not a full product-market GE.

## 4. Justification for not doing full free entry

The paper can discuss entry as activation of latent research-oriented firms:

\[
N_E(M)=N_0\Pr(A_i(M)\ge f_i^e).
\]

But it should not claim a full free-entry equilibrium unless it solves:

\[
V^e(M,p_m,R)=f^e,
\]

and an invariant distribution. The current paper should avoid that unless a separate structural section is added.

## 5. Research-oriented firm module

The general theory should allow both:

- integrated firms with internal production capability:
  \[
  h_i^I=1;
  \]
- research-oriented firms without internal production capability:
  \[
  h_i^I=0.
  \]

Do not impose \(h_i^I=0\) for all firms in the baseline.

The empirical design may focus on research-oriented firms or project cases where the production partner is fixed before Phase III.

## 6. Post-production risk scope

Baseline uses one aggregate object:

\[
\widetilde R_i^E.
\]

Do not split this into production, sales, after-sales, pharmacovigilance, penalties, and default as separate risk processes.

If needed, describe them in prose:

\[
\omega_i\sim F_{post}^E,\qquad \widetilde R_i^E=\mathbb E[R(\omega_i)+v].
\]

But in baseline, use the risk-adjusted payoff directly.

## 7. Review-response boundary

If a review asks for full GE, full free entry, or exit/invariant distribution, respond:

> The paper is deliberately a disciplined partial-equilibrium mechanism model. The only market closure required for the MAH mechanism is the CMO service market. Product-market GE, free entry, exit, and invariant distributions are outside the baseline and would require a different structural exercise.


---

# 04_comparative_statics_checklist.md


# 04 Comparative Statics Checklist

Before finalizing any proposition, check every item below.

## 1. Avoid tautological propositions

Do not make the main proposition only:

\[
\max\{I,E,T,A\}\geq \max\{I,T,A\}.
\]

This should be a lemma or remark, not the main economic result.

## 2. Main proposition should be a sorting proposition

The main proposition should characterize which firms respond most.

A firm is more likely to increase R&D after MAH if it has:

- high research ability \(a_i\);
- weak internal manufacturing feasibility \(h_i^I=0\) or low \(k_i\);
- low residual holder burden \(\mu_i^E\);
- strong CMO match \(q_i^E=1\);
- high composite realization value \(\mathcal V_i^E(M)\);
- access to a CMO market where \(p_m^*(M)\) does not rise too much.

## 3. CMO price feedback

Any MAH comparative static for entrusted-route value should include:

\[
\frac{dG_i^E}{dM}=\frac{d\mathcal V_i^E(M)}{dM}-\frac{dp_m^*(M)}{dM}-\frac{d\tau^E(M)}{dM}-\frac{d\mu_i^E}{dM}.
\]

Baseline can set \(d\mu_i^E/dM=0\), but this must be stated.

If \(dp_m^*(M)/dM\) is large, the MAH effect is partially offset.

## 4. Composite realization value

If using:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E,
\]

then comparative statics can be written as:

\[
\frac{d\mathcal V_i^E}{dM}=\widetilde R_i^E\frac{d\zeta_i^E}{dM}+\zeta_i^E\frac{d\widetilde R_i^E}{dM}.
\]

In the baseline, usually set:

\[
\frac{d\widetilde R_i^E}{dM}=0.
\]

Then MAH affects realization mainly through:

\[
\frac{d\zeta_i^E}{dM}>0.
\]

Identification warning: \(\zeta_i^E\) and \(\widetilde R_i^E\) are not separately identified without additional data.

## 5. Logit consistency

If route choice is logit:

\[
\Gamma_i(M)=\sigma_r\log\sum_r\exp(G_i^r/\sigma_r),
\]

then all R&D comparative statics must use this \(\Gamma_i(M)\).

Do not use:

\[
\Gamma_i(M)=\max_rG_i^r
\]

in the proposition unless explicitly taking the limit:

\[
\sigma_r\to0.
\]

## 6. R&D derivative

With quadratic cost and linear arrival:

\[
x_i^*(M)=\frac{\beta a_i}{\kappa}\Gamma_i(M).
\]

Therefore:

\[
\frac{dx_i^*}{dM}=\frac{\beta a_i}{\kappa}\frac{d\Gamma_i(M)}{dM}.
\]

Observed realization:

\[
\lambda_i^{obs}(M)=a_i x_i^*(M)\sum_rP_i(r\mid M)\zeta_i^r(M).
\]

Its derivative includes:

1. R&D intensity response;
2. route probability response;
3. realization probability response.

## 7. Conditions for strict positive effect

A strict MAH effect requires at least one of the following:

1. \(E\) becomes feasible and has positive choice probability;
2. \(\tau^E(M)\) falls enough;
3. \(\mathcal V_i^E(M)\) rises enough;
4. \(p_m^*(M)\) does not rise enough to offset the benefit.

## 8. Suggested main propositions

### Proposition A: Route-sorting effect

MAH raises the entrusted-route attractiveness most for firms with high research ability, weak internal manufacturing capability, low residual holder burden, and strong CMO access.

### Proposition B: R&D response

If \(d\Gamma_i/dM>0\), then \(dx_i^*/dM>0\), with magnitude increasing in \(a_i/\kappa\).

### Proposition C: CMO congestion

When CMO supply is upward sloping, MAH-induced CMO demand raises \(p_m^*(M)\), which attenuates the direct effect of lower \(\tau^E\).

### Proposition D: Observed realization

Observed original-drug realization responds through both R&D intensity and route-realization probability, so it need not equal latent opportunity arrival.


---

# 05_calibration_mapping.md


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


---

# 06_bellman_accounting.md


# 06 Bellman Accounting

This file fixes payoff accounting and prevents double counting.

## 1. Main risk

The model uses several payoff objects:

\[
R_t,\quad \widetilde R_i^E,\quad v_t,\quad \pi n_{it},\quad b_i^r,\quad G_i^r,\quad \Gamma_i(M).
\]

These must not overlap incorrectly.

## 2. Payoff object definitions

| Object | Meaning | Includes future retained-stock value? | Enters where? |
|---|---|---|---|
| \(R_t\) | current commercialization-event payoff / market-return component | no | route payoff |
| \(\widetilde R_i^E\) | risk-adjusted post-production payoff under entrusted route | may include \(v\) only if explicitly defined that way | route value |
| \(v_t\) | marginal continuation value of one retained original-drug asset | yes | retained routes only |
| \(\pi n_{it}\) | flow payoff from existing retained stock | no, current flow only | Bellman flow payoff |
| \(b_i^r\) | non-stock route payoff | no | route value construction |
| \(G_i^r\) | full value of route \(r\) | yes if retained route | route choice |
| \(\Gamma_i(M)\) | value of successful opportunity after route choice | yes | R&D FOC |

## 3. No double-counting rules

### Rule 1

If \(R_t\) is a commercialization-event payoff, then it must exclude \(v_t\).

Then:

\[
G_i^r=b_i^r+v_t\rho^r.
\]

### Rule 2

If \(\widetilde R_i^E\) is defined as:

\[
\widetilde R_i^E=\mathbb E[R(\omega)+v],
\]

then do not add \(+v\) again to \(G_i^E\).

### Rule 3

\(\pi n_{it}\) pays only for products already in the retained stock at the start of the period.

Newly retained products enter future stock and generate future flow payoff through \(v_t\).

### Rule 4

Transfer route \(T\) is non-retained unless a retained licensing route is explicitly introduced.

Thus:

\[
\rho^T=0.
\]

### Rule 5

Abandonment route \(A\) has:

\[
G_i^A=0.
\]

## 4. Recommended clean baseline notation

Use:

\[
G_i^I=R_i^I-C^I(k_i)+v.
\]

Use:

\[
G_i^E=\mathcal V_i^E(M)-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

where:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

If \(\widetilde R_i^E\) includes continuation value \(v\), state it explicitly.

Alternative:

\[
G_i^E=\zeta_i^E(M)(R_i^E+v)-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

Then do not add \(v\) again elsewhere.

## 5. Bellman timing

A clean timing:

1. At beginning of period \(t\), firm has retained stock \(n_{it}\).
2. It receives flow payoff \(\pi n_{it}\).
3. It chooses R&D intensity \(x_{it}\).
4. Successful opportunities arrive at \(t+1\).
5. For each opportunity, route \(r\) is chosen.
6. Retained routes add to future stock.
7. Future flow payoff from newly retained drugs is captured by \(v_{t+1}\).

## 6. Bellman reduced form

The R&D part can be written as:

\[
\max_{x_i\ge0}\left\{\beta a_i x_i \Gamma_i(M)-\frac{\kappa}{2}x_i^2\right\}.
\]

This is valid only after \(\Gamma_i(M)\) is defined as the value of a successful opportunity including the route choice and continuation accounting.

## 7. Required manuscript clarification

When writing the Bellman, explicitly state:

> The route payoff \(b_i^r\) is a non-stock payoff. The continuation value of retaining a drug is accounted for separately through \(v\rho^r\). Therefore, \(R_t\) is not a lifetime value and does not double-count the retained-stock continuation value.


---

# 07_revision_decision_log.md


# 07 Revision Decision Log

This file records final decisions on disputed review issues. Codex should follow these decisions unless the user explicitly changes them.

## Decision 1: Should the model become full GE?

**Final decision:** No.

The model should not become a full product-market GE model. Keep \(R_t\) fixed in the baseline. Move CES derivation to appendix or reduce it in the main text.

**Reason:** The paper studies commercialization-route frictions, not product-market general equilibrium.

## Decision 2: Should the model become a full free-entry model?

**Final decision:** No, not in the baseline.

Entry can be discussed as activation of latent research-oriented firms:

\[
N_E(M)=N_0\Pr(A_i(M)\ge f_i^e).
\]

Do not impose a full zero-profit free-entry equilibrium unless a separate structural section is developed.

## Decision 3: Should the model solve exit and invariant distribution?

**Final decision:** No, not in the baseline.

Do not claim full Hopenhayn stationary equilibrium. Use Hopenhayn/Klette--Kortum only as conceptual inspiration for dynamic firm/innovation language.

## Decision 4: Should \(p_m\) be endogenous?

**Final decision:** Yes.

The CMO service market should be closed in the baseline:

\[
D_m(p_m;M)=S_m(p_m).
\]

This determines:

\[
p_m^*(M).
\]

This is the minimal market closure needed for the mechanism.

## Decision 5: Should \(\zeta^E\) be introduced?

**Final decision:** Yes, but only as a composite or derived route-realization object.

Do not claim separate structural identification of \(\zeta^E\) unless there is direct realization-probability data.

Use:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

If identification is weak, calibrate or discuss \(\mathcal V_i^E\), not \(\zeta_i^E\) alone.

## Decision 6: How to treat post-production risk?

**Final decision:** Baseline should not model multiple post-production risks separately.

Use one risk-adjusted payoff:

\[
\widetilde R_i^E.
\]

If needed, in appendix define:

\[
\omega_i\sim F_{post}^E,\qquad \widetilde R_i^E=\mathbb E[R(\omega_i)+v].
\]

Do not create separate state variables for sales, after-sales, pharmacovigilance, penalties, or partner default.

## Decision 7: Should Phase III production-partner timing be general baseline?

**Final decision:** No.

The general model should allow both integrated and research-oriented firms.

Use firm-specific route feasibility:

\[
\mathcal R_i(M)=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1,q_i^E=1\}.
\]

In the empirical module or research-oriented subsample, impose:

\[
h_i^I=0.
\]

Do not impose no internal production for all firms.

## Decision 8: Deterministic route choice or logit?

**Final decision:** If route-share calibration is used, use logit inclusive value in the baseline.

\[
\Gamma_i(M)=\sigma_r\log\sum_r\exp(G_i^r/\sigma_r).
\]

Deterministic max is the limiting case:

\[
\sigma_r\to0.
\]

Do not mix deterministic comparative statics with logit calibration.

## Decision 9: Should \(S_i\) be exogenous?

**Final decision:** Baseline may keep \(S_i\) exogenous for tractability, but the paper should add a GHM hold-up discussion.

Preferred conceptual extension:

\[
S_i=S_i(\text{best retained outside option}).
\]

MAH can raise the transfer price by improving the innovator's outside option.

## Decision 10: How to use GHM property-rights theory?

**Final decision:** Add as theoretical foundation.

Interpret MAH as improving the research firm's outside option in bargaining with producers or buyers. This reduces hold-up and raises ex-ante R&D incentives.

This does not require a full bargaining model in the baseline, but the mechanism should be stated.

## Decision 11: What should be the main proposition?

**Final decision:** The main proposition should be sorting, not weak option-value.

Avoid making this the main result:

\[
\max\{I,E,T,A\}\geq \max\{I,T,A\}.
\]

Instead, state conditions under which high-\(a\), low-\(k\), low-\(\mu^E\), CMO-accessible firms respond most strongly.

## Decision 12: What should Codex edit first?

**Final decision:** Codex should first update notes, not the main text.

Then Codex should make local edits in this order:

1. symbols and definitions;
2. route payoff;
3. route choice and \(\Gamma\);
4. observed realization;
5. CMO market closure;
6. propositions;
7. calibration mapping.

Do not ask Codex to rewrite the whole paper from all reviews.
