# 11 Proposition Dependency Audit

Audit date: 2026-06-12

This note checks whether each proposition and corollary relies only on objects that are closed in the baseline model or explicitly declared exogenous, composite, or optional.

## 1. Audit rule

A proposition is allowed in the baseline only if every object it uses is in one of these categories:

| Category | Examples | Allowed treatment |
|---|---|---|
| Closed endogenous object | \(p_m^*(M)\), \(P_i(r\mid M,p_m^*(M))\), \(\Gamma_i(M,p_m^*(M))\), \(x_i^*(M)\), \(\lambda_i^{obs,*}(M)\) | Must be determined by equations already in the model. |
| Primitive / exogenous object | \(a_i,\kappa,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T\), firm distributions | May enter comparative statics, but not be claimed as identified from approval records alone. |
| Composite object | \(\zeta_i^E(M,p_m)\), \(\bar R_i^E\), route-realization wedge | May be disciplined by moments; should not be claimed as separately identified. |
| Optional module | \(F_e\), \(N_E\), application-to-approval conversion, richer CMO supply | May appear in appendix or sensitivity discussion; not a baseline empirical conclusion. |
| Out of scope | product-market GE, R&D input-market GE, full free entry, exit, invariant distribution, welfare | Should not support propositions. |

## 2. Proposition-level audit

| Location | Result | Dependency status | Audit decision |
|---|---|---|---|
| Main Proposition: Logit-weighted R&D response | \(\partial x_i^*/\partial\tau_i^E=-(\beta a_i/\kappa)P_i(E\mid M,p_m)\) holding \(p_m,\zeta_i^E\), and other payoffs fixed. | Uses closed logit route probability and R&D FOC; holds non-closed price feedback and realization changes fixed. | Pass. Main text correctly states this is the direct route-friction channel. |
| Main Proposition: Observed entrusted-route decomposition | Decomposes \(\dd\lambda_i^{obs,E}\) into R&D intensity, route probability, and realization probability terms. | Uses closed \(x_i^*\), \(P_i(E\mid M,p_m^*)\), and composite \(\zeta_i^E(M,p_m^*)\). | Pass after notation fix. |
| Main Proposition: CMO price attenuation | Upward-sloping CMO supply implies reform-induced entrusted demand can raise \(p_m^*(M)\), attenuating route value. | Uses the only closed market \(D_m(p_m;M)=S_m(p_m)\) and the entrusted payoff term \(-p_m\). | Pass. It is an attenuation claim, not a full GE result. |
| Main Corollary: Aggregate implication | Fixed firm distribution; latent aggregate effect requires positive \(\Gamma_i(M,p_m^*)\) response not offset by CMO price feedback; observed outcomes require route-use and realization terms. | Uses fixed distribution, closed \(\Gamma\), and composite realization terms. | Pass after notation fix. |
| Appendix Proposition: Logit-weighted R&D response | Lower \(\tau_i^E\) weakly raises latent R&D opportunity arrival through logit inclusive value. | Uses closed logit route choice, R&D FOC, \(\partial\zeta_i^E/\partial\tau_i^E\le0\), and \(\bar R_i^E+v\ge0\). | Pass after adding the explicit sign condition. |
| Appendix Proposition: Entrusted-route realized-output decomposition | Same decomposition as main text with formal proof. | Uses closed \(x_i^*\), route probability, and composite realization probability. | Pass. |
| Appendix Corollary: Deterministic sorting as a limit | Hard cutoff appears only as \(\sigma_r\to0\). | Uses a limiting case of the logit model. | Pass. Not a baseline choice rule. |
| Appendix Corollary: Baseline fixed-incumbent implication | Fixed incumbent distribution; lower \(\tau^E\) weakly raises incumbent latent opportunities when CMO price feedback is held fixed or not offsetting. | Uses closed incumbent R&D response. Entry module is explicitly marked optional. | Pass after narrowing the corollary from aggregate-with-entry to incumbent baseline. |

## 3. Issues fixed in this audit

1. Main observed-output decomposition used \(P_i(E\mid M)\) in the differential while the model defines route probabilities at the equilibrium service price. It now uses \(P_i(E\mid M,p_m^*(M))\).
2. Main aggregate corollary used \(\Gamma_i(M)\) shorthand in a key claim. It now uses \(\Gamma_i(M,p_m^*(M))\).
3. The main calibration table used \(P_i(E\mid M)\zeta_i^E(M,p_m^*(M))\). It now uses \(P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M))\).
4. Appendix logit-weighted R&D response required an explicit sign condition for the realization-probability channel. The text now states \(\bar R_i^E+v\ge0\) and \(\partial\zeta_i^E/\partial\tau_i^E\le0\).
5. Appendix aggregate corollary mixed baseline incumbent response with optional potential-entry response. It now states the baseline result for fixed incumbents and keeps entry as an optional module requiring a credible firm-year entry panel.
6. Model notes now use explicit \(p_m^*(M)\) notation in key comparative-static formulas.

## 4. Current claim boundary

The propositions support the following claims:

- Direct route-friction reductions raise R&D incentives only through the logit-weighted inclusive value channel.
- The response is heterogeneous because route feasibility, internal production capability, residual holder responsibility, CMO service scarcity, outside options, and realization probability differ across firms.
- Observed approvals or launches are downstream realized outcomes, not direct observations of latent idea arrival.
- CMO market clearing can attenuate the MAH effect through \(p_m^*(M)\).
- Entry algebra can be shown as an optional appendix module, but entry is not a baseline empirical conclusion without firm-year entry data.

The propositions do not support:

- universal innovation gains;
- welfare claims;
- full general equilibrium;
- full free-entry equilibrium;
- separate identification of \(\tau^E,\mu^E,\zeta^E,\bar R^E,a_i,\kappa\) from approval-side records alone.

## 5. Validation record

Commands run after the audit fixes:

```powershell
.\paper\build.ps1 -KeepBuild
.\paper\build_appendix.ps1 -KeepBuild
```

Results:

| Artifact | Output | Final log status |
|---|---|---|
| Main paper | `paper/output/mah_route_indicator_friction_model.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |
| Technical appendix | `paper/output/mah_route_indicator_friction_model_appendix.pdf` | No LaTeX error, undefined citation, undefined reference, hyperref warning, overfull box, or rerun warning in the final log. |

Keyword checks:

- No active manuscript proposition uses `P_i(E\mid M)` or `P_i(r\mid M)` without the equilibrium price argument.
- No active manuscript proposition treats the deterministic maximum as the baseline route-choice model.
- No active manuscript proposition uses entry as a baseline empirical conclusion.
- Remaining shorthand hits occur only in audit notes, warnings against double counting, or the stated deterministic-limit example.
