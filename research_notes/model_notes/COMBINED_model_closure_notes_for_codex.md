# Combined Model Closure Notes for Codex

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
MAH\Rightarrow \mathcal R_i(M)\text{ changes}\Rightarrow \tau^E(M)\downarrow\Rightarrow \Gamma_i(M,p_m^*(M))\uparrow\Rightarrow x_i^*(M)\uparrow\Rightarrow \lambda_i^{obs}(M)\uparrow.
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
\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E.
\]

Then:

\[
G_i^E=\mathcal V_i^E(M,p_m^*(M))-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

### Interpretation

- \(\zeta_i^E(M,p_m)\): route-realization / landing probability component.
- \(\widetilde R_i^E\): risk-adjusted post-production payoff.
- \(\zeta_i^E\widetilde R_i^E\): composite route-realization value.

### Identification warning

Without additional data, do **not** claim separate identification of \(\zeta_i^E\) and \(\widetilde R_i^E\).

## 6. Route choice

Choose one route-choice framework for the baseline.

### Recommended if route-share calibration is used

Use logit route choice:

\[
P_i(r\mid M,p_m^*(M))=\frac{\exp(G_i^r(M,p_m^*(M))/\sigma_r)}{\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell(M,p_m^*(M))/\sigma_r)}.
\]

Inclusive value:

\[
\Gamma_i(M,p_m^*(M))=\sigma_r\log\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell(M,p_m^*(M))/\sigma_r).
\]

### Deterministic version

Use only as limiting case:

\[
\Gamma_i(M,p_m^*(M))=\max_{r\in\mathcal R_i(M)}G_i^r(M,p_m^*(M))\quad \text{as }\sigma_r\to0.
\]

Do not mix deterministic comparative statics with logit calibration unless the deterministic case is explicitly stated as a limit.

## 7. Output objects

### Latent opportunity arrival

\[
\lambda_i^{latent}(M)=a_i x_i^*(M).
\]

### Observed realization

\[
\lambda_i^{obs}(M)=\lambda_i^{latent}(M)\sum_{r\in\mathcal R_i(M)}P_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

If focusing on entrusted route:

\[
\lambda_i^{obs,E}(M)=a_i x_i^*(M)P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M)).
\]

## 8. Current unresolved issues

| Issue | Decision status |
|---|---|
| Whether to include GHM hold-up in main model | Should be included conceptually; may be formalized lightly. |
| Whether to endogenize transfer value \(S_i\) | Recommended as extension or main proposition if manageable. |
| Whether \(\zeta^E\) is primitive or composite | Composite / route-realization object. |
| Whether to model post-production risk distribution explicitly | Baseline uses risk-adjusted payoff; distribution discussion can go to appendix. |


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
\theta_i=(a_i,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T).
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
D_m(p_m;M)=
\int
a_i x_i^*(M,p_m)
P_i(E\mid M,p_m)
\zeta_i^E(M,p_m)
dH_i.
\]

Do not write this as \(\lambda_i^{obs}P_i(E\mid M)\). The object \(\lambda_i^{obs}\) already aggregates over route probabilities and realization probabilities, so multiplying it by \(P_i(E\mid M)\) would double-count route choice. The CMO market uses latent opportunity arrival times the entrusted-route probability times entrusted-route realization.

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
\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E.
\]

\[
G_i^E(M,p_m)=\mathcal V_i^E(M,p_m)-p_m-\tau^E(M)-\mu_i^E.
\]

Alternative expanded notation:

\[
G_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E-p_m-\tau^E(M)-\mu_i^E.
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
P_i(r\mid M,p_m^*(M))=\frac{\exp(G_i^r(M,p_m^*(M))/\sigma_r)}{\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell(M,p_m^*(M))/\sigma_r)}.
\]

\[
\Gamma_i(M,p_m^*(M))=\sigma_r\log\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell(M,p_m^*(M))/\sigma_r).
\]

Deterministic limit:

\[
\Gamma_i(M,p_m^*(M))=\max_{r\in\mathcal R_i(M)}G_i^r(M,p_m^*(M)).
\]

Use this only as a limiting case or in a separate deterministic version.

## 6. R&D choice

Problem:

\[
\max_{x_i\ge0}\left\{\beta a_i x_i \Gamma_i(M,p_m^*(M))-\frac{\kappa}{2}x_i^2\right\}.
\]

FOC:

