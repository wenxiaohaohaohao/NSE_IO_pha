# 12 Calibration Claim Audit

Audit date: 2026-06-12

## 1. Audit question

This audit checks whether every calibration or empirical-moment statement claims only what the current model can support.

The required boundary is:

\[
\text{approval-side realized data discipline composite objects, not primitive frictions separately.}
\]

The audit applies to:

- the main text calibration section;
- the technical appendix calibration blueprint;
- route-use log-odds mapping;
- original-drug count mapping;
- optional entry-cost mapping;
- `05_calibration_mapping.md`.

## 2. Completion criteria

A calibration statement passes only if:

1. route-use or holder-producer split moments are mapped to a relative route-realization wedge, not directly to primitive \(\tau^E\);
2. realized original-drug counts are mapped to a composite innovation-realization scale, not directly to latent idea arrival;
3. \(\zeta_i^E\), \(\bar R_i^E\), \(p_m^*\), \(\mu_i^E\), \(a_i\), and \(\kappa\) are not claimed to be separately identified from approval-side data alone;
4. entry-cost calibration is explicitly optional unless a credible firm-year research-entry panel is available;
5. demand-side controls are described as background controls or proxies for payoff conditions, not as a fourth MAH mechanism.

## 3. Findings before correction

| Location | Issue | Risk |
|---|---|---|
| Technical appendix, pre-post route-use log-odds | The equation used \(\Delta\tau/\sigma_r\). | Could be read as direct identification of primitive \(\tau^E\) from route-share data. |
| Technical appendix, calibration table | \(\tau^E\) and \(\zeta_i^E\) rows were too close to primitive-object calibration. | Could blur composite route-use wedge with separate legal cost or realization probability. |
| Technical appendix, mechanism chain | The chain used unconditional upward arrows for \(\Gamma\), \(x^*\), aggregate latent opportunities, and entry. | Could imply MAH mechanically increases innovation or entry despite CMO price feedback and optional entry status. |
| Technical appendix, demand-side language | Demand-side controls were said to discipline \(R^{event}\) and \(\bar R^E\). | Could imply demand variables identify a demand-side MAH channel. |
| `05_calibration_mapping.md`, route-use block | The model object was written as \(P_i(E\mid M,p_m^*)\). | Realized holder-producer split data are downstream of route choice and realization. |
| `05_calibration_mapping.md`, count block | The count mapping used \(\Gamma_i\) without the equilibrium CMO price argument. | Weaker consistency with the closed model notation. |

## 4. Corrections made

1. Replaced the pre-post route-use expression with:

\[
\frac{\Delta\omega_E}{\sigma_r}
=
\log\left(\frac{s_{post}^E}{1-s_{post}^E}\right)
-
\log\left(\frac{s_{pre}^E}{1-s_{pre}^E}\right).
\]

Here \(\Delta\omega_E\) is a change in the relative entrusted-route payoff wedge. It equals \(\tau_{pre}^E-\tau_{post}^E\) only under restrictive normalizations that hold CMO prices, residual holder burden, internal production cost, realization probability, route-specific realized return, and retained continuation value fixed.

2. Rewrote the appendix calibration table so route-use moments discipline an effective entrusted-route wedge containing \(\tau^E\), rather than primitive \(\tau^E\) itself.

3. Rewrote the \(\zeta_i^E\) row so approval-to-launch or application-to-approval conversion data are the direct realization moments; holder-producer split shares discipline \(\zeta_i^E\) only jointly with route choice.

4. Rewrote the mechanism chain from deterministic arrows to conditional statements:

\[
\tau^E \downarrow,\;\zeta^E\text{ may improve},\;p_m^*\text{ adjusts}
\Rightarrow
\Gamma\text{ rises only if net entrusted-route value rises}.
\]

The chain now treats aggregate incumbent response and entry as conditional, not automatic.

5. Replaced demand-side "discipline" language with "proxy or condition" language.

6. Updated `05_calibration_mapping.md` so realized route-use moments map to:

\[
P_i(E\mid M,p_m^*(M))\zeta_i^E(M,p_m^*(M)).
\]

## 5. Current pass/fail status

| Object or claim | Status | Reason |
|---|---|---|
| Route-use moments | Pass | They now discipline a relative route-realization wedge, not primitive \(\tau^E\). |
| Realized original-drug counts | Pass | They discipline a composite innovation-realization scale. |
| \(\zeta_i^E\) | Pass | It is explicitly composite and not separately identified without additional conversion/payoff data. |
| \(p_m^*(M)\) | Pass | It remains an endogenous CMO service-market price, not a product-market price. |
| Demand-side controls | Pass | They are background controls or proxies, not an MAH mechanism. |
| Entry module | Pass | It remains optional or sensitivity-only without a credible firm-year entry panel. |

## 6. Future editing rule

Any future calibration paragraph should avoid the following language unless a new data source and identifying restriction are explicitly added:

- "estimate \(\tau^E\)";
- "identify \(\zeta_i^E\)";
- "recover \(a_i\)";
- "calibrate entry" from approval records alone;
- "MAH raises demand";
- "route share identifies legal cost".

Preferred language:

- "discipline a composite route-realization wedge";
- "discipline an innovation-realization scale";
- "condition on demand-side payoff proxies";
- "entry is a future or sensitivity module";
- "approval-side records are realized outcomes, not latent idea arrivals."
