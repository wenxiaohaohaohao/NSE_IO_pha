# Phase 2 Gate Report

- Phase: 2 - Demand and Operating Profit
- Effective specification: v1.2
- Effective-spec SHA256: 855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: 7c7dad4fc2cee7325180f624a32c6f245d319aec
- Overall gate: PASS
- P0: 0
- P1: 0

## 1. Deliverables and main results

| Item | Result | Evidence |
|---|---|---|
| Residual demand | PASS | $y(p;q)=Aq p^{-\varepsilon}$ in 02_demand_profit_derivation.tex |
| Pricing FOC | PASS | derivative factors as $Aq p^{-\varepsilon-1}[\varepsilon c-(\varepsilon-1)p]$ |
| Unique product price | PASS | $p^*(c)=\varepsilon c/(\varepsilon-1)>c$ |
| SOC and global maximum | PASS | negative SOC at the stationary point plus derivative sign crossing and both price-domain boundaries |
| Optimized operating profit | PASS | $\pi(q,c)=Aq(\varepsilon-1)^{\varepsilon-1}\varepsilon^{-\varepsilon}c^{1-\varepsilon}$ |
| Profit derivatives | PASS | $\pi_q=\pi/q>0$; $\pi_c=(1-\varepsilon)\pi/c<0$ |
| Present value | PASS | convergent geometric derivation $R(q,c)=\pi(q,c)/(1-\beta\varphi)$ |
| Present-value derivatives | PASS | $R_q=R/q>0$; $R_c=(1-\varepsilon)R/c<0$ |
| Definition ledgers | PASS | symbols, assumptions and dependency map updated before the formal formula block |

## 2. Independent proof audit

The independent derivation in phase02_independent_derivation.md recomputed the pricing derivative, sign crossing, SOC, substitution, log-derivative check, present-value sum, dimensions and limiting cases.

| Audit question | Result | Fixed objects / sufficient conditions |
|---|---|---|
| FOC independently rederived? | PASS | hold $A,q,c,\varepsilon$ fixed; differentiate only product price $p$ |
| SOC correct? | PASS | $A,q,c>0$, $\varepsilon>1$ |
| Unique global solution? | PASS | derivative positive at $p=c$, one zero, negative thereafter, objective tends to zero |
| $\pi_q$ sign correct? | PASS | hold $A,c,\varepsilon$ fixed |
| $\pi_c$ sign correct? | PASS | hold $A,q,\varepsilon$ fixed; $\varepsilon>1$ |
| PV convergent? | PASS | $\beta\in(0,1)$, $\varphi\in[0,1]$, hence $\beta\varphi<1$ |
| Binary-policy derivative avoided? | PASS | no derivative with respect to $M$; Phase 2 kernel is policy invariant |

## 3. Dimensions and cost accounting

| Check | Result | Evidence |
|---|---|---|
| $p$ and $c$ units | PASS | both are currency per physical-output unit |
| one-period profit units | PASS | $(p-c)y$ is currency per operating period |
| present-value units | PASS | dimensionless geometric factor times one-period currency flow |
| product price versus CMO price | PASS | $p,p^*$ are explicitly distinct from $p_m,p_m^*$ |
| marginal manufacturing cost | PASS | $c$ is subtracted once inside $p-c$ |
| route fixed costs | PASS | absent from $R$; Phase 3-4 must place each cost either inside route-specific marginal cost or outside $R$, never both |
| realization versus survival | PASS | $s(q)$ is not $\varphi$ and is not multiplied into the conditional PV in Phase 2 |
| reduced-form return removal | PASS | legacy reduced-form returns are inactive; formal replacement is $y\to\pi\to R$; detailed legacy-location crosswalk remains scheduled for Phase 12 |

## 4. Boundary checks

| Boundary | Result |
|---|---|
| $q\downarrow0$ | $\pi,R\downarrow0$ - PASS |
| $c\to\infty$ | $\pi,R\downarrow0$ for $\varepsilon>1$ - PASS |
| $\varphi=0$ | $R=\pi$ - PASS |
| $\varphi=1$ | $R=\pi/(1-\beta)$ and finite - PASS |
| lower price bound $p=c$ | zero profit and positive derivative - PASS |
| upper price limit $p\to\infty$ | profit tends to zero - PASS |

The mandatory rebuild boundaries involving $k_i$, $M$, entrusted-route value and CMO supply are not Phase 2 objects. They remain scheduled for the phases where those objects are formally active.

## 5. Automated and LaTeX audit

