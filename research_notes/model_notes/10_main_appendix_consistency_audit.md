# 10 Main-Appendix Consistency Audit

Audit date: 2026-06-11

This note records the consistency audit between the reader-facing main text and the formal technical appendix. It is a control document for future model edits, not a new model module.

## 1. Completion standard

A manuscript edit passes this audit only if:

1. The equation chain is consistent across the main text, technical appendix, and model notes.
2. Every endogenous object has a determining equation or a stated closure rule.
3. Every composite object has a claim boundary.
4. No main result relies on a deterministic route maximum except as the \(\sigma_r\to0\) limit.
5. The main paper and appendix compile without LaTeX errors, undefined references, or undefined citations.

## 2. Equation-chain audit

| Block | Main text status | Appendix status | Audit result |
|---|---|---|---|
| Firm type | Defines \(\theta_i=(a_i,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T)\). | Defines \(h_i^I,q_i^E,S_i,\tau_i^T,\mu_i^E\) and the full incumbent distribution. | Pass after notes update. |
| Route set | \(\mathcal R_i(M)=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1,q_i^E=1\}\). | Same route-set logic in the formal model. | Pass. |
| Entrusted payoff | \(G_i^E(M,p_m)=\zeta_i^E(M,p_m)[\bar R_i^E+v]-p_m-\tau_i^E(M)-\mu_i^E\). | Same payoff structure with dynamic timing and equilibrium \(p_m^*\). | Pass after appendix notation fix. |
| CMO market closure | \(D_m(p_m;M)=S_m(p_m)\), determining \(p_m^*(M)\). | Same closure; no product-market or R&D-input market clearing. | Pass. |
| Route choice | Logit throughout; deterministic max only as \(\sigma_r\to0\). | Same logit formulation and limit interpretation. | Pass. |
| R&D choice | \(x_i^*(M)=\beta a_i\Gamma_i(M,p_m^*(M))/\kappa\). | Same closed-form solution in dynamic and stationary notation. | Pass. |
| Latent vs observed output | Observed output uses \(P_i(r\mid M,p_m^*)\zeta_i^r(M,p_m^*)\). | Appendix observed-output equations now use the same equilibrium-price evaluation. | Pass after appendix notation fix. |
| Comparative statics | Main proposition gives the direct route-friction derivative, holding \(\zeta_i^E\) and \(p_m\) fixed. | Appendix gives the fuller derivative allowing \(\zeta_i^E\) to vary with route friction. | Pass because the main text states the narrower derivative condition. |
| Calibration boundary | Route shares and original-drug counts discipline composite wedges, not primitive frictions separately. | Same boundary stated in calibration blueprint and data-mapping sections. | Pass. |

## 3. Issues fixed in this audit

| Issue | Why it mattered | Fix |
|---|---|---|
| Main text firm type initially omitted \(\tau_i^T\). | The transfer payoff used \(\tau_i^T\), so the primitive list was incomplete. | Added \(\tau_i^T\) to main-text \(\theta_i\). |
| Main text and appendix mixed \(\zeta_i^E(M)\) and \(\zeta_i^E(M,p_m)\). | The CMO price channel affects both entrusted-route payoff and observed realization, so the price argument must be visible in key equations. | Main text and appendix now use \(\zeta_i^E(M,p_m)\) or \(\zeta_i^E(M,p_m^*(M))\) in payoff, demand, and observed-output equations. |
| Notes omitted \(q_i^E\) from the firm-type vector. | The route set uses \(q_i^E\) to determine entrusted-route feasibility. | Added \(q_i^E\) to `01_symbols_and_objects.md` and `02_equation_dependency_map.md`. |
| Aggregate implication was too close to an unconditional observed-output claim. | Latent opportunities and observed realized outcomes are distinct objects. | Main text now separates the latent-opportunity implication from the additional observed-realization condition. |

## 4. Allowed shorthand

The notation \(P_i(r\mid M)\), \(\Gamma_i(M)\), or \(\zeta_i^E(M)\) may be used only after the text has explicitly stated that objects are evaluated at the equilibrium CMO service price \(p_m^*(M)\). In equations that define CMO demand, entrusted payoff, or observed output, the preferred notation is explicit:

\[
P_i(r\mid M,p_m^*(M)),\qquad
\Gamma_i(M,p_m^*(M)),\qquad
\zeta_i^E(M,p_m^*(M)).
\]

This convention keeps the model narrow while still showing how CMO service-market scarcity attenuates the MAH route-value effect.

## 5. Claim boundary retained

The current manuscript still deliberately does not claim:

- product-market general equilibrium;
- R&D input-market clearing;
- full free-entry equilibrium;
- exit or invariant firm distribution;
- full bargaining solution;
- welfare theorem;
- separate structural identification of \(\tau^E,\mu^E,\zeta^E,\bar R^E,a_i,\kappa\) from approval records alone.

The correct claim remains: MAH changes the feasible retained commercialization route and its composite route-realization value; this changes logit route choice, the inclusive value of a successful original-drug opportunity, R&D effort, latent opportunity arrival, and observed realized outcomes subject to CMO price feedback and realization probabilities.

## 6. Validation record

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

Non-blocking environment notes:

- MiKTeX prints update-check notices.
- MiKTeX also reports a local log-directory write-permission warning for some auxiliary program logs.
- These are environment/logging warnings, not source-file compilation failures.
