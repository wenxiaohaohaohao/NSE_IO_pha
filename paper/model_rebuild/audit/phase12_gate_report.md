# Phase 12 Gate Report

- Phase: 12 - Old-to-New Model Crosswalk
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Entry commit: b06be5ac3499df9b7493081f5febde0fb68274a6
- Overall gate: PASS
- P0: 0
- New Phase 12 P1: 0
- Deferred evidence issue: ISSUE-SPEC-001 remains P1-EVIDENCE and does not
  block Phase 12; it still blocks unverified detailed Shi Gu wording at
  Phase 16/18.

## 1. Required output

| Deliverable | Result | Evidence |
|---|---|---|
| old-to-new decision crosswalk | PASS | paper/model_notes/05_old_to_new_model_crosswalk.md |
| exhaustive legacy occurrence index | PASS | audit/phase12_legacy_occurrence_index.csv |
| reproducible inventory builder | PASS | scripts/build_phase12_legacy_inventory.ps1 |
| independent crosswalk audit | PASS | audit/phase12_independent_crosswalk_audit.md |
| legacy sources remain read-only | PASS | Git diff against locked base is empty |

## 2. Exhaustiveness audit

- Indexed occurrences: 1,242.
- Required crosswalk IDs: CW-01--CW-24, all present.
- Authorized legacy sources: 13 of 13 present.
- Rows inside equations: 274.
- Rows inside propositions, lemmas, or corollaries: 81.
- Calibration or empirical rows: 300.
- Appendix rows: 570.
- Rows with an enclosing formal label: 312.
- CSV source-path, UTF-8 line-number, and exact-text validation:
  1,242 PASS / 0 mismatch.

Roles overlap, so category counts are not summed. The row-level CSV is the
exhaustive location evidence; the Markdown file is the economic
delete/replace/retain/quarantine decision authority.

## 3. Required object decisions

| Required family | Gate result |
|---|---|
| reduced-form returns \(R_i^{event},\bar R_i^E\) | PASS — deleted and replaced by derived \(R(q,c)\) |
| arbitrary continuation \(v\) | PASS — removed; only nonrecursive value-gap interpretation retained |
| \(C^I,h_i^I,q_i^E,\mu_i^E\) | PASS — explicit technology, structural infeasibility, deleted eligibility dummy, common holder burden |
| binary \(M\) and continuous \(\eta\) | PASS — binary regime retained; continuous intensity removed |
| \(\zeta_i^r\), logit, and \(\Gamma_i\) | PASS — removed from baseline; deterministic value expectation used |
| \(\Delta\Gamma_i^{set}>0\) | PASS — deleted; weak finite comparison and zero cases replace it |
| quadratic cost and old \(x_i^*\) formula | PASS — generalized \(C_X\) and nonlinear solution |
| CMO market | PASS — retained but rebuilt with explicit supply, demand, and one fixed point |
| planning/observed distinction and transfer | PASS — retained with corrected timing and primitive outside option |
| entry | PASS — excluded from baseline and candidates |
| v1.2 \(x_i\), planned projects, patents, innovation claim | PASS — all interpretation boundaries explicit |
| novelty classes | PASS — \(\rho_gF_g\), common \(x_i\), no fixed class ranking |

## 4. Proposition, paragraph, appendix, and calibration propagation

- Old logit set-expansion proposition: deleted.
- Old implementation-intensity/CMO derivative proposition: deleted and
  replaced by fixed-price versus equilibrium-price scarcity bounds.
- Old probability/realization observed-output decomposition: deleted and
  replaced by the Phase 9 hierarchy.
- Old logit heterogeneity derivative: deleted and replaced by deterministic
  sorting plus advancement heterogeneity.
- Old entry propositions and aggregation modules: deleted.
- Old Bellman/portfolio continuation chain: deleted.
- Old route-share log-odds calibration: deleted as a baseline structural
  mapping.
- Old patent proxy for \(x_i\): deleted.
- Old entry-cost calibration: deleted.
- All affected appendix and legacy-note locations are line-indexed.

## 5. Architecture and economic audit

- MAH changes only \(\tau_E(M)\) and legal availability of route \(E\): PASS.
- No \(M\to a_i,q,F,s(q),s_g(q)\), CMO supply, or assumed
  \(p_m^*\downarrow\) arrow is introduced: PASS.
- Deterministic route choice remains the baseline: PASS.
- \(\Omega_i\) is not a renamed inclusive value: PASS.
- \(x_i\) uses the v1.2 definition and is neither patent applications nor
  pure clinical-development effort: PASS.
- Planning-stage and observed outcomes are not reversed: PASS.
- Entrusted manufacturing remains distinct from ownership transfer: PASS.
- Extensions remain quarantined: PASS.
- No welfare or separate-primitive-identification claim is introduced: PASS.

## 6. Automated and LaTeX validation

- IN_PROGRESS automated audit after tool corrections:
  84 PASS / 0 FAIL.
- Phase 1--10 cumulative MiKTeX compile: PASS.
- LaTeX passes: 2.
- Fatal errors: 0.
- Undefined references: 0.
- Duplicate labels: 0.
- Box warnings: 0.
- Manuscript diff against locked base: empty.
- Legacy research_notes/model_notes diff against locked base: empty.
- Collaborator ZIP in rebuild worktree status: absent.
- Unexpected Phase 12 paths: 0.

## 7. Traceability

| IDs | Result | Evidence |
|---|---|---|
| RL-01--RL-06 | PASS | old taxonomy, entry/dynamics, and welfare modules are not imported |
| RL-07--RL-11 | PASS | policy, technology, realization, price, and holder-right boundaries are explicit |
| RL-12--RL-15 | PASS | logit/inclusive value/eta removed; manuscript unchanged |
| RL-16--RL-20 | PASS | identification, formal derivation, notation, definition, and welfare boundaries preserved |
| RL-21--RL-28 | PASS | v1.2 \(x_i\), patent, novelty, finance, and contribution boundaries explicit |
| AMD11-N | PASS | required crosswalk additions are included |
| AMD12-01 | PASS | corrected \(x_i\) meaning controls every Phase 18 action |
| P12-D01 | PASS | crosswalk plus exhaustive occurrence index |
| P12-G01 | PASS | every old-object dependency traced; legacy files read-only |
| QA-PROOF-10 | PASS | approved baseline compiles with clean labels/references |
| QA-ECON-01 | PASS | only institutional route wedge is the direct policy channel |
| QA-ECON-02 | PASS | planning and observed outcomes remain distinct |
| QA-ECON-05 | PASS | baseline and extension objects remain separated |
| QA-ECON-07 | PASS | innovation wording names the modeled margin |
| QA-ECON-08 | PASS | unverified detailed Shi Gu claims remain explicitly deferred |

## 8. Scope and next phase

Changed files are limited to the Phase 12 crosswalk, occurrence index,
inventory/audit scripts, state/traceability records, compile evidence, and
gate records. No locked legacy file changed.

Recommended next action: under EXEC-GOV-001, record Phase 12 as APPROVED,
create and push the separate Phase 12 commit, and begin Phase 13’s complete
equation dependency map.
