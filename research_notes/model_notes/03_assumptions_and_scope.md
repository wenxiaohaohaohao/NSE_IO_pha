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