\[
x_i^*(M)=\frac{\beta a_i}{\kappa}\Gamma_i(M,p_m^*(M)).
\]

Latent opportunity arrival:

\[
\lambda_i^{latent}(M)=a_i x_i^*(M)=\frac{\beta a_i^2}{\kappa}\Gamma_i(M,p_m^*(M)).
\]

## 7. Observed realization

General:

\[
\lambda_i^{obs}(M)=a_i x_i^*(M)\sum_{r\in\mathcal R_i(M)}P_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

Entrusted-route component:

\[
\lambda_i^{obs,E}(M)=a_i x_i^*(M)P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M)).
\]

## 8. Comparative-static chain

MAH affects observed realization through:

\[
M\Rightarrow \mathcal R_i(M)\Rightarrow G_i^E(M,p_m^*(M))\Rightarrow P_i(E\mid M,p_m^*(M)),\Gamma_i(M,p_m^*(M))\Rightarrow x_i^*(M)\Rightarrow \lambda_i^{obs}(M).
\]

With CMO feedback:

\[
M\Rightarrow D_m(\cdot;M)\uparrow\Rightarrow p_m^*(M)\uparrow\Rightarrow G_i^E\downarrow\quad \text{partial offset}.
\]


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
- high composite realization value \(\mathcal V_i^E(M,p_m^*(M))\);
- access to a CMO market where \(p_m^*(M)\) does not rise too much.

## 3. CMO price feedback

Any MAH comparative static for entrusted-route value should include:

\[
\frac{dG_i^E}{dM}=\frac{d\mathcal V_i^E(M,p_m^*(M))}{dM}-\frac{dp_m^*(M)}{dM}-\frac{d\tau^E(M)}{dM}-\frac{d\mu_i^E}{dM}.
\]

Baseline can set \(d\mu_i^E/dM=0\), but this must be stated.

If \(dp_m^*(M)/dM\) is large, the MAH effect is partially offset.

## 4. Composite realization value

If using:

\[
\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E,
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
\Gamma_i(M,p_m^*(M))=\sigma_r\log\sum_r\exp(G_i^r(M,p_m^*(M))/\sigma_r),
\]

then all R&D comparative statics must use this \(\Gamma_i(M,p_m^*(M))\).

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
x_i^*(M)=\frac{\beta a_i}{\kappa}\Gamma_i(M,p_m^*(M)).
\]

Therefore:

\[
\frac{dx_i^*}{dM}=\frac{\beta a_i}{\kappa}\frac{d\Gamma_i(M,p_m^*(M))}{dM}.
\]

Observed realization:

\[
\lambda_i^{obs}(M)=a_i x_i^*(M)\sum_rP_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

Its derivative includes:

1. R&D intensity response;
2. route probability response;
3. realization probability response.

## 7. Conditions for strict positive effect

A strict MAH effect requires at least one of the following:

1. \(E\) becomes feasible and has positive choice probability;
2. \(\tau^E(M)\) falls enough;
3. \(\mathcal V_i^E(M,p_m^*(M))\) rises enough;
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
P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M)).
\]

If the data are holder-producer split shares among realized original-drug products, the moment is downstream of both route choice and realization. It can discipline \(P_i(E\mid M,p_m^*(M))\) alone only after conditioning on comparable realized retained products and imposing additional assumptions on route-specific realization probabilities.

If logit:

\[
\log\frac{P_i(E)}{P_i(I)}=\frac{G_i^E-G_i^I}{\sigma_r}.
\]

Disciplined object:

\[
\frac{G_i^E-G_i^I}{\sigma_r}.
\]

This may include:

\[
p_m^*(M),\quad \tau^E(M),\quad \mu_i^E,\quad C^I(k_i),\quad \mathcal V_i^E(M,p_m^*(M))-R_i^I.
\]

Not separately identified:

\[
\tau^E,\quad \mu_i^E,\quad p_m^*,\quad C^I(k_i),\quad \zeta_i^E,\quad \bar R_i^E,\quad \sigma_r
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
\lambda_i^{latent}=a_i x_i^*=\frac{\beta a_i^2}{\kappa}\Gamma_i(M,p_m^*(M)).
\]

Observed model object:

