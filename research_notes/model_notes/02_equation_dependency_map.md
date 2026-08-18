# 02 Equation Dependency Map

This file records the order in which the model is solved. Do not use a downstream object to define an upstream block.

## 1. Regime, intensity, and route set

\[
M\in\{0,1\},\qquad
\eta\in[0,1],\qquad
\eta=0\text{ when }M=0,
\]

\[
\mathcal R_i(M)
=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1,\ q_i^E=1\}.
\]

The change in \(M\) is a finite route-set expansion. Derivatives are taken with respect to \(\eta\) conditional on \(M=1\).

## 2. Timing and retained realization

\[
\lambda_i^{plan}(x_i)=a_i x_i,
\qquad
\zeta_i^r(\eta,p_m)=s_i\chi_i^r(\eta,p_m).
\]

The first equation ends at route planning. The second maps a planned retained route into downstream realization. These objects must not be collapsed.

## 3. Route payoffs

\[
G_i^I=\zeta_i^I(R_i^{event}+v)-C^I(k_i),
\]

\[
G_i^E(\eta,p_m)
=\zeta_i^E(\eta,p_m)(\bar R_i^E+v)
-p_m-\tau_i^E(\eta)-\mu_i^E,
\]

\[
G_i^T=S_i-\tau_i^T,
\qquad
G_i^A=0.
\]

The route-planning costs \(C^I\), \(p_m\), \(\tau_i^E\), and \(\mu_i^E\) are not multiplied by \(\zeta_i^r\).

## 4. Route choice, inclusive value, and off-equilibrium R&D

At a candidate support cost \(p_m\),

\[
P_i(r\mid M,\eta,p_m)
=\frac{\exp(G_i^r/\sigma_r)}
{\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r)},
\]

\[
\Gamma_i(M,\eta,p_m)
=\sigma_r\log
\sum_{\ell\in\mathcal R_i(M)}\exp(G_i^\ell/\sigma_r),
\]

\[
x_i^*(M,\eta,p_m)
=\frac{\beta a_i}{\kappa}\Gamma_i(M,\eta,p_m).
\]

The logit location normalization is part of the definition of \(\Gamma_i\). Deterministic route choice is only the \(\sigma_r\to0\) limit.

## 5. Qualified CMO support market

\[
D_m^{tot}(p_m;M,\eta)
=D_m^B(p_m)
+\int a_i x_i^*(M,\eta,p_m)
P_i(E\mid M,\eta,p_m)\,dH_i,
\]

\[
S_m(p_m)=\int s_j(p_m;z_j^C)\,dH_C(j).
\]

Support is reserved at route planning, so \(\zeta_i^E\) does not enter demand. Define

\[
Z_m(p_m;M,\eta)=D_m^{tot}(p_m;M,\eta)-S_m(p_m).
\]

Continuity, boundary crossing, and strict decrease of \(Z_m\) imply a unique

\[
p_m^*(M,\eta):
\quad
D_m^{tot}(p_m^*;M,\eta)=S_m(p_m^*).
\]

At a differentiable interior equilibrium,

\[
\frac{dp_m^*}{d\eta}
=-\frac{Z_{m\eta}}{Z_{mp}}
=\frac{D_{m\eta}^{tot}}{S_{mp}-D_{mp}^{tot}}.
\]

## 6. Equilibrium effort and outcomes

Evaluate all route objects at \(p_m^*(M,\eta)\):

\[
x_i^*(M,\eta)
=\frac{\beta a_i}{\kappa}
\Gamma_i(M,\eta,p_m^*(M,\eta)),
\]

\[
\lambda_i^{plan,*}(M,\eta)=a_i x_i^*(M,\eta),
\]

\[
\lambda_i^{obs,ret}(M,\eta)
=a_i x_i^*
\sum_{r\in\mathcal R_i^{ret}(M)}P_i(r)\zeta_i^r,
\]

\[
\lambda_i^{obs,E}(M,\eta)
=a_i x_i^*P_i(E)\zeta_i^E.
\]

## 7. Calibration-facing share equations

For a comparable realized retained-product sample,

\[
s_E^{obs}
=\frac{\int a_i x_i^*P_i(E)\zeta_i^E\,dH_i}
{\int a_i x_i^*\sum_{r\in\mathcal R_i^{ret}(M)}
P_i(r)\zeta_i^r\,dH_i}.
\]

Only in a homogeneous or sufficiently narrow two-route \(I\)-\(E\) cell,

\[
\log\frac{s_{iE}^{obs}}{1-s_{iE}^{obs}}
=\frac{G_i^E-G_i^I}{\sigma_r}
+\log\frac{\zeta_i^E}{\zeta_i^I}.
\]

The aggregate share's log odds are not a representative-firm payoff gap.

## 8. Bellman link and full chain

The retained-stock transition is a conditional expectation:

\[
\mathbb E_t[n_{i,t+1}]
=(1-\delta)n_{it}
+a_i x_{it}\sum_rP_i(r)\rho^r\zeta_i^r.
\]

The solve order is

\[
(M,\eta,\theta_i)
\rightarrow
(\mathcal R_i,G_i^r)
\rightarrow
(P_i,\Gamma_i,x_i^*)\text{ at candidate }p_m
\rightarrow
p_m^*(M,\eta)
\rightarrow
(x_i^*,\lambda_i^{plan,*},\lambda_i^{obs})
\rightarrow
\text{aggregate calibration moments}.
\]
