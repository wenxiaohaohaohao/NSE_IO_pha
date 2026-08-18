# 00 Model Closure Status

## Authority and baseline

The current authorities are:

1. `paper/manuscript/mah_route_indicator_friction_model.tex`
2. `paper/manuscript/mah_route_indicator_friction_model_appendix.tex`

The baseline is a partial-equilibrium commercialization-route model. It closes only the market for qualified contract-manufacturing support. Product markets, R&D input markets, entry, exit, and the firm distribution remain exogenous or outside the baseline.

## Policy and timing

- \(M\in\{0,1\}\) is a binary route-availability regime. Compare \(M=0\) and \(M=1\) by a finite route-set change; never differentiate \(M\).
- Conditional on \(M=1\), \(\eta\in[0,1]\) is continuous implementation intensity. Set \(\eta=0\) when \(M=0\).
- \(q_i^E=1\) means technical and regulatory eligibility for qualified entrusted production. It does not mean that a producer match has already been secured.
- \(a_i x_i\) is the expected number of projects reaching route planning and manufacturing preparation. It is not an already successful, approved, or launched-drug count.
- For retained route \(r\in\{I,E\}\), preserve
  \[
  \zeta_i^r=s_i\chi_i^r,
  \]
  where \(s_i\) is common downstream clinical and regulatory success and \(\chi_i^r\) is route-specific implementation conditional on that success.

## Route value and R&D

The entrusted payoff is

\[
G_i^E(\eta,p_m)
=\zeta_i^E(\eta,p_m)(\bar R_i^E+v)
-p_m-\tau_i^E(\eta)-\mu_i^E.
\]

Planning-stage costs are not multiplied by \(\zeta_i^E\). Logit route choice and the inclusive value are

\[
P_i(r\mid M,\eta,p_m)
=\frac{\exp(G_i^r/\sigma_r)}
{\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r)},
\qquad
\Gamma_i(M,\eta,p_m)
=\sigma_r\log\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r).
\]

At equilibrium,

\[
x_i^*(M,\eta)
=\frac{\beta a_i}{\kappa}
\Gamma_i(M,\eta,p_m^*(M,\eta)),
\qquad \beta\in(0,1).
\]

## CMO support-market closure

One project planning route \(E\) demands one support package before final realization:

\[
D_m^{tot}(p_m;M,\eta)
=D_m^B(p_m)
+\int a_i x_i^*(M,\eta,p_m)
P_i(E\mid M,\eta,p_m)\,dH_i.
\]

Do not multiply this demand by \(\zeta_i^E\). The equilibrium support cost is the unique solution

\[
D_m^{tot}(p_m^*;M,\eta)=S_m(p_m^*),
\qquad p_m^*=p_m^*(M,\eta),
\]

under continuity, boundary crossing, and strictly decreasing excess demand. At an interior differentiable equilibrium, the implicit-function theorem gives

\[
\frac{d p_m^*}{d\eta}
=\frac{D_{m\eta}^{tot}}{S_{mp}-D_{mp}^{tot}}.
\]

## Observed outcomes and calibration

Observed retained output is downstream of planning-stage arrival:

\[
\lambda_i^{obs,ret}
=a_i x_i^*
\sum_{r\in\mathcal R_i^{ret}(M)}P_i(r)\zeta_i^r.
\]

The observed holder--producer share is an aggregate realized-weighted ratio:

\[
s_E^{obs}
=\frac{\int a_i x_i^*P_i(E)\zeta_i^E\,dH_i}
{\int a_i x_i^*\sum_{r\in\mathcal R_i^{ret}(M)}P_i(r)\zeta_i^r\,dH_i}.
\]

It is not the product of one route probability and one realization probability. Only for a homogeneous firm or sufficiently narrow cell with exactly routes \(I\) and \(E\) may one use

\[
\log\frac{s_{iE}^{obs}}{1-s_{iE}^{obs}}
=\frac{G_i^E-G_i^I}{\sigma_r}
+\log\frac{\zeta_i^E}{\zeta_i^I}.
\]

## Claim boundary

- The Bellman stock transition is a conditional expectation, not a realized identity.
- Jia et al. provide the approval-delay/review-capacity alternative; Barwick et al. provide the demand/market-size alternative.
- The model supports private route-value, R&D, sorting, and realized-output comparative statics. It is not a welfare theorem or a full-industry equilibrium.
- Closure status: complete within this stated partial-equilibrium scope, conditional on the maintained CMO regularity assumptions and calibration normalizations.