\[
\lambda_i^{obs}=a_i x_i^*\sum_rP_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

Disciplined object:

\[
\frac{\beta a_i^2}{\kappa}\Gamma_i(M,p_m^*(M))\sum_rP_i(r\mid M,p_m^*(M))\zeta_i^r(M,p_m^*(M)).
\]

Not separately identified:

\[
a_i,\quad \kappa,\quad \Gamma_i(M,p_m^*(M)),\quad \zeta_i^r.
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
\zeta_i^E(M,p_m)\quad \text{or}\quad \mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E.
\]

Baseline warning:

If no separate data on expected payoff \(\widetilde R_i^E\), discipline only a composite route-realization object.

## 7. Recommended calibration table

| Block | Data moment | Model moment | Disciplined object | Identification warning |
|---|---|---|---|---|
| Route use | Holder-producer split | \(P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M))\) | Relative route-realization wedge | Cannot isolate \(\tau^E,\mu_i^E,p_m^*,\zeta_i^E\) |
| Innovation counts | IND/NDA/original approvals | \(\lambda_i^{obs}\) | Innovation-realization scale | Cannot isolate \(a_i,\kappa,\Gamma,\zeta\) |
| CMO capacity | Qualified manufacturers / B-license firms | \(S_m(p_m)\) | CMO supply shifter/slope | Price may be proxied imperfectly |
| Realization risk | approval/launch conversion | \(\zeta_i^E\) or composite value | route-realization object | Separate \(\zeta\) only with conversion data and payoff/route-choice normalizations |
| Entry activation | new research-oriented firms | \(N_E(M)\) | activation threshold | Not full free entry |


# 06_bellman_accounting.md

# 06 Bellman Accounting

This file fixes payoff accounting and prevents double counting.

## 1. Main risk

The model uses several payoff objects:

\[
R_t,\quad \widetilde R_i^E,\quad v_t,\quad \pi n_{it},\quad b_i^r,\quad G_i^r,\quad \Gamma_i(M,p_m^*(M)).
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
| \(\Gamma_i(M,p_m^*(M))\) | value of successful opportunity after route choice at the equilibrium CMO service price | yes | R&D FOC |

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
G_i^E=\mathcal V_i^E(M,p_m^*(M))-p_m^*(M)-\tau^E(M)-\mu_i^E.
\]

where:

\[
\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E.
\]

If \(\widetilde R_i^E\) includes continuation value \(v\), state it explicitly.

Alternative:

\[
G_i^E=\zeta_i^E(M,p_m^*(M))(R_i^E+v)-p_m^*(M)-\tau^E(M)-\mu_i^E.
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
\max_{x_i\ge0}\left\{\beta a_i x_i \Gamma_i(M,p_m^*(M))-\frac{\kappa}{2}x_i^2\right\}.
\]

This is valid only after \(\Gamma_i(M,p_m^*(M))\) is defined as the value of a successful opportunity including the route choice, CMO service-market price, and continuation accounting.

## 7. Required manuscript clarification

When writing the Bellman, explicitly state:

> The route payoff \(b_i^r\) is a non-stock payoff. The continuation value of retaining a drug is accounted for separately through \(v\rho^r\). Therefore, \(R_t\) is not a lifetime value and does not double-count the retained-stock continuation value.


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
\mathcal V_i^E(M,p_m)=\zeta_i^E(M,p_m)\widetilde R_i^E.
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
\Gamma_i(M,p_m^*(M))=\sigma_r\log\sum_r\exp(G_i^r(M,p_m^*(M))/\sigma_r).
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


# 08_model_closure_audit.md

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


# 09_file_layering_rules.md

# File Layering Rules for the MAH Model

## Purpose

The complete model should be supported by three different layers:

| Layer | Location | Role |
|---|---|---|
| Main text | `paper/manuscript/mah_route_indicator_friction_model.tex` | Short reader-facing model statement and paper argument. |
| Technical appendix | `paper/manuscript/mah_route_indicator_friction_model_appendix.tex` | Formal derivations, object-status audit, proof details, CMO closure, and calibration boundaries. |
| Model notes | `research_notes/model_notes/` | Model-design control panel for Codex and the author. |

The main text should not carry the full construction history. The appendix should not carry internal work notes. The model notes should not be treated as polished manuscript prose.

## Promotion Rule

New model ideas should move through the layers in this order:

1. First enter `research_notes/model_notes/`.
2. If the idea passes closure, payoff-accounting, and claim-boundary checks, it can enter the technical appendix.
3. Only the minimal version needed for the paper's central claim should enter the main text.

