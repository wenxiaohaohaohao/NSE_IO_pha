# Phase 4 Gate Report

- Phase: 4 - Route Values and Organizational Sorting
- Effective-spec SHA256: 855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: 06984a993323de3bac6e63e921cd1dc9842f1672
- Overall gate: PASS
- P0: 0
- P1: 0

## 1. Route values and accounting

| Requirement | Result | Evidence |
|---|---|---|
| Internal value | PASS | \(W_i^I=s(q)R(q,c_I)-F_I\); infeasible internal production gives \(-\infty\) |
| Entrusted value | PASS | \(W_i^E=s(q)R(q,c_E)-F_E-p_mb-\mu_E-\tau_E(M)\) |
| Transfer and abandonment | PASS | \(W^T=T(q,m)\), \(W^A=0\); both remain valid outside options |
| Cost accounting | PASS | operating cost enters through \(R\); readiness, capacity, holder burden and wedge are each subtracted once |
| Holder rights | PASS | developer remains authorization holder under \(E\) |

## 2. Deterministic route choice

| Check | Result |
|---|---|
| Optimized project value | PASS: maximum over \(I,E,T,A\) |
| Route choice | PASS: deterministic argmax over the four explicitly listed values |
| Ties | PASS: continuous heterogeneity makes exact ties measure zero |
| Old route mechanism | PASS: no logit, inclusive value, random utility or probabilistic route share |
| Binary reform effect | PASS: at fixed \(p_m\), reform gain is nonnegative and exactly zero when \(E\) does not beat the pre-reform maximum |

## 3. Sorting derivation

The independently re-derived value gap is
\[
\Delta_{IE}
=s(q)\{R(q,c_I)-R(q,c_E)\}-F_I+F_E+p_mb+\mu_E+\tau_E.
\]
Holding \(q,m,M,p_m\) fixed,
\[
\Delta_{IE,k}=s(q)R_c(q,c_I)c_{I,k}-F_{I,k}>0.
\]
The first term is weakly positive and the second strictly positive, so the
strict sign also holds when \(s(q)=0\).

| Proof obligation | Result |
|---|---|
| Continuity and endpoint crossing | PASS: explicit sufficient conditions recorded |
| Existence | PASS: intermediate value theorem |
| Uniqueness | PASS: strict positive gap slope |
| Conditional sorting | PASS: \(k_i<k^*\) gives \(E\), \(k_i>k^*\) gives \(I\), only when both dominate \(T/A\) |
| Non-tautology | PASS: cutoff follows from technology derivatives and crossing, not from an assumed route ranking |

## 4. Comparative statics and boundaries

| Check | Result |
|---|---|
| Finite-wedge derivative | PASS: \(\partial k^*/\partial\tau_E=-1/\Delta_{IE,k}<0\) |
| Fixed-price derivative | PASS: \(\partial k^*/\partial p_m=-b(m)/\Delta_{IE,k}<0\) |
| Economic direction | PASS: lower finite barrier expands \(E\); higher fixed CMO price contracts \(E\) |
| Binary policy boundary | PASS: no derivative with respect to \(M\); \(M=0\) makes \(E\) unavailable |
| Equilibrium boundary | PASS: no claim about the total derivative through \(p_m^*\) |
| Outside-option boundary | PASS: if \(T\) or \(A\) dominates, the \(I/E\) cutoff does not determine the realized route |
| Crossing failure | PASS: no finite cutoff is claimed when sufficient endpoint conditions fail |

## 5. Automated and LaTeX audit

- Initial complete automated result after corrections: 104 PASS / 0 FAIL.
- Final READY_FOR_APPROVAL audit, including gate-report traceability checks: 106 PASS / 0 FAIL.
- MiKTeX two-pass compile: PASS.
- Fatal errors: 0.
- Undefined references: 0.
- Duplicate labels: 0.
- Overfull/underfull boxes: 0 after splitting the binary value comparison across aligned lines.
- UTF-8 replacement/control characters: 0.
- Manuscript diff against locked base: empty.
- Collaborator ZIP in rebuild worktree: absent.

## 6. Traceability

| IDs | Result | Phase 4 evidence |
|---|---|---|
| RL-01, RL-02, RL-03, RL-04, RL-05, RL-06 | PASS | no forbidden taxonomy, state, entry, growth, household or welfare block |
| RL-07, RL-08, RL-09, RL-10 | PASS | MAH changes no capability, demand/value primitive, realization probability or CMO price directly |
| RL-11 | PASS | entrusted production retains holder authorization |
| RL-12, RL-13, RL-14 | PASS | deterministic route choice; no logit/inclusive value, continuous implementation parameter or imported state |
| RL-15 | PASS | manuscript unchanged |
| RL-16, RL-17, RL-18, RL-19, RL-20 | PASS | no identification/welfare claim; complete derivation, explicit notation and dimensions |
| RL-21, RL-22, RL-23, RL-24, RL-25, RL-26, RL-27, RL-28 | PASS | no patent, upstream-research, novelty-ranking or finance mechanism added |
| P04-D01 | PASS | route values, deterministic choice, value gap, cutoff and local comparative statics complete |
| P04-G01 | PASS | \(T/A\) retained; cutoff existence, uniqueness and signs proven; old stochastic route objects absent |
| QA-PROOF-01, QA-PROOF-02 | NOT APPLICABLE | no continuous optimization FOC/SOC in Phase 4 |
| QA-PROOF-03 | PASS | dimensions and unique cost-accounting locations verified |
| QA-PROOF-04 | PASS | derivative signs re-derived from Phase 2-3 restrictions |
| QA-PROOF-05 | PASS | fixed objects and conditional route domain stated |
| QA-PROOF-06 | PASS | binary \(M\) separated from local finite-wedge derivative |
| QA-PROOF-07 | PASS | fixed \(p_m\) separated from equilibrium \(p_m^*\) |
| QA-PROOF-08 | PASS | \(M=0\), internal infeasibility, outside-option and zero-effect boundaries checked |
| QA-PROOF-09 | NOT APPLICABLE | CMO fixed point deferred to Phase 6 |
| QA-PROOF-10 | PASS | compilation and label/reference audit |
| QA-ECON-01 | PASS | MAH enters route values only through \(\tau_E(M)\) |
| QA-ECON-02 | PASS | planning-stage route choice is not an observed realized outcome |
| QA-ECON-03 | PASS | entrusted production is distinct from authorization transfer |
| QA-ECON-04 | PASS | \(p_m\) is a conjectured price; market clearing remains deferred |
| QA-ECON-05 | PASS | no extension mechanism contaminates the baseline |
| QA-ECON-06 | NOT APPLICABLE | no empirical identification claim |
| QA-ECON-07 | PASS | terminology matches route values, capability sorting and outside options |
| QA-ECON-08 | PASS | no new external empirical claim |

All IDs from RL-01 through RL-28 are explicitly covered above; RL-28 is
included in the final red-line group.

## 7. Next-phase boundary

Phase 5 may use the optimized planning-stage value to construct the single
project-advancement problem and \(\Omega_i\). Phase 4 itself introduces no
advancement control, FOC/SOC, CMO clearing, observed outcome or manuscript
text.

Gate conclusion: Phase 4 is ready for approval. Under EXEC-GOV-001, a
zero-P0 final audit authorizes APPROVED status, a separate commit/push and
continuation to Phase 5 without another routine prompt.
