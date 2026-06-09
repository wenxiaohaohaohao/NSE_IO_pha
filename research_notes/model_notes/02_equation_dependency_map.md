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