## What Belongs in Each Layer

### Main text

Keep:

- core institutional mechanism;
- route set;
- entrusted-route payoff;
- logit route choice;
- CMO market closure;
- R&D choice;
- observed realization equation;
- key comparative statics;
- minimum empirical interpretation.

Exclude:

- long equation audits;
- alternative derivations;
- missing-data workarounds;
- detailed calibration recipes;
- future entry modules unless they directly support a current claim.

### Technical appendix

Keep:

- object-status table;
- CES background for the market-return object;
- post-production risk interpretation;
- CMO market regularity conditions;
- Bellman payoff accounting;
- closed-form derivation;
- comparative-static derivations;
- route-share and count-moment mapping;
- entry module as future or sensitivity.

Exclude:

- informal revision history;
- notes to Codex;
- suggested text fragments;
- unresolved brainstorms.

### Model notes

Keep:

- model closure decisions;
- symbol dictionary;
- equation dependency map;
- assumptions and scope limits;
- calibration mapping;
- disputed-review decision log;
- future modifications before they are promoted.

Exclude:

- final manuscript prose unless it is clearly marked as draft text;
- duplicated appendix sections unless needed for audit.

## Current Working Principle

The short main-text file is necessary but not sufficient. The complete model is supported by:

\[
\text{main text} + \text{technical appendix} + \text{model notes}.
\]

This separation preserves model completeness without making the main paper read like a construction memo.


# 10_main_appendix_consistency_audit.md

# 10 Main-Appendix Consistency Audit

Audit date: 2026-06-11

This note records the consistency audit between the reader-facing main text and the formal technical appendix. It is a control document for future model edits, not a new model module.

## 1. Completion standard

A manuscript edit passes this audit only if:

1. The equation chain is consistent across the main text, technical appendix, and model notes.
2. Every endogenous object has a determining equation or a stated closure rule.
3. Every composite object has a claim boundary.
4. No main result relies on a deterministic route maximum except as the \(\sigma_r\to0\) limit.
5. The main paper and appendix compile without LaTeX errors, undefined references, or undefined citations.

## 2. Equation-chain audit

| Block | Main text status | Appendix status | Audit result |
|---|---|---|---|
| Firm type | Defines \(\theta_i=(a_i,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T)\). | Defines \(h_i^I,q_i^E,S_i,\tau_i^T,\mu_i^E\) and the full incumbent distribution. | Pass after notes update. |
| Route set | \(\mathcal R_i(M)=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1,q_i^E=1\}\). | Same route-set logic in the formal model. | Pass. |
| Entrusted payoff | \(G_i^E(M,p_m)=\zeta_i^E(M,p_m)[\bar R_i^E+v]-p_m-\tau_i^E(M)-\mu_i^E\). | Same payoff structure with dynamic timing and equilibrium \(p_m^*\). | Pass after appendix notation fix. |
| CMO market closure | \(D_m(p_m;M)=S_m(p_m)\), determining \(p_m^*(M)\). | Same closure; no product-market or R&D-input market clearing. | Pass. |
| Route choice | Logit throughout; deterministic max only as \(\sigma_r\to0\). | Same logit formulation and limit interpretation. | Pass. |
| R&D choice | \(x_i^*(M)=\beta a_i\Gamma_i(M,p_m^*(M))/\kappa\). | Same closed-form solution in dynamic and stationary notation. | Pass. |
| Latent vs observed output | Observed output uses \(P_i(r\mid M,p_m^*)\zeta_i^r(M,p_m^*)\). | Appendix observed-output equations now use the same equilibrium-price evaluation. | Pass after appendix notation fix. |
| Comparative statics | Main proposition gives the direct route-friction derivative, holding \(\zeta_i^E\) and \(p_m\) fixed. | Appendix gives the fuller derivative allowing \(\zeta_i^E\) to vary with route friction. | Pass because the main text states the narrower derivative condition. |
| Calibration boundary | Route shares and original-drug counts discipline composite wedges, not primitive frictions separately. | Same boundary stated in calibration blueprint and data-mapping sections. | Pass. |

## 3. Issues fixed in this audit

