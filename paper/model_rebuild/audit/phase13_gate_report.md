# Phase 13 Gate Report

- Phase: 13 - Complete Equation Dependency Map
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: a4c2a2bef96f09d62932d182c72cb6a389a88a97
- Overall gate: PASS
- P0: 0
- P1: 0

## 1. Equation coverage

| Phase | Catalog labels | Ledger rows | Result |
|---:|---:|---:|---|
| 1 | 10 | 10 | PASS |
| 2 | 9 | 9 | PASS |
| 3 | 7 | 7 | PASS |
| 4 | 11 | 11 | PASS |
| 5 | 11 | 11 | PASS |
| 6 | 11 | 11 | PASS |
| 7 | 5 | 5 | PASS |
| 8 | 18 | 18 | PASS |
| 9 | 5 | 5 | PASS |
| 10 | 2 | 2 | PASS |
| Total | 89 | 89 | PASS |

- Unique source equation labels: 89.
- Unique dependency-ledger equation labels: 89.
- Missing labels: 0.
- Extra labels: 0.
- Source file/line mismatches: 0.
- Ledger section numbering: 1--17 with no gap or duplicate.

## 2. Closed dependency graph

At a candidate capacity price \(p\), the graph evaluates in this order:

1. explicit route values;
2. deterministic route choice and optimized project value;
3. expected value \(\Omega_i\);
4. unique common advancement \(x_i^*\);
5. entrusted capacity per project and aggregate demand;
6. supplier capacity and aggregate supply;
7. the unique zero of \(Z_M(p)=D_m(p;M)-S_m(p)\); and
8. equilibrium evaluation at \(p_m^*\).

Every right-hand-side object is single valued conditional on \(p\). The only
feedback is the outer scalar root. No second market or arbitrary selection
rule is present.

## 3. Regularity audit

- deterministic ties have zero measure: PASS;
- dominated convergence/common integrable envelope: PASS;
- aggregate demand finite, continuous, and weakly decreasing: PASS;
- aggregate supply continuous and strictly increasing: PASS;
- \(Z_M(0)>0\): PASS;
- high-price \(Z_M(p)<0\): PASS;
- strict decrease of \(Z_M\): PASS;
- existence and uniqueness follow from the stated conditions: PASS.

The map states that failure of these conditions is a closure failure; it does
not treat regularity as an automatic conclusion.

## 4. Fixed-price versus equilibrium-price audit

- Binary \(M\) uses finite comparisons only: PASS.
- Local derivatives name continuous \(p_m\) or finite \(\tau_E\) and held-fixed
  objects: PASS.
- Fixed-price option-value gain is separated from equilibrium feedback: PASS.
- Under unchanged supply and nonnegative post-MAH study demand,
  \(p_m^*(1)\ge p_m^*(0)\): PASS.
- Strict price increase requires positive study demand at the pre-MAH price:
  PASS.
- Scarcity gives
  \(0\le\Delta\Omega_i^{eq}\le\Delta\Omega_i^{dir}\) and
  \(0\le\Delta x_i^{eq}\le\Delta x_i^{dir}\): PASS.
- No direct policy assumption \(M\to p_m^*\downarrow\) or
  \(M\to p_m^*\uparrow\): PASS.

## 5. Corrections made in Phase 13

Nine previously omitted equation labels were added to the semantic ledger:
the three Phase 1 causal/timing equations, Phase 2 pricing problem and SOC,
Phase 4 binary value effect and cutoff sorting, and Phase 5 FOC and value-gap
FOC.

The stale sentence saying that no cross-regime price sign was imposed was
removed. The corrected weak price order follows from approved Phase 6/8
assumptions and is explicitly identified as an equilibrium result.

## 6. Architecture and compile audit

- Only \(M\to\tau_E(M)\) is a direct policy arrow: PASS.
- Product and CMO prices remain distinct: PASS.
- No technology/capacity-payment double count: PASS.
- No logit, inclusive value, continuous \(\eta\), entry, welfare, or second
  market in the active graph: PASS.
- Extension graph has no arrow into baseline: PASS.
- v1.2 planning/realization order preserved: PASS.
- Phase 1--10 cumulative MiKTeX compile: PASS.
- Fatal errors, undefined references, duplicate labels, box warnings: 0.
- Manuscript diff against locked base: empty.
- Collaborator ZIP in rebuild worktree status: absent.

## 7. Traceability

| IDs | Result | Evidence |
|---|---|---|
| RL-01--RL-06 | PASS | dependency graph adds no taxonomy, entry, dynamics, household or welfare block |
| RL-07--RL-11 | PASS | policy, technology, realization, price and holder-right arrows are bounded |
| RL-12--RL-20 | PASS | prohibited mechanisms absent; notation and definition order audited |
| RL-21--RL-28 | PASS | \(x_i\), patent, novelty and contribution boundaries remain explicit |
| P13-D01 | PASS | 89-row complete semantic equation ledger plus source catalog |
| P13-G01 | PASS | scalar fixed point, solve order and regularity are explicit |
| QA-PROOF-05 | PASS | every comparative equation states the varied/held-fixed objects |
| QA-PROOF-06 | PASS | binary \(M\) uses finite comparisons |
| QA-PROOF-07 | PASS | fixed \(p_m\) and equilibrium \(p_m^*\) are separated |
| QA-PROOF-09 | PASS | fixed-point closure and regularity independently rederived |
| QA-PROOF-10 | PASS | cumulative compile and label audit pass |
| QA-ECON-01 | PASS | only the institutional route wedge is directly shifted |
| QA-ECON-04 | PASS | equilibrium price is used wherever equilibrium values are claimed |
| QA-ECON-05 | PASS | extensions remain quarantined |

## 8. Next phase

Recommended next action: under EXEC-GOV-001, record Phase 13 as APPROVED,
create and push its separate commit, then begin Phase 14’s four-class
assumption inventory and proposition--assumption matrix.
