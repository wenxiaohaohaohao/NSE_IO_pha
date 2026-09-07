# Phase 17 global consistency audit — PASS

Scope: approved current note+v1.1 modules, main/appendix candidates, registries, assumptions and empirical-boundary evidence. Historical source/crosswalk and explicit inactive extensions are not active baseline. No manuscript integration yet.

## Red-line evidence

| ID | Verdict | Evidence and semantic check |
|---|---|---|
| RL-01 | PASS | One common x; O/Inc appears only in rho_g F_g, not two innovation controls (01,05,08). |
| RL-02 | PASS | Only continuous (a,k) developer characteristics; I/E/T/A are project routes (01,04). |
| RL-03 | PASS | No portfolio state; one decision cohort and exogenous project distribution (01,07). |
| RL-04 | PASS | Fixed developer and supplier populations H,H_C; entry is inactive extension discussion (07,11). |
| RL-05 | PASS | H is exogenous, not an invariant distribution solved from transition laws (01,07). |
| RL-06 | PASS | Equilibrium collection has exactly p_m*,x_i*,r_i*,s_j*; no household/capital/BGP/welfare (07). |
| RL-07 | PASS | a_i is predetermined and invariant to M; Omega is the policy transmission (01,05). |
| RL-08 | PASS | A,q,F and manufacturing technologies do not depend on M (01–03). |
| RL-09 | PASS | s(q) is exogenous and invariant; typed s_g=s is explicit (01,08,09). |
| RL-10 | PASS | p_m^1>=p_m^0 is derived from old-price excess demand; not a direct policy shift (06,08,15). |
| RL-11 | PASS | E retains authorization; T is non-retained (01,03,04). |
| RL-12 | PASS | Baseline uses a deterministic argmax; logit proof is isolated in 11 and has no baseline dependency. |
| RL-13 | PASS | No eta command or implementation parameter in active modules/candidate; scope scan PASS. |
| RL-14 | PASS | Complete registry has no imported reference-paper state; B,K are accounting auxiliaries only (05). |
| RL-15 | PASS | All 38 protected source/manuscript hashes unchanged through this gate; integration not started. |
| RL-16 | PASS | Twelve interfaces expressly mark availability unverified and reject separate primitive identification (10). |
| RL-17 | PASS | Demand/pricing, KKT, cutoff, capacity, excess-demand and comparative-static derivations are mathematical prose/equations (02,04–08,15). |
| RL-18 | PASS | Common symbols and main p16m aliases agree with registry; full/module source hashes unchanged. |
| RL-19 | PASS | 01 defines core objects; technologies and route values precede 08 propositions; assumptions map lists actual dependencies. |
| RL-20 | PASS | Output/private surplus results explicitly disclaim welfare closure (07–09,15). |
| RL-21 | PASS | Canonical x definition is project-development / advancement intensity; upstream patent-generating effort excluded (01,05,main3.1/3.3). |
| RL-22 | PASS | No patent-increase prediction; patents outside endogenous outcomes (08–10,16 boundary). |
| RL-23 | PASS | Predetermined research capability is not upstream research effort; no scientific-research increase claim (01,05,09). |
| RL-24 | PASS | Novelty corollary and common-control decomposition permit zero class output; no mandatory original positivity (08,09). |
| RL-25 | PASS | x_i^R,x_i^D and finance allocation appear only in inactive extension 11; baseline uses one x (05,07). |
| RL-26 | PASS | Fresh Shi Gu tables establish divergent clinical/patenting margins; no contradiction asserted (08_shigu note, appendix boundary). |
| RL-27 | PASS | No original/incremental ranking without extra distributional restrictions; coefficient differences not claimed formally tested (08,16). |
| RL-28 | PASS | Financial resources are source heterogeneity, not an added primitive/control or organizing mechanism (16 boundary,11). |

## Sixteen consistency questions

1–4 PASS: Core occurrences are indexed with exact source lines. Definitions have a single economic interpretation; aliases do not create new objects. M is binary; tau_E is the only direct wedge. a,k,q,m,H,F,s and technologies remain primitives. x is a control; W/Omega are optimized values; p_m* is the equilibrium price, while p_m is its conjectured input. Product p*(c) is a conditional optimizer, not another clearing price.

5 PASS: Empirical interfaces are candidate measurements, not claims of available data or one-to-one identification.
6 PASS: Fixed-price cutoff and advancement results name held-fixed objects; equilibrium finite comparisons use p_m^0 and p_m^1; continuous IFT perturbations are not derivatives of M. nu>=1 is a sufficient condition for the capability response, not a general baseline restriction.
7 PASS: x, a*x planning measure, route, observed separation and retained products are distinguished. s_g=s preserves aggregation. A zero class surplus gain alone does not imply zero class outcome when common x rises.
8 PASS: I/E retain holder rights; T is the non-retained outside option. Null tie selections are not substantive effects.
9 PASS: Price is determined by supplier FOC and aggregate clearing; demand includes both route and advancement feedback.
10 PASS: No active stochastic route share or inclusive value; extension labels are not referenced by baseline.
11–16 PASS: x excludes upstream research; no patent/scientific/original increase is required. Novelty is an empirical classifier with conditional distributions, and Gu's financing mechanism remains outside baseline. Generic innovation wording in source history is not used to broaden the current control.

## Proof, dimension and boundary reconciliation

The six substantive propositions (sorting, relevant set, heterogeneous advancement, CMO existence/uniqueness, scarcity attenuation, observed outcomes) plus the novelty corollary retain their Phase 8 assumption/derivation/zero-case/economic-explanation blocks. Phase 15 supplies all comparative-static boundaries. QA-PROOF-01–04 are supported by independent Phase 2–8 and 15 gate reports; the seven specified limits are explicitly handled in 08_comparative_statics.tex section 9.7. Strict FOC/SOC statements use positive interiors, while KKT and finite comparisons handle corners. No finite cutoff is asserted without crossing; no uniform finite exclusion price is claimed on unbounded support. Supply monotonicity and aggregate continuity follow from the maintained primitives, no-tie condition and integrable envelopes, not assumed conclusions. D-CMO-05 provides the extra local differentiability used for IFT.

Currency, product, project-cohort and capacity units agree; p_m b is currency per project and is not counted in c_E. Positive mathematical reparameterizations and index aliases add no state. The symbol occurrence/catalog files give reproducible coverage; semantic judgments above supplement the scoped scan rather than treating raw keyword absence as proof.

## Source and build integrity

The Phase 15 source/PDF hashes are unchanged. Both candidate compilations and visual review pass (4 and 38 pages). All module and candidate labels are unique within their document, all references resolve, and baseline has no dependency on extension equations. The exact Shi Gu source hash matches the historical 74-page version and all seven facts have current page/table verification. Non-significance and untested cross-column differences remain qualified.

Stale current-status and reserved-symbol wording was reconciled; original ledgers preserved in audit/phase17_prior_* files. This changes bookkeeping, not approved mathematics. REV-001, REV-002, REV-P1-001 and REV-P0-016-01 are resolved within current scope. No P0/P1 remains. Phase 18 may proceed under REV-EXEC-001 only after this phase is committed and pushed, with backup before any manuscript mutation.