| Issue | Why it mattered | Fix |
|---|---|---|
| Main text firm type initially omitted \(\tau_i^T\). | The transfer payoff used \(\tau_i^T\), so the primitive list was incomplete. | Added \(\tau_i^T\) to main-text \(\theta_i\). |
| Main text and appendix mixed \(\zeta_i^E(M)\) and \(\zeta_i^E(M,p_m)\). | The CMO price channel affects both entrusted-route payoff and observed realization, so the price argument must be visible in key equations. | Main text and appendix now use \(\zeta_i^E(M,p_m)\) or \(\zeta_i^E(M,p_m^*(M))\) in payoff, demand, and observed-output equations. |
| Notes omitted \(q_i^E\) from the firm-type vector. | The route set uses \(q_i^E\) to determine entrusted-route feasibility. | Added \(q_i^E\) to `01_symbols_and_objects.md` and `02_equation_dependency_map.md`. |
| Aggregate implication was too close to an unconditional observed-output claim. | Latent opportunities and observed realized outcomes are distinct objects. | Main text now separates the latent-opportunity implication from the additional observed-realization condition. |

## 4. Allowed shorthand

The notation \(P_i(r\mid M)\), \(\Gamma_i(M)\), or \(\zeta_i^E(M)\) may be used only after the text has explicitly stated that objects are evaluated at the equilibrium CMO service price \(p_m^*(M)\). In equations that define CMO demand, entrusted payoff, or observed output, the preferred notation is explicit:

\[
P_i(r\mid M,p_m^*(M)),\qquad
\Gamma_i(M,p_m^*(M)),\qquad
\zeta_i^E(M,p_m^*(M)).
\]

This convention keeps the model narrow while still showing how CMO service-market scarcity attenuates the MAH route-value effect.

## 5. Claim boundary retained

The current manuscript still deliberately does not claim:

- product-market general equilibrium;
- R&D input-market clearing;
- full free-entry equilibrium;
- exit or invariant firm distribution;
- full bargaining solution;
- welfare theorem;
- separate structural identification of \(\tau^E,\mu^E,\zeta^E,\bar R^E,a_i,\kappa\) from approval records alone.

The correct claim remains: MAH changes the feasible retained commercialization route and its composite route-realization value; this changes logit route choice, the inclusive value of a successful original-drug opportunity, R&D effort, latent opportunity arrival, and observed realized outcomes subject to CMO price feedback and realization probabilities.

## 6. Validation record

Commands run after the audit fixes:

```powershell
.\paper\build.ps1 -KeepBuild
.\paper\build_appendix.ps1 -KeepBuild
```

Results:

| Artifact | Output | Final log status |
|---|---|---|
| Main paper | `paper/output/mah_route_indicator_friction_model.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |
| Technical appendix | `paper/output/mah_route_indicator_friction_model_appendix.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |

Non-blocking environment notes:

- MiKTeX prints update-check notices.
- MiKTeX also reports a local log-directory write-permission warning for some auxiliary program logs.
- These are environment/logging warnings, not source-file compilation failures.


# 11_proposition_dependency_audit.md

# 11 Proposition Dependency Audit

Audit date: 2026-06-12

This note checks whether each proposition and corollary relies only on objects that are closed in the baseline model or explicitly declared exogenous, composite, or optional.

## 1. Audit rule

A proposition is allowed in the baseline only if every object it uses is in one of these categories:

| Category | Examples | Allowed treatment |
|---|---|---|
| Closed endogenous object | \(p_m^*(M)\), \(P_i(r\mid M,p_m^*(M))\), \(\Gamma_i(M,p_m^*(M))\), \(x_i^*(M)\), \(\lambda_i^{obs,*}(M)\) | Must be determined by equations already in the model. |
| Primitive / exogenous object | \(a_i,\kappa,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T\), firm distributions | May enter comparative statics, but not be claimed as identified from approval records alone. |
| Composite object | \(\zeta_i^E(M,p_m)\), \(\bar R_i^E\), route-realization wedge | May be disciplined by moments; should not be claimed as separately identified. |
| Optional module | \(F_e\), \(N_E\), application-to-approval conversion, richer CMO supply | May appear in appendix or sensitivity discussion; not a baseline empirical conclusion. |
| Out of scope | product-market GE, R&D input-market GE, full free entry, exit, invariant distribution, welfare | Should not support propositions. |

## 2. Proposition-level audit

