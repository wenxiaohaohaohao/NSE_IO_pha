# 11 Proposition Dependency Audit

This audit records the assumptions and upstream equations required by each current result.

## 1. Dependency classes

| Class | Objects |
|---|---|
| Maintained primitives | \(a_i,\kappa,\beta,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T,\sigma_r\) |
| Policy objects | binary \(M\), continuous \(\eta\), and \(\tau_i^E(\eta)\) |
| Endogenous CMO object | \(p_m^*(M,\eta)\) |
| Endogenous firm objects | \(P_i(r),\Gamma_i,x_i^*,\lambda_i^{plan,*},\lambda_i^{obs}\) |
| Composite realization | \(\zeta_i^r=s_i\chi_i^r\) |
| Fixed aggregation objects | firm distribution \(H_i\) and support-market cell definition \(m\) |

## 2. Proposition-level audit

| Result | Required dependencies | Valid claim | Boundary |
|---|---|---|---|
| Existence and uniqueness of the CMO support cost | Continuous finite demand and supply; compact support-cost domain; boundary crossing; strictly decreasing excess demand | A unique \(p_m^*(M,\eta)\) clears qualified support | No other market is closed |
| Discrete route-set expansion | \(q_i^E=1\); fixed \(p_m\), \(\eta\), and old-route payoffs; logit inclusive value | Adding feasible route \(E\) strictly raises the inclusive value at fixed support cost | Finite comparison in \(M\), not a derivative or full equilibrium sign |
| Implementation intensity and CMO attenuation | \(M=1\); \(G_{i\eta}^E\ge0\); \(G_{ip}^E<0\); IFT conditions; \(D_{m\eta}^{tot}\ge0\) for a nonnegative support-cost response | Direct implementation gains are attenuated by the endogenous rise in qualified-support cost | Total R&D effect is positive only if the direct term dominates |
| Logit-weighted R&D response | \(\beta\in(0,1)\), \(\kappa>0\), logit route choice, entrusted route feasible | Lower entrusted friction weakly raises effort and planning-stage arrival, weighted by \(P_i(E)\) | Does not directly sign observed approvals |
| Entrusted realized-output decomposition | \(\lambda_i^{obs,E}=a_i x_i^*P_i(E)\zeta_i^E\) | Changes split into effort, route-choice, and realization components | Approval-side outcomes are not planning-stage arrival |
| Research and manufacturing heterogeneity | \(C_k^I<0\), internal route feasible, fixed-cost direct comparison where stated | High \(a_i\) scales response; high \(k_i\) lowers entrusted-route relevance | Cross-partial sign requires the stated independence restrictions |
| Aggregate implication | Fixed firm distribution, positive-measure affected set, no offsetting support-cost or realization movement | Aggregate planning-stage or observed outcomes may rise under explicit sufficient conditions | Private-value and realized-output result, not welfare or general equilibrium |

## 3. Core derivative chain

Conditional on \(M=1\),

\[
G_{i\eta}^E
=(\bar R_i^E+v)\zeta_{i\eta}^E-\tau_{i\eta}^E,
\qquad
G_{ip}^E
=(\bar R_i^E+v)\zeta_{ip}^E-1.
\]

CMO clearing gives

\[
\frac{dp_m^*}{d\eta}
=\frac{D_{m\eta}^{tot}}{S_{mp}-D_{mp}^{tot}},
\]

and therefore

\[
\frac{d\Gamma_i}{d\eta}
=P_i(E)
\left[
G_{i\eta}^E
+G_{ip}^E\frac{dp_m^*}{d\eta}
\right],
\qquad
\frac{dx_i^*}{d\eta}
=\frac{\beta a_i}{\kappa}\frac{d\Gamma_i}{d\eta}.
\]

Every equilibrium implementation proposition must carry both the direct term and the support-cost feedback term.

## 4. Observed-outcome dependency

For route \(E\),

\[
d\lambda_i^{obs,E}
=a_iP_i(E)\zeta_i^E\,dx_i^*
+a_ix_i^*\zeta_i^E\,dP_i(E)
+a_ix_i^*P_i(E)\,d\zeta_i^E.
\]

An observed-output proposition must therefore state assumptions on all three margins. A positive planning-stage effect does not mechanically imply a positive realized-output effect.

## 5. Calibration dependencies

The observed holder--producer share requires aggregate realized weights. The narrow-cell log-odds equation requires exactly comparable \(I\) and \(E\) retained routes and includes relative realization:

\[
\log\frac{s_{iE}^{obs}}{1-s_{iE}^{obs}}
=\frac{G_i^E-G_i^I}{\sigma_r}
+\log\frac{\zeta_i^E}{\zeta_i^I}.
\]

This equation cannot be promoted to a heterogeneous aggregate proposition.

## 6. Failure conditions

A proposition fails the dependency audit if it:

1. differentiates \(M\);
2. suppresses \(\eta\) in the equilibrium support-cost comparison;
3. omits background support demand or final realization timing;
4. inserts \(\zeta_i^E\) into planning-stage support demand;
5. treats \(q_i^E\) as a secured match;
6. treats the Bellman transition as a realized identity;
7. assumes a positive total effect without checking support-cost attenuation;
8. maps aggregate observed shares to a representative-firm payoff gap;
9. claims welfare or full-industry equilibrium.

## 7. Audit conclusion

The current propositions are internally closed under their stated assumptions. Their strongest common boundary is conditionality: the model establishes route-value and response mechanisms, not universal positive innovation, separate primitive identification, or welfare.
