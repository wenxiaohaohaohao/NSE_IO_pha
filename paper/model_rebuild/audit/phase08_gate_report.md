# Phase 8 Gate Report

- Phase: 8 - Six Required Propositions and Novelty Corollary
- Effective-spec SHA256: 855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: 5bf3940f3298738bafb33d82d8e08699144922a0
- Overall gate: PASS
- P0: 0
- P1: 0

## 1. Authorized-result count

| Formal result | Count | Gate |
|---|---:|---|
| substantive propositions | 6 | PASS |
| novelty-composition corollaries | 1 | PASS |
| additional substantive propositions | 0 | PASS |
| new markets or controls | 0 | PASS |

The corollary follows from the Proposition 2 positive-part identity and class
mixture. It is not presented as Proposition 7.

## 2. Proposition-by-proposition results

### Proposition 1 - organizational sorting

- Fixed objects: $q,m,M,p_m$ and all primitives except $k_i$: PASS.
- Derivative:
  $\Delta_{IE,k}=sR_cc_{I,k}-F_{I,k}>0$: PASS.
- Existence: continuity plus endpoint crossing: PASS.
- Uniqueness: strict monotonicity: PASS.
- Global route qualification: $I/E$ must also beat $T/A$: PASS.
- Boundaries: internal infeasibility, $k_i\to\infty$, and $M=0$: PASS.

### Proposition 2 - MAH-relevant project set

- Old and enlarged choice sets are explicit: PASS.
- Identity:
  $W_i^1-W_i^0=[W_i^E-W_i^0]_+$: PASS.
- Relevant set is exactly the strict-positive-gain set: PASS.
- Prohibitive CMO price preserves the old value: PASS.

### Proposition 3 - advancement and heterogeneity

- $\Delta x_i>0$ if and only if $\Delta\Omega_i>0$: PASS.
- Holding route values fixed,
  $\partial\Delta x_i/\partial a_i=\Delta x_i/(\nu a_i)>0$: PASS.
- Higher $k_i$ weakly raises the old value and weakly lowers entrusted
  surplus: PASS.
- The level-response sign uses the explicit sufficient condition $\nu\geq1$:
  PASS.
- No unconditional $k_i$ sign is claimed for $0<\nu<1$: PASS.
- The $\nu=1$ boundary gives
  $x_i^*=\beta a_i\Omega_i/\kappa$: PASS.
- No patent, basic-research, discovery or novelty outcome is inferred: PASS.

### Novelty-composition corollary

- Common $x_i$ and exogenous $\rho_gF_g$: PASS.
- $\Delta\Omega_{ig}=E_{F_g}[(W_i^E-W_i^0)_+]$: PASS.
- Reverse-support examples establish that either class ranking is possible:
  PASS.
- $\rho_O=0$ and $\rho_{\mathrm{Inc}}=0$ boundaries: PASS.
- No Shi Gu empirical ranking is imposed on primitives: PASS.

### Proposition 4 - CMO existence and uniqueness

- Continuous excess demand crosses zero: PASS.
- Weakly decreasing demand minus strictly increasing supply is strictly
  decreasing: PASS.
- Pre-MAH background market and deterministic aggregation are retained: PASS.
- Exactly one scalar market clears: PASS.

### Proposition 5 - scarcity attenuation

- $p_m^1\geq p_m^0$, strict under positive study demand at $p_m^0$: PASS.
- $W_{E,p_m}=-b(m)<0$: PASS.
- $0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir}$: PASS.
- $0\leq\Delta x_i^{eq}\leq\Delta x_i^{dir}$: PASS.
- Perfectly elastic supply removes equilibrium attenuation: PASS.
- Scarcity can erase a gain but cannot lower the old choice-set value: PASS.

### Proposition 6 - planning-stage and observed outcomes

- $\Lambda_i^{plan}=a_ix_i^*$ is the optimal planning-stage arrival
  intensity: PASS.
- Retained-holder and entrusted-retained outcomes are distinct: PASS.
- Type-specific outcomes use common $x_i^*$ and $\rho_gF_g$: PASS.
- Exact advancement-versus-route-composition decomposition: PASS.
- Downstream $s(q)$ and $s_g(q)$ remain policy invariant: PASS.
- Planning-stage projects are not equated to patents or pure clinical effort:
  PASS.

## 3. Assumption discipline and dimensions

Every formal result lists fixed objects, actually used assumptions, sufficient
conditions, zero-effect or boundary cases, proof and economic interpretation.
The proposition-specific curvature restriction is recorded separately and is
not disguised as a derived conclusion.

