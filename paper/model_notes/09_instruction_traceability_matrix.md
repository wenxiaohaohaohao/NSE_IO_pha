# Instruction Traceability Matrix

Spec = `paper/spec/MAH_model_rebuild_execution_note_for_Codex.md` (hash
`f6c11377...`) + `paper/spec/MAH_model_rebuild_amendment_v1.1_for_Codex.md`
(hash `d7685624...`). Every row cites the section it comes from. "AMENDED"
rows are the execution note's original item as modified by amendment v1.1;
the amendment section letter is given in the Source column.

Status values: `NOT STARTED`, `IN PROGRESS`, `PASS`, `FAIL`, `N/A (extension,
not baseline)`. Approval: `—` (not yet reached), `PENDING USER`, `APPROVED`.

**Branch note:** `codex/mah-model-rebuild` is based at `review-model@cd5b6e4`
(corrected from an earlier disconnected-repo attempt — see
`06_open_issues_log.md` OI-01/OI-02). Phase 1–2 rows below reflect the
replayed, corrected state.

## A. Absolute Red Lines (RL-01 – RL-28)

| ID | Rule (abridged) | Source | Applicable file(s) | Verification method | Status | Evidence | Approval |
|---|---|---|---|---|---|---|---|
| RL-01 | No original-drug vs generic-drug R&D as two innovation directions | §2.1 | all model_rebuild/*.tex | grep for "generic drug" dichotomy | NOT STARTED | — | — |
| RL-02 | No restoring A/B/C as permanent firm types | §2.2 | all | grep for firm-type labels A/B/C | NOT STARTED | — | — |
| RL-03 | No full multi-product firm state | §2.3 | 01, 04 | object-status table review | NOT STARTED | — | — |
| RL-04 | No firm entry/exit in baseline | §2.4 | 07 (equilibrium def.) | audit gate P07-G01 | NOT STARTED | Real manuscript has no entry/exit block (unlike new-2.pdf, which is reference-only and not part of this workspace) | — |
| RL-05 | No Hopenhayn invariant firm distribution | §2.5 | 06, 07 | audit gate | NOT STARTED | — | — |
| RL-06 | No representative household / capital accumulation / BGP / full welfare | §2.6 | all | audit gate | NOT STARTED | — | — |
| RL-07 | MAH must not directly raise $a_i$ | §2.7 | 03, 05 | symbol-usage grep for $a_i$ | PASS (Phase 1–2 scope) | no payoff yet; $M,a_i$ never co-appear in an expression | — |
| RL-08 | MAH must not directly raise $A$, demand, or $q$ | §2.8 | 02 | symbol-usage grep | PASS (Phase 2 scope) | `02_demand_profit_derivation.tex` §Baseline demand states explicitly $A,q,\varepsilon$ are never functions of $M$; $M$ does not appear anywhere in the module | — |
| RL-09 | MAH must not directly raise $s(q)$ | §2.9 | 04, 09 | symbol-usage grep | PASS (Phase 1 scope) | §1.4 of `01_primitives_and_timing.tex` states explicitly $M$ does not shift $s(q)$/$s_g(q)$ | — |
| RL-10 | MAH must not directly lower $p_m^*$ | §2.10 | 06 | equilibrium derivation review | PASS (Phase 1 scope) | $p_m$ appears only as Stage-5 consistency object, not derived | — |
| RL-11 | Entrusted production ≠ ownership/authorization transfer | §2.11 | 03 | definition check | NOT STARTED | — | — |
| RL-12 | No logit/inclusive value in theoretical baseline | §2.12 | 04, 11 (extension only) | grep for logit/log-sum outside 11_extensions | PASS (Phase 1–2 scope) | no route value/choice-probability object defined yet; real manuscript's logit/$\Gamma_i$ explicitly noted as the object to be excluded, not imported | — |
| RL-13 | No continuous $\eta$ in baseline | §2.13 | all | grep for $\eta$ | PASS (Phase 1–2 scope) | $\eta$ does not appear as a baseline object in either module; real manuscript's $\eta$ explicitly noted as dropped | — |
| RL-14 | No new state vars merely because a reference paper has them | §2.14 | all | object-status table review | NOT STARTED | — | — |
| RL-15 | No manuscript edits until derivation modules pass audit gates | §2.15 | paper/manuscript/ | file-mtime / hash check pre-Phase-18 | IN PROGRESS (holding) | real manuscript files untouched; hashes recorded in `paper/spec/00_spec_manifest.md` | — |
| RL-16 | No claiming every primitive separately identified by data | §2.16 | 09, 10 | text review | NOT STARTED | — | — |
| RL-17 | No pseudo-code substituting for formal derivation | §2.17 | all .tex | text review | NOT STARTED | — | — |
| RL-18 | No silent notation changes across phases | §2.18 | 01_symbols_and_objects.md | cross-phase notation diff | PASS (Phase 1–2 scope) | notation-discipline log records amendment's additive-only symbol changes and the two distinct uses of "R" | — |
| RL-19 | No proposition before all its objects are formally defined | §2.19 | 08 (propositions) | symbol-usage grep vs symbols file | PASS (Phase 1–2 scope) | no propositions yet; deferred-objects list enforced in both modules | — |
| RL-20 | No welfare conclusions from private-value/realized-output comparative statics | §2.20 | 08, 15 | text review | NOT STARTED | — | — |
| RL-21 | $x_i$ not described as generic R&D if wording could include upstream patent research | Amend. §C | 05, 08, 13, 16 | grep "R&D effort" outside defined-narrow context | PASS (Phase 1 scope) | `01_primitives_and_timing.tex` §1.3 defines $x_i$ as project-development/advancement intensity, explicitly contrasts with the real manuscript's genuine R&D reading | — |
| RL-22 | No claim MAH must increase patent applications | Amend. §C | 08, 09, 10 | text review | NOT STARTED | — | — |
| RL-23 | No claim MAH must increase upstream scientific research | Amend. §C | 08, 09 | text review | NOT STARTED | — | — |
| RL-24 | No imposing MAH must increase breakthrough/original innovation | Amend. §C | 05, 08 (Corollary) | text review | NOT STARTED | — | — |
| RL-25 | No separate $x_i^R,x_i^D$ / financial constraint / R-vs-D block in baseline w/o approval | Amend. §C | 11.X only | grep $x_i^R$/$x_i^D$ outside extensions file | NOT STARTED | — | — |
| RL-26 | Shi Gu's negative patent result ≠ contradiction; patents outside baseline endogenous outcome | Amend. §C | 09, 10, 08_shigu note | text review | NOT STARTED | — | — |
| RL-27 | No forcing original-drug projects to respond more strongly than incremental | Amend. §C | 08 (Corollary) | proof review | NOT STARTED | — | — |
| RL-28 | No redefining the paper as a financial-constraints paper | Amend. §C | intro/framing text | text review | NOT STARTED | — | — |

## B. Per-Phase Deliverables (Dxx) and Audit Gates (Gxx)

Each phase ID form: `P{phase#}-D{seq}` / `P{phase#}-G{seq}`. Phase numbers
follow the note's formal headings (Phase 1–18), not the 15-row example table.

| Phase | Title (amended where noted) | Deliverable IDs → files | Gate IDs → condition | Status | Approval |
|---|---|---|---|---|---|
| 1 | Object/Timing Audit (Stage-1 label amended, Amend. §E) | P01-D01→`01_primitives_and_timing.tex` PASS; P01-D02→`01_symbols_and_objects.md` PASS; P01-D03→`02_equation_dependency_map.md` PASS (partial, Phase-1 skeleton only) | P01-G01 PASS (17 symbols classified, §1.2 table); P01-G02 PASS (deferred-objects list enforced); P01-G03 PASS (Stage 1 advancement precedes Stage 2 project draw precedes Stage 3 route choice); P01-G04 PASS ($M$ appears only as Stage-0 regime primitive; no payoff derived yet) | APPROVED | APPROVED |
| 2 | Demand and Operating Profit | P02-D01→`02_demand_profit_derivation.tex` PASS | P02-G01 PASS ($R(q,c)=\pi(q,c)/(1-\beta\varphi)$, FOC/SOC/profit fully re-derived); P02-G02 PASS (crosswalk note now correctly points $R_i^{event}$, $\bar R_i^E$ — the real manuscript's objects — to $R(q,c)$; full table deferred to Phase 12); P02-G03 PASS (flow-profit units consistent); P02-G04 PASS (no route-specific cost exists yet) | APPROVED | APPROVED |
| 3 | Manufacturing Technologies | P03-D01→`03_internal_external_technologies.tex` | P03-G01 I/E technologically distinct; P03-G02 E retains holder authorization; P03-G03 M changes only feasibility/friction; P03-G04 CMO scarcity not yet exogenous relief | NOT STARTED | — |
| 4 | Route Values and Sorting | P04-D01→`04_route_values_and_sorting.tex` | P04-G01 route comparison not tautological; P04-G02 MAH may have zero effect for many; P04-G03 T/A remain valid; P04-G04 no logit route share | NOT STARTED | — |
| 5 | Project-Development/Advancement Problem (renamed, Amend. §F/G) | P05-D01→`05_rd_problem.tex` (content retitled per amendment) | P05-G01 ex ante; P05-G02 route choice downstream; P05-G03 $a_i$ scales project-generation productivity only; P05-G04 $k_i$ affects value via organization not research tech; P05-G05 MAH affects choice only via $\Omega_i$ | NOT STARTED | — |
| 6 | CMO Supply and Demand | P06-D01→`06_cmo_supply_demand_equilibrium.tex` | P06-G01 route choice depends on $p_m$; P06-G02 advancement choice depends on $p_m$ via route value; P06-G03 demand = intensive + selection response; P06-G04 supply upward-sloping from optimization; P06-G05 no unresolved circularity | NOT STARTED | — |
| 7 | Equilibrium Definition | P07-D01→`07_equilibrium_definition.tex` | P07-G01 no entry/firm distribution/labor/capital/product-market clearing slipped in | NOT STARTED | — |
| 8 | Required Propositions (1,3,6 amended; new Corollary, Amend. §H/I/J) | P08-D01…D06→ Props 1–6 in derivation draft; P08-D07→ Corollary (novelty composition ambiguous) | Each prop: assumptions listed, FOC/SOC independently re-derived, sufficient conditions stated, zero-effect case identified | NOT STARTED | — |
| 9 | Observed Outcomes / Data Boundary (amended, Amend. §K) | P09-D01→`09_observed_outcomes.tex` | preserves R&D/arrival/route/observed distinction; adds upstream-research≠development≠organization≠product hierarchy; no primitive-by-primitive identification claim | NOT STARTED | — |
| 10 | Empirical Mapping Interface (table replaced, Amend. §L) | P10-D01→`10_empirical_mapping.tex` | interfaces only, no fabricated data availability | NOT STARTED | — |
| 11 | Extensions Not Baseline (new 11.X, Amend. §M) | P11-D01→`11_extensions_not_baseline.tex` incl. §11.X R-vs-D allocation extension | all listed items confirmed non-baseline | NOT STARTED | — |
| 12 | Old-to-New Crosswalk (rows added, Amend. §N) | P12-D01→`05_old_to_new_model_crosswalk.md` | every removed object's dependent equations/props/paragraphs/calibration claims identified; must use the REAL manuscript (paper/manuscript/mah_route_indicator_friction_model.tex) plus research_notes/model_notes/ as source material, not the reference-only PDF | NOT STARTED | — |
| 13 | Equation Dependency Map (label + branches amended, Amend. §O) | P13-D01→`02_equation_dependency_map.md` (final) | feedback loop ($p_m^*$ fixed point) explicitly acknowledged and solved | NOT STARTED | — |
| 14 | Assumption Discipline (amended, Amend. §P) | P14-D01→`03_assumptions_and_scope.md` | every proposition lists assumptions used; no sign-forcing assumptions incl. no $\Delta\Omega_{iO}>0$ or $>\Delta\Omega_{iI}$ forcing | NOT STARTED | — |
| 15 | Comparative-Static Proof Standards + full draft (amended, Amend. §Q) | P15-D01→`08_comparative_statics.tex`; P15-D02→`12_full_derivation_draft.tex` | 8-part standard per result incl. amendment's "which object?" question; binary $M$ uses finite comparisons | NOT STARTED | — |
| 16 | Main Text / Appendix Split (terminology amended, Amend. §R) | P16-D01→`13_main_text_model_candidate.tex`; P16-D02→`14_appendix_model_candidate.tex` | main text uses "project-development/advancement" not generic R&D; appendix has Research-vs-Development boundary subsection citing Shi Gu (2024) | NOT STARTED | — |
| 17 | Consistency Audit (6 new questions, Amend. §S) | P17-D01→`07_consistency_audit.md` | 10 original + 6 amendment questions, zero P0 | NOT STARTED | — |
| 18 | Manuscript Integration (5 new rules, Amend. §T) | P18-D01…D10 per note §23; +5 amendment rules | approval of full draft first; only Model + dependent sections of the REAL manuscript touched; compiles; label/notation audit; diff summary | NOT STARTED (BLOCKED) | — |

## C. Proof/Algebra QA (QA-PROOF-01 – 11) — Section 26

| ID | Check | Status |
|---|---|---|
| QA-PROOF-01 | Independently re-derive every FOC/derivative once | ONGOING — Phase 1–2: PASS ($p^*(c)$ FOC and $\Pi''(p^*)<0$ SOC re-derived independently, matches boxed note results) |
| QA-PROOF-02 | Dimensional consistency check | ONGOING — Phase 2: PASS (§Dimensional consistency) |
| QA-PROOF-03 | Limiting-case check (general) | ONGOING — Phase 2: as $c\to\infty$, $\pi(q,c)\to0$ and $R(q,c)\to0$ — sane; phase-specific checks QA-PROOF-05..11 below are not yet reached |
| QA-PROOF-04 | Economic-sign check | ONGOING — Phase 2: PASS ($\pi_q>0,\pi_c<0,R_q>0,R_c<0$ all verified) |
| QA-PROOF-05 | $k_i\to\infty$ weakly favors internal manufacturing | NOT STARTED |
| QA-PROOF-06 | $k_i<\underline k(m)\Rightarrow$ internal infeasible | NOT STARTED |
| QA-PROOF-07 | $M=0$ removes $E$ from effective route set | NOT STARTED |
| QA-PROOF-08 | $p_m\to\infty\Rightarrow E$ ceases optimal, old route set value unchanged | NOT STARTED |
| QA-PROOF-09 | Zero entrusted advantage $\Rightarrow \Delta\Omega_i=0,\ \Delta x_i=0$ | NOT STARTED |
| QA-PROOF-10 | Perfectly elastic CMO supply $\Rightarrow$ attenuation disappears | NOT STARTED |
| QA-PROOF-11 | $\nu=1 \Rightarrow x_i^*=\beta a_i\Omega_i/\kappa$ | NOT STARTED (note: real manuscript's $C_i^R(x_i)=\frac{\kappa}{2}x_i^2$ is exactly this $\nu=1$ special case — useful confirmation once reached) |

## D. Economic-Interpretation QA (QA-ECON-01) — Section 27

| ID | Check | Status |
|---|---|---|
| QA-ECON-01 | Every result has a non-tautological one-paragraph economic interpretation | ONGOING — Phase 1: no payoff yet (N/A); Phase 2: PASS (`02_demand_profit_derivation.tex` §Economic interpretation) |

## E. Definition of Success (SUCCESS-01 – 13, items 4–6 replaced + 11–13 added by Amend. §V)

| ID | Statement | Source | Status |
|---|---|---|---|
| SUCCESS-01 | MAH changes one clearly defined institutional primitive | §30.1 | NOT STARTED |
| SUCCESS-02 | Internal/entrusted values derived from explicit technologies and commercial profits | §30.2 | NOT STARTED |
| SUCCESS-03 | Organizational route choice is endogenous | §30.3 | NOT STARTED |
| SUCCESS-04 | Model identifies how MAH changes expected value of **advancing viable projects toward commercialization**, not a mechanical rise in all upstream R&D | Amend. §V (replaces §30.4) | NOT STARTED |
| SUCCESS-05 | Reform may have zero effect for many project–firm pairs; may affect original/incremental differently | Amend. §V (replaces §30.5) | NOT STARTED |
| SUCCESS-06 | Strongest response for research-capable, manufacturing-constrained developers; O-vs-I relative response theoretically agnostic absent extra primitive restrictions | Amend. §V (replaces §30.6) | NOT STARTED |
| SUCCESS-07 | CMO scarcity is an equilibrium attenuation mechanism | §30.7 | NOT STARTED |
| SUCCESS-08 | Model remains partial equilibrium, aligned with feasible empirical identification | §30.8 | NOT STARTED |
| SUCCESS-09 | Baseline does not rely on logit option-value tautology | §30.9 | NOT STARTED |
| SUCCESS-10 | Central comparative statics follow from a small set of interpretable primitives | §30.10 | NOT STARTED |
| SUCCESS-11 | Baseline consistent with clinical development rising while patent applications do not | Amend. §V (new) | NOT STARTED |
| SUCCESS-12 | Model need not explain Shi Gu's patent-reallocation result unless R-vs-D extension is activated | Amend. §V (new) | NOT STARTED |
| SUCCESS-13 | Empirical contribution centers on commercialization organization (retained separation, manufacturing mismatch, CMO scarcity), not reproducing Shi Gu's R-vs-D mechanism | Amend. §V (new) | NOT STARTED |

---

*This matrix is updated at the start of every phase (re-read requirement,
execution note preamble step 4) and at the close of every phase's audit
gate.*