| Location | Result | Dependency status | Audit decision |
|---|---|---|---|
| Main Proposition: Logit-weighted R&D response | \(\partial x_i^*/\partial\tau_i^E=-(\beta a_i/\kappa)P_i(E\mid M,p_m)\) holding \(p_m,\zeta_i^E\), and other payoffs fixed. | Uses closed logit route probability and R&D FOC; holds non-closed price feedback and realization changes fixed. | Pass. Main text correctly states this is the direct route-friction channel. |
| Main Proposition: Observed entrusted-route decomposition | Decomposes \(\dd\lambda_i^{obs,E}\) into R&D intensity, route probability, and realization probability terms. | Uses closed \(x_i^*\), \(P_i(E\mid M,p_m^*)\), and composite \(\zeta_i^E(M,p_m^*)\). | Pass after notation fix. |
| Main Proposition: CMO price attenuation | Upward-sloping CMO supply implies reform-induced entrusted demand can raise \(p_m^*(M)\), attenuating route value. | Uses the only closed market \(D_m(p_m;M)=S_m(p_m)\) and the entrusted payoff term \(-p_m\). | Pass. It is an attenuation claim, not a full GE result. |
| Main Corollary: Aggregate implication | Fixed firm distribution; latent aggregate effect requires positive \(\Gamma_i(M,p_m^*)\) response not offset by CMO price feedback; observed outcomes require route-use and realization terms. | Uses fixed distribution, closed \(\Gamma\), and composite realization terms. | Pass after notation fix. |
| Appendix Proposition: Logit-weighted R&D response | Lower \(\tau_i^E\) weakly raises latent R&D opportunity arrival through logit inclusive value. | Uses closed logit route choice, R&D FOC, \(\partial\zeta_i^E/\partial\tau_i^E\le0\), and \(\bar R_i^E+v\ge0\). | Pass after adding the explicit sign condition. |
| Appendix Proposition: Entrusted-route realized-output decomposition | Same decomposition as main text with formal proof. | Uses closed \(x_i^*\), route probability, and composite realization probability. | Pass. |
| Appendix Corollary: Deterministic sorting as a limit | Hard cutoff appears only as \(\sigma_r\to0\). | Uses a limiting case of the logit model. | Pass. Not a baseline choice rule. |
| Appendix Corollary: Baseline fixed-incumbent implication | Fixed incumbent distribution; lower \(\tau^E\) weakly raises incumbent latent opportunities when CMO price feedback is held fixed or not offsetting. | Uses closed incumbent R&D response. Entry module is explicitly marked optional. | Pass after narrowing the corollary from aggregate-with-entry to incumbent baseline. |

## 3. Issues fixed in this audit

1. Main observed-output decomposition used \(P_i(E\mid M)\) in the differential while the model defines route probabilities at the equilibrium service price. It now uses \(P_i(E\mid M,p_m^*(M))\).
2. Main aggregate corollary used \(\Gamma_i(M)\) shorthand in a key claim. It now uses \(\Gamma_i(M,p_m^*(M))\).
3. The main calibration table used \(P_i(E\mid M)\zeta_i^E(M,p_m^*(M))\). It now uses \(P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M))\).
4. Appendix logit-weighted R&D response required an explicit sign condition for the realization-probability channel. The text now states \(\bar R_i^E+v\ge0\) and \(\partial\zeta_i^E/\partial\tau_i^E\le0\).
5. Appendix aggregate corollary mixed baseline incumbent response with optional potential-entry response. It now states the baseline result for fixed incumbents and keeps entry as an optional module requiring a credible firm-year entry panel.
6. Model notes now use explicit \(p_m^*(M)\) notation in key comparative-static formulas.

## 4. Current claim boundary

The propositions support the following claims:

- Direct route-friction reductions raise R&D incentives only through the logit-weighted inclusive value channel.
- The response is heterogeneous because route feasibility, internal production capability, residual holder responsibility, CMO service scarcity, outside options, and realization probability differ across firms.
- Observed approvals or launches are downstream realized outcomes, not direct observations of latent idea arrival.
- CMO market clearing can attenuate the MAH effect through \(p_m^*(M)\).
- Entry algebra can be shown as an optional appendix module, but entry is not a baseline empirical conclusion without firm-year entry data.

The propositions do not support:

- universal innovation gains;
- welfare claims;
- full general equilibrium;
- full free-entry equilibrium;
- separate identification of \(\tau^E,\mu^E,\zeta^E,\bar R^E,a_i,\kappa\) from approval-side records alone.

## 5. Validation record

Commands run after the audit fixes:

