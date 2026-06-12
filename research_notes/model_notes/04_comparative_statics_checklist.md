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
