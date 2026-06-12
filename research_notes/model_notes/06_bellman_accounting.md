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