```powershell
.\paper\build.ps1 -KeepBuild
.\paper\build_appendix.ps1 -KeepBuild
```

Results:

| Artifact | Output | Final log status |
|---|---|---|
| Main paper | `paper/output/mah_route_indicator_friction_model.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |
| Technical appendix | `paper/output/mah_route_indicator_friction_model_appendix.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |

Keyword checks:

- No active manuscript proposition uses `P_i(E\mid M)` or `P_i(r\mid M)` without the equilibrium price argument.
- No active manuscript proposition treats the deterministic maximum as the baseline route-choice model.
- No active manuscript proposition uses entry as a baseline empirical conclusion.
- Remaining shorthand hits occur only in audit notes, warnings against double counting, or the stated deterministic-limit example.


# 12_calibration_claim_audit.md

# 12 Calibration Claim Audit

Audit date: 2026-06-12

## 1. Audit question

This audit checks whether every calibration or empirical-moment statement claims only what the current model can support.

The required boundary is:

\[
\text{approval-side realized data discipline composite objects, not primitive frictions separately.}
\]

The audit applies to:

- the main text calibration section;
- the technical appendix calibration blueprint;
- route-use log-odds mapping;
- original-drug count mapping;
- optional entry-cost mapping;
- `05_calibration_mapping.md`.

## 2. Completion criteria

A calibration statement passes only if:

1. route-use or holder-producer split moments are mapped to a relative route-realization wedge, not directly to primitive \(\tau^E\);
2. realized original-drug counts are mapped to a composite innovation-realization scale, not directly to latent idea arrival;
3. \(\zeta_i^E\), \(\bar R_i^E\), \(p_m^*\), \(\mu_i^E\), \(a_i\), and \(\kappa\) are not claimed to be separately identified from approval-side data alone;
4. entry-cost calibration is explicitly optional unless a credible firm-year research-entry panel is available;
5. demand-side controls are described as background controls or proxies for payoff conditions, not as a fourth MAH mechanism.

## 3. Findings before correction

| Location | Issue | Risk |
|---|---|---|
| Technical appendix, pre-post route-use log-odds | The equation used \(\Delta\tau/\sigma_r\). | Could be read as direct identification of primitive \(\tau^E\) from route-share data. |
| Technical appendix, calibration table | \(\tau^E\) and \(\zeta_i^E\) rows were too close to primitive-object calibration. | Could blur composite route-use wedge with separate legal cost or realization probability. |
| Technical appendix, mechanism chain | The chain used unconditional upward arrows for \(\Gamma\), \(x^*\), aggregate latent opportunities, and entry. | Could imply MAH mechanically increases innovation or entry despite CMO price feedback and optional entry status. |
| Technical appendix, demand-side language | Demand-side controls were said to discipline \(R^{event}\) and \(\bar R^E\). | Could imply demand variables identify a demand-side MAH channel. |
| `05_calibration_mapping.md`, route-use block | The model object was written as \(P_i(E\mid M,p_m^*)\). | Realized holder-producer split data are downstream of route choice and realization. |
| `05_calibration_mapping.md`, count block | The count mapping used \(\Gamma_i\) without the equilibrium CMO price argument. | Weaker consistency with the closed model notation. |

## 4. Corrections made

1. Replaced the pre-post route-use expression with:

\[
\frac{\Delta\omega_E}{\sigma_r}
=
\log\left(\frac{s_{post}^E}{1-s_{post}^E}\right)
-
\log\left(\frac{s_{pre}^E}{1-s_{pre}^E}\right).
\]

Here \(\Delta\omega_E\) is a change in the relative entrusted-route payoff wedge. It equals \(\tau_{pre}^E-\tau_{post}^E\) only under restrictive normalizations that hold CMO prices, residual holder burden, internal production cost, realization probability, route-specific realized return, and retained continuation value fixed.

2. Rewrote the appendix calibration table so route-use moments discipline an effective entrusted-route wedge containing \(\tau^E\), rather than primitive \(\tau^E\) itself.

3. Rewrote the \(\zeta_i^E\) row so approval-to-launch or application-to-approval conversion data are the direct realization moments; holder-producer split shares discipline \(\zeta_i^E\) only jointly with route choice.

4. Rewrote the mechanism chain from deterministic arrows to conditional statements:

\[
\tau^E \downarrow,\;\zeta^E\text{ may improve},\;p_m^*\text{ adjusts}
\Rightarrow
\Gamma\text{ rises only if net entrusted-route value rises}.
\]