- Initial automated result after all substantive corrections: 75 PASS / 0 FAIL.
- Final READY_FOR_APPROVAL audit, including gate-report traceability checks: 77 PASS / 0 FAIL.
- MiKTeX: two passes using the project-local wrapper and D-drive temporary/build directories.
- PDF: 2 pages, 123,120 bytes.
- LaTeX fatal errors: 0.
- Undefined references: 0.
- Duplicate labels: 0.
- Overfull/underfull boxes: 0.
- UTF-8 replacement/control characters in formal and ledger files: 0.
- paper/manuscript diff against the locked base: empty.
- collaborator ZIP in rebuild worktree: absent.

## 6. Traceability

### Absolute Red Lines

| ID | Result | Phase 2 evidence |
|---|---|---|
| RL-01 | PASS | no original-versus-generic innovation directions |
| RL-02 | PASS | no permanent firm types |
| RL-03 | PASS | no multi-product state |
| RL-04 | PASS | no firm entry/exit |
| RL-05 | PASS | no invariant firm distribution |
| RL-06 | PASS | no household, aggregate growth, or welfare block |
| RL-07 | PASS | no policy shift in $a_i$ |
| RL-08 | PASS | $A,q,\varepsilon$ explicitly invariant to MAH |
| RL-09 | PASS | no policy shift in $s(q)$ |
| RL-10 | PASS | product price is distinguished from endogenous CMO price |
| RL-11 | PASS | no entrusted-production ownership interpretation |
| RL-12 | PASS | no logit or inclusive value |
| RL-13 | PASS | no continuous implementation parameter |
| RL-14 | PASS | no imported state variable |
| RL-15 | PASS | manuscript unchanged |
| RL-16 | PASS | no identification claim |
| RL-17 | PASS | full analytical derivation, not pseudo-code |
| RL-18 | PASS | notation registry updated explicitly |
| RL-19 | PASS | all Phase 2 objects defined before use |
| RL-20 | PASS | no welfare inference |
| RL-21 | PASS | no generic upstream R&D interpretation |
| RL-22 | PASS | no patent-application prediction |
| RL-23 | PASS | no upstream-science prediction |
| RL-24 | PASS | no novelty-class response restriction |
| RL-25 | PASS | no split advancement controls or finance block |
| RL-26 | PASS | no patent-result interpretation |
| RL-27 | PASS | no original-versus-incremental ranking |
| RL-28 | PASS | no financial-constraints reframing |

### Phase and QA requirements

| ID | Result | Evidence |
|---|---|---|
| P02-D01 | PASS | all formal Phase 2 outputs present |
| P02-G01 | PASS | dimensions consistent; no unexplained reduced-form return or double counting |
| QA-PROOF-01 | PASS | independent FOC derivation |
| QA-PROOF-02 | PASS | SOC and corner/boundary checks |
| QA-PROOF-03 | PASS | unit table and operating-margin audit |
| QA-PROOF-04 | PASS | signs and sufficient conditions stated |
| QA-PROOF-05 | PASS | differentiated and held-fixed objects stated |
| QA-PROOF-06 | PASS | no continuous derivative with respect to binary $M$ |
| QA-PROOF-07 | PASS | product price and CMO equilibrium price distinguished |
| QA-PROOF-08 | NOT APPLICABLE YET | mandatory manufacturing/CMO limits remain scheduled; active Phase 2 limits passed |
| QA-PROOF-09 | NOT APPLICABLE YET | no Phase 2 fixed point |
| QA-PROOF-10 | PASS | wrapper compiles and label/reference audit passes |
| QA-ECON-01 | PASS | no direct MAH shift in the Phase 2 kernel |
| QA-ECON-02 | PASS | conditional commercial value is not an observed outcome count |
| QA-ECON-03 | PASS | Phase 2 does not reinterpret entrusted production |
| QA-ECON-04 | PASS | $p_m^*$ remains a distinct later equilibrium price |
| QA-ECON-05 | PASS | no extension mechanism appears |
| QA-ECON-06 | NOT APPLICABLE YET | no empirical identification claim |
| QA-ECON-07 | PASS | terms name product demand, operating profit, and conditional commercial PV precisely |
| QA-ECON-08 | PASS | no new external empirical claim is used |

## 7. Legacy conflict and next phase boundary

The old manuscript still contains reduced-form return and old route-choice objects. They were not modified. Phase 2 supplies the derived replacement kernel only; Phase 12 will identify every affected legacy equation, proposition, paragraph and calibration statement.

No Phase 3 technology, route-specific cost function, route value, organizational cutoff, project-advancement optimization, CMO equilibrium, or manuscript change was introduced.

Gate conclusion: Phase 2 is mathematically and economically ready for approval. Under EXEC-GOV-001 and the user's explicit approval of the Phase 2 requirements, a zero-P0 final automated gate authorizes recording APPROVED, creating the separate Phase 2 commit, pushing it, and proceeding to Phase 3 without another routine prompt.
