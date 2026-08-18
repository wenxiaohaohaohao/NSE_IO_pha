# 04 Comparative Statics Checklist

Use this checklist before stating any sign result.

## 1. Binary route-set change

Do not write a derivative with respect to \(M\). For an eligible project, hold \(p_m\), \(\eta\), and old-route payoffs fixed and use

\[
\Delta\Gamma_i^{set}
=\Gamma_i(1,\eta,p_m)-\Gamma_i(0,0,p_m)
=\sigma_r\log\left[
1+\frac{\exp(G_i^E(\eta,p_m)/\sigma_r)}
{\sum_{r\in\mathcal R_i(0)}\exp(G_i^r/\sigma_r)}
\right]>0.
\]

This is a finite option-value result. It does not by itself establish the equilibrium change in R&D or observed output.

## 2. Continuous post-MAH implementation

Conditional on \(M=1\),

\[
G_{i\eta}^E
=(\bar R_i^E+v)\zeta_{i\eta}^E-\tau_{i\eta}^E\ge0,
\]

\[
G_{ip}^E
=(\bar R_i^E+v)\zeta_{ip}^E-1<0.
\]

At fixed \(p_m\),

\[
\Gamma_{i\eta}=P_i(E)G_{i\eta}^E,
\qquad
x_{i\eta}^*=\frac{\beta a_i}{\kappa}P_i(E)G_{i\eta}^E.
\]

The direct response is stronger when \(a_i\) is high and route \(E\) receives more choice probability.

## 3. CMO support-cost feedback

Differentiate the support-market clearing condition, not a reduced-form price guess:

\[
\frac{dp_m^*}{d\eta}
=\frac{D_{m\eta}^{tot}}{S_{mp}-D_{mp}^{tot}}\ge0
\quad\text{when }D_{m\eta}^{tot}\ge0.
\]

The equilibrium opportunity-value response is

\[
\frac{d\Gamma_i}{d\eta}
=P_i(E)\left[
G_{i\eta}^E
+G_{ip}^E\frac{dp_m^*}{d\eta}
\right],
\]

and

\[
\frac{dx_i^*}{d\eta}
=\frac{\beta a_i}{\kappa}\frac{d\Gamma_i}{d\eta}.
\]

The first bracketed term is the direct implementation gain. The second is weakly negative support-cost attenuation. State a positive total effect only when the direct gain dominates.

## 4. Manufacturing-capability sorting

For firms with feasible internal production,

\[
\frac{\partial G_i^I}{\partial k_i}=-C_k^I(k_i)>0,
\]

\[
\frac{\partial P_i(E)}{\partial k_i}
=-\frac{P_i(E)P_i(I)}{\sigma_r}
\frac{\partial G_i^I}{\partial k_i}<0.
\]

Higher internal manufacturing capability weakens entrusted-route relevance; higher research productivity scales the R&D response.

## 5. Observed entrusted outcomes

For

\[
\lambda_i^{obs,E}=a_i x_i^*P_i(E)\zeta_i^E,
\]

the local decomposition is

\[
d\lambda_i^{obs,E}
=a_iP_i(E)\zeta_i^E\,dx_i^*
+a_ix_i^*\zeta_i^E\,dP_i(E)
+a_ix_i^*P_i(E)\,d\zeta_i^E.
\]

Observed approvals or launches can change through effort, route sorting, or realization. They are not direct measures of route-planning arrival.

## 6. Aggregate claims

Before making an aggregate statement, verify:

- the affected set has positive measure;
- the firm distribution is held fixed;
- support-cost feedback does not offset the direct gain;
- route-use and realization terms do not offset planning-stage growth;
- the claim is private-value or realized-output, not welfare.

## 7. Calibration restrictions

- Use the aggregate realized-weighted holder--producer share, not an unweighted average and not a representative-firm product.
- Use log odds only for a homogeneous or sufficiently narrow two-route \(I\)-\(E\) cell.
- Include \(\log(\zeta_i^E/\zeta_i^I)\) in that narrow-cell equation.
- When the entrusted route is unavailable before reform, treat the reform as route-set expansion; a zero-share pre-period log odds is not the baseline structural margin.

## 8. Prohibited shortcuts

Reject any result that:

1. differentiates the binary \(M\);
2. writes \(p_m^*\) without both regime and implementation arguments in a key comparison;
3. multiplies planning-stage CMO demand by \(\zeta_i^E\);
4. labels \(a_i x_i\) as successful, approved, or launched output;
5. treats \(q_i^E\) as an existing match;
6. converts an aggregate observed share into a representative-firm payoff gap;
7. omits equilibrium support-cost feedback from an equilibrium implementation result.