The chain now treats aggregate incumbent response and entry as conditional, not automatic.

5. Replaced demand-side "discipline" language with "proxy or condition" language.

6. Updated `05_calibration_mapping.md` so realized route-use moments map to:

\[
P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M)).
\]

## 5. Current pass/fail status

| Object or claim | Status | Reason |
|---|---|---|
| Route-use moments | Pass | They now discipline a relative route-realization wedge, not primitive \(\tau^E\). |
| Realized original-drug counts | Pass | They discipline a composite innovation-realization scale. |
| \(\zeta_i^E\) | Pass | It is explicitly composite and not separately identified without additional conversion/payoff data. |
| \(p_m^*(M)\) | Pass | It remains an endogenous CMO service-market price, not a product-market price. |
| Demand-side controls | Pass | They are background controls or proxies, not an MAH mechanism. |
| Entry module | Pass | It remains optional or sensitivity-only without a credible firm-year entry panel. |

## 6. Future editing rule

Any future calibration paragraph should avoid the following language unless a new data source and identifying restriction are explicitly added:

- "estimate \(\tau^E\)";
- "identify \(\zeta_i^E\)";
- "recover \(a_i\)";
- "calibrate entry" from approval records alone;
- "MAH raises demand";
- "route share identifies legal cost".

Preferred language:

- "discipline a composite route-realization wedge";
- "discipline an innovation-realization scale";
- "condition on demand-side payoff proxies";
- "entry is a future or sensitivity module";
- "approval-side records are realized outcomes, not latent idea arrivals."


# README_for_codex.md

# Model Notes for Codex: MAH Route-Choice Model Closure

## Purpose

This folder is the model-closure control panel for the MAH paper. It is not the main manuscript and not the formal appendix. Do **not** scatter unstable derivations directly into the main text.

The current target is **not** a full GE model, **not** a full free-entry model, and **not** a full Hopenhayn/Klette--Kortum dynamic industry model.

The target is:

\[
\boxed{\text{partial-equilibrium dynamic route-choice model}+\text{CMO service-market closure}+\text{composite route-realization value}+\text{Bellman payoff accounting}}
\]

## File layering

The complete model is supported by three layers:

| Layer | Location | Role |
|---|---|---|
| Main text | `paper/manuscript/mah_route_indicator_friction_model.tex` | Short reader-facing model statement and paper argument. |
| Technical appendix | `paper/manuscript/mah_route_indicator_friction_model_appendix.tex` | Formal derivations, object-status audit, proof details, CMO closure, and calibration boundaries. |
| Model notes | `research_notes/model_notes/` | Model-design control panel for Codex and the author. |

## Required workflow

1. Put new model ideas in `research_notes/model_notes/` first.
2. Check primitives, composite objects, equation dependencies, Bellman accounting, and claim boundaries.
3. Promote only stable formal derivations to the technical appendix.
4. Promote only the minimal reader-facing version needed for the paper's central claim to the main text.
5. Codex should make local, section-specific edits only. Do not ask Codex to rewrite the entire manuscript from all reviews at once.

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
| `08_model_closure_audit.md` | Final pre-edit audit table: object status, equation chain, claim boundaries, and minimal reality mechanisms. |
| `09_file_layering_rules.md` | Rules for separating main text, technical appendix, and model notes. |
| `10_main_appendix_consistency_audit.md` | Audit record for consistency between the reader-facing main text, the technical appendix, and the model notes. |
| `11_proposition_dependency_audit.md` | Audit record checking that each proposition depends only on closed, exogenous, composite, or explicitly optional objects. |
| `12_calibration_claim_audit.md` | Audit record checking that calibration moments discipline only composite objects unless additional data justify stronger identification. |

## Core instruction for Codex

Before modifying the main `.tex`, check whether the proposed edit is consistent with:

1. `00_model_closure_status.md`
2. `01_symbols_and_objects.md`
3. `02_equation_dependency_map.md`
4. `06_bellman_accounting.md`
5. `07_revision_decision_log.md`
6. `08_model_closure_audit.md`
7. `09_file_layering_rules.md`
8. `10_main_appendix_consistency_audit.md`
9. `11_proposition_dependency_audit.md`
10. `12_calibration_claim_audit.md`

If not consistent, do not edit the manuscript. Update the notes first.

