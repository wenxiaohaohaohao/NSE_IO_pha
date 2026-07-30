# 06 Bellman Accounting

## 1. Timing

At time \(t\), firm \(i\) chooses \(x_{it}\). The next-period random count \(Y_{i,t+1}^{plan}\) satisfies

\[
\mathbb E_t[Y_{i,t+1}^{plan}]=a_i x_{it}.
\]

This is a conditional mean of projects reaching route planning, not a realized count of clinically successful, approved, or launched products.

## 2. Retained realization and stock transition

For retained route \(r\in\{I,E\}\),

\[
\zeta_i^r=s_i\chi_i^r,
\qquad
\rho^I=\rho^E=1,
\qquad
\rho^T=\rho^A=0.
\]

The correct transition is the conditional expectation

\[
\mathbb E_t[n_{i,t+1}]
=(1-\delta)n_{it}
+a_i x_{it}
\sum_{r\in\mathcal R_i(M_{t+1})}
P_i(r\mid M_{t+1},\eta_{t+1},p_{m,t+1}^*)
\rho^r\zeta_i^r(\eta_{t+1},p_{m,t+1}^*).
\]

Do not write this as a deterministic realized identity. A fully realized transition would sum project-level route and realization indicators over \(Y_{i,t+1}^{plan}\).

## 3. Distinct payoff objects

| Object | Meaning | Accounting rule |
|---|---|---|
| \(R_i^{event}\), \(\bar R_i^E\) | route-period commercialization payoff after realization | Excludes retained-stock continuation value |
| \(\pi n_{it}\) | current flow payoff from existing retained stock | Does not include the new project's route-period payoff |
| \(v_t\) | marginal continuation value of one additional retained realized product | Enters retained route values only through realization |
| \(G_i^r\) | planning-stage value of route \(r\) | Includes route payoff, continuation increment, and route-planning costs |
| \(\Gamma_{i,t+1}\) | logit inclusive value of one route-planning-stage project | Enters the R&D choice after taking the appropriate conditional expectation |

## 4. Route-value accounting

\[
G_i^I
=\zeta_i^I(R_i^{event}+v)-C^I(k_i),
\]

\[
G_i^E
=\zeta_i^E(\bar R_i^E+v)
-p_m^*(M,\eta)-\tau_i^E(\eta)-\mu_i^E.
\]

The planning-stage costs \(C^I\), \(p_m^*\), \(\tau_i^E\), and \(\mu_i^E\) are not multiplied by \(\zeta_i^r\). A success-contingent payment must first be converted to its planning-stage expected cost.

The transfer route is non-retained:

\[
G_i^T=S_i-\tau_i^T,
\qquad
G_i^A=0.
\]

## 5. Affine value and discounting

Maintain

\[
\beta\in(0,1),
\qquad
V_t(n_{it};\cdot)=A_t(\cdot)+v_t n_{it},
\]

with

\[
v_t=\pi+\beta(1-\delta)v_{t+1}.
\]

In a stationary bounded environment, \(\beta(1-\delta)<1\) keeps the marginal retained-stock value finite.

## 6. Reduced Bellman problem

After route payoffs and the logit inclusive value are defined, the Bellman equation reduces to

\[
\begin{aligned}
V_t(n_{it};\cdot)
=&\;\pi n_{it}
+\beta A_{t+1}
+\beta(1-\delta)v_{t+1}n_{it}\\
&+\max_{x_{it}\ge0}
\left\{
\beta a_i x_{it}
\mathbb E_t[
\Gamma_{i,t+1}(M_{t+1},\eta_{t+1},p_{m,t+1}^*)
]
-\frac{\kappa}{2}x_{it}^2
\right\}.
\end{aligned}
\]

The conditional expectation is essential when next-period regime, implementation, route fit, or support cost is not known at \(t\). In a stationary deterministic environment this simplifies to

\[
x_i^*(M,\eta)
=\frac{\beta a_i}{\kappa}
\Gamma_i(M,\eta,p_m^*(M,\eta)).
\]

## 7. No-double-counting checks

Before changing the Bellman block, verify:

1. common downstream success appears in \(s_i\), not again in \(a_i\);
2. route-specific implementation appears in \(\chi_i^r\), with \(\zeta_i^r=s_i\chi_i^r\);
3. continuation value is added only for retained realized routes;
4. existing-stock flow payoff is not included in the new-project route payoff;
5. route-planning costs are not realization-weighted;
6. CMO support demand is formed before final realization;
7. transfer and abandonment do not add to retained stock.
