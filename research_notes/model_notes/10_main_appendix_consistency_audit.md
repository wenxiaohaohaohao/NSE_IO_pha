# 10 Main-Appendix Consistency Audit

## Authority

Audit against the current working-tree versions of:

1. paper/manuscript/mah_route_indicator_friction_model.tex
2. paper/manuscript/mah_route_indicator_friction_model_appendix.tex

The main text gives the shortest complete model. The appendix supplies timing, Bellman accounting, regularity, derivations, and calibration boundaries.

## 1. Cross-file consistency table

| Block | Required common content | Audit result |
|---|---|---|
| Baseline scope | Partial equilibrium; only the qualified CMO support market clears | Consistent |
| Policy decomposition | \(M\) is binary route availability; \(\eta\) is continuous implementation conditional on \(M=1\) | Consistent |
| Route set | \(E\) requires \(M=1\) and \(q_i^E=1\) | Consistent |
| Entrusted eligibility | \(q_i^E\) is technical and regulatory eligibility, not an existing match | Consistent |
| Discounting | \(\beta\in(0,1)\) | Consistent |
| R&D production | \(a_i x_i\) is route-planning-stage project arrival | Consistent |
| Retained realization | \(\zeta_i^r=s_i\chi_i^r\) | Consistent |
| Entrusted payoff | Realized return and continuation are realization-weighted; planning costs are not | Consistent |
| Route choice | Logit baseline with a location-normalized inclusive value | Consistent |
| Support demand | \(D_m^B+\int a_i x_i^*P_i(E)dH_i\), excluding final realization | Consistent |
| CMO equilibrium | Unique \(p_m^*(M,\eta)\) under stated regularity conditions | Consistent |
| Price feedback | IFT derivative with denominator \(S_{mp}-D_{mp}^{tot}\) | Consistent |
| R&D choice | Inclusive value evaluated at \(p_m^*(M,\eta)\) | Consistent |
| Bellman transition | Conditional expectation of next-period retained stock | Appendix formalizes the main-text timing |
| Observed output | Planning arrival multiplied by route choice and retained realization | Consistent |
| Observed share | Aggregate realized-weighted holder--producer ratio | Consistent |
| Log odds | Restricted to homogeneous or narrow two-route \(I\)-\(E\) cells and includes relative realization | Consistent |
| Alternative channels | Jia: approval delay; Barwick: demand | Consistent |

## 2. Canonical equations

The support market must be represented as

\[
D_m^{tot}(p_m;M,\eta)
=D_m^B(p_m)
+\int a_i x_i^*(M,\eta,p_m)
P_i(E\mid M,\eta,p_m)\,dH_i,
\]

\[
D_m^{tot}(p_m^*;M,\eta)=S_m(p_m^*),
\qquad
p_m^*=p_m^*(M,\eta).
\]

The observed share must be represented as

\[
s_E^{obs}
=\frac{\int a_i x_i^*P_i(E)\zeta_i^E\,dH_i}
{\int a_i x_i^*\sum_{r\in\mathcal R_i^{ret}(M)}
P_i(r)\zeta_i^r\,dH_i}.
\]

The narrow-cell log odds must be

\[
\log\frac{s_{iE}^{obs}}{1-s_{iE}^{obs}}
=\frac{G_i^E-G_i^I}{\sigma_r}
+\log\frac{\zeta_i^E}{\zeta_i^I}.
\]

## 3. Notation rule

In control notes and key comparative-static equations, spell out \(p_m^*(M,\eta)\). A local \(p_m^*\) abbreviation is allowed only after the text explicitly declares that both regime and implementation intensity are being held in its arguments.

Likewise, route probabilities and inclusive values should show \((M,\eta,p_m)\) when their dependence matters. Do not use notation that makes \(M\) look continuous or hides the equilibrium support-cost channel.

## 4. Claim boundary

Both manuscript layers maintain:

- no product-market or R&D-input-market clearing;
- no baseline free entry, exit, or invariant distribution;
- no separately identified primitive route-friction decomposition;
- no representative-firm reading of aggregate observed shares;
- no welfare theorem;
- no interpretation of approval-side counts as direct planning-stage arrivals.

## 5. Audit conclusion

The main text and appendix support the same model closure and calibration boundaries. The model notes must preserve that common formulation and must not reintroduce superseded one-variable policy notation, successful-arrival language, realization-weighted support demand, or representative-firm share shortcuts.