| Object family | Unit | Gate |
|---|---|---|
| $W_i^0,W_i^1,\Delta\Omega$ | $\mathsf C/\mathsf P$ | PASS |
| $p_m^0,p_m^1$ | $\mathsf C/\mathsf B$ | PASS |
| $\Delta x_i$ | $\mathsf X$ | PASS |
| $\Lambda_i^{plan},Y_i$ | $\mathsf P$ per cohort | PASS |
| route labels and realization rates | dimensionless | PASS |

The symbol registry contains 83 active rows, each with one category and unit
or set domain. The dependency ledger contains P08-E01 through P08-E18.

## 4. Mandatory boundary checks

| Boundary | Result |
|---|---|
| $k_i\to\infty$ | PASS: weakly favors internal manufacturing |
| $k_i<\underline k(m)$ | PASS: internal manufacturing infeasible |
| $M=0$ | PASS: route $E$ unavailable; background CMO market remains |
| $p_m\to\infty$ | PASS: route $E$ loses without lowering old value |
| $W_i^E\leq W_i^0$ everywhere | PASS: $\Delta\Omega_i=\Delta x_i=0$ |
| perfectly elastic CMO supply | PASS: attenuation disappears |
| $\nu=1$ | PASS: linear value-to-advancement mapping |
| $\rho_O=0$ | PASS: original-class aggregate contribution is zero |
| $\rho_{\mathrm{Inc}}=0$ | PASS: incremental-class contribution is zero |
| no fixed novelty ranking | PASS: both rankings constructible |

## 5. Automated and LaTeX audit

- IN_PROGRESS proposition audit: 115 PASS / 0 FAIL.
- READY_FOR_APPROVAL audit with gate traceability: 117 PASS / 0 FAIL.
- MiKTeX two-pass compile: PASS.
- Fatal errors, undefined references and duplicate labels: 0.
- Overfull/underfull boxes after layout correction: 0.
- Manuscript diff against locked base: empty.
- Collaborator ZIP in rebuild worktree: absent.

The first compile found two nonfatal line-overflow warnings. Shortening two
paragraph headings removed both; no mathematical content changed.

## 6. Traceability

| IDs | Result | Evidence |
|---|---|---|
| RL-01--RL-06 | PASS | no prohibited taxonomy, state, entry, growth, household or welfare block |
| RL-07--RL-10 | PASS | no direct capability, project-distribution, realization or price shift |
| RL-11--RL-14 | PASS | retained holder meaning; no logit, inclusive value or eta |
| RL-15--RL-20 | PASS | manuscript unchanged; proofs, notation and dimensions audited |
| RL-21--RL-28 | PASS | no patent/upstream-research outcome, novelty ranking or finance mechanism |
| P08-D01 | PASS | exactly six propositions and one corollary complete |
| P08-G01 | PASS | assumptions, proofs, fixed objects, sufficient conditions and zero cases complete |
| QA-PROOF-01 | PASS | every FOC/derivative independently re-derived |
| QA-PROOF-02 | PASS | uniqueness conditions audited |
| QA-PROOF-03 | PASS | dimensions audited |
| QA-PROOF-04 | PASS | derivative and inequality signs audited |
| QA-PROOF-05 | PASS | held-fixed objects explicit |
| QA-PROOF-06 | PASS | binary policy uses finite comparisons |
| QA-PROOF-07 | PASS | fixed and equilibrium prices separated |
| QA-PROOF-08 | PASS | all mandatory boundary cases checked |
| QA-PROOF-09 | PASS | scalar CMO fixed point closed |
| QA-PROOF-10 | PASS | compilation and reference audit |
| QA-ECON-01 | PASS | MAH enters only through route $E$'s wedge |
| QA-ECON-02 | PASS | advancement, route, realization and observed outcomes separated |
| QA-ECON-03 | PASS | entrusted production retains holder rights |
| QA-ECON-04 | PASS | scarcity is an endogenous attenuation mechanism |
| QA-ECON-05 | PASS | no extension contaminates baseline |
| QA-ECON-06 | NOT APPLICABLE | no identification claim |
| QA-ECON-07 | PASS | terminology consistent with v1.2 definition of $x_i$ |
| QA-ECON-08 | PASS | no external empirical claim used in proof |

All red lines RL-01 through RL-28 are covered.

## 7. Next-phase boundary

Phase 9 may separate planning, route, realization and type-specific observed
outcomes in its designated module. It must reuse the common-control and
policy-invariant-realization results proved here, and cannot turn patents into
a baseline endogenous outcome.

Gate conclusion: Phase 8 is ready for approval. Under EXEC-GOV-001, zero P0
authorizes a separate commit/push and continuation to Phase 9.
