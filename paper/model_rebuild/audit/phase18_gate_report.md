# Phase 18 Gate Report

Date: 2026-09-01  
Entry commit: aae9b14fdbdd7da94dfd6ea3c88d5e1da815cb2d  
Effective-spec SHA256:
855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666

## 1. Overall result

- Explicit Phase 18 manuscript approval: YES.
- Pre-integration backup: PASS; six source/PDF copies are hash-identical.
- Main manuscript integration: PASS.
- Technical appendix integration: PASS.
- Bibliography and Shi Gu evidence boundary: PASS.
- Final main build: PASS; 12 pages.
- Final appendix build: PASS; 32 pages.
- Final labels, references, citations, and notation: PASS.
- Automated approved-state audit: PASS; 97 of 97 checks.
- Full 44-page visual inspection: PASS.
- Independent review: PASS after one editorial P1 family was corrected across
  two review passes.
- P0: 0.
- P1 remaining: 0.
- Locked-architecture change: NO.
- Evidence blocker: NONE.
- Scope violation: NONE.
- Overall gate: PASS.

## 2. Phase deliverable and gate

| ID | Requirement | Result | Evidence |
|---|---|---|---|
| P18-D01 | scoped manuscript integration and final build | PASS | final main/appendix sources and PDFs; integration map; diff summary |
| P18-G01 | explicit approval, backup, scoped diff, compile/label/reference/notation audit | PASS | approval record; backup manifest; audit JSON; render and independent reviews |

## 3. Absolute Red Lines

| ID | Result | Final manuscript evidence |
|---|---|---|
| RL-01 | PASS | novelty is an exogenous O/Inc classifier only |
| RL-02 | PASS | no permanent firm taxonomy |
| RL-03 | PASS | no multi-product state or portfolio closure |
| RL-04 | PASS | entry appears only as a separate possible extension |
| RL-05 | PASS | no stationary firm-population block |
| RL-06 | PASS | no household, capital accumulation, growth, or welfare closure |
| RL-07 | PASS | M has no direct arrow to research capability a_i |
| RL-08 | PASS | M has no direct arrow to demand or project quality |
| RL-09 | PASS | s(q) and s_g(q) are exogenous and MAH-invariant |
| RL-10 | PASS | p_m^* is endogenous and is not assumed to fall |
| RL-11 | PASS | E retains holder rights and is distinct from transfer T |
| RL-12 | PASS | logit is absent from baseline and isolated in extensions |
| RL-13 | PASS | no continuous eta remains in the final active baseline |
| RL-14 | PASS | no borrowed state variable enters the baseline |
| RL-15 | PASS | manuscript stayed unchanged through Phase 17; Phase 18 had separate approval and byte-preserving backup |
| RL-16 | PASS | empirical interfaces reject primitive-by-primitive identification |
| RL-17 | PASS | formal derivations and proofs remain primary evidence |
| RL-18 | PASS | symbol and label meanings are unique in the expanded final sources |
| RL-19 | PASS | every proposition object is defined beforehand |
| RL-20 | PASS | no welfare claim is inferred from private value or output |
| RL-21 | PASS | x_i is project-advancement intensity, not upstream patent research |
| RL-22 | PASS | no claim that MAH must raise patent applications |
| RL-23 | PASS | no claim that MAH must raise upstream scientific research |
| RL-24 | PASS | no forced positive original/breakthrough response |
| RL-25 | PASS | no baseline x_i^R, x_i^D, finance constraint, or R&D allocation |
| RL-26 | PASS | a patent decline does not by itself falsify the mechanism |
| RL-27 | PASS | no original-versus-incremental response ranking |
| RL-28 | PASS | contribution remains commercialization organization and CMO scarcity |

## 4. Proof QA

| IDs | Result | Final verification |
|---|---|---|
| QA-PROOF-01, QA-PROOF-02, QA-PROOF-03, QA-PROOF-04, QA-PROOF-05 | PASS | pricing, route values, advancement, CMO clearing, and proposition proofs remain in the expanded appendix |
| QA-PROOF-06 | PASS | binary M is handled only by finite comparison |
| QA-PROOF-07 | PASS | fixed candidate price and equilibrium price are separated |
| QA-PROOF-08 | PASS | all mandatory zero-effect and limiting cases remain |
| QA-PROOF-09 | PASS | the single p_m^* fixed point and solution order are explicit |
| QA-PROOF-10 | PASS | final compilation has zero fatal, undefined, duplicate-label, rerun, or box warnings |

## 5. Economic QA

| ID | Result | Final verification |
|---|---|---|
| QA-ECON-01 | PASS | sole direct policy channel is M -> tau_E(M) |
| QA-ECON-02 | PASS | planning, route assignment, observation, and realization timing are distinct |
| QA-ECON-03 | PASS | retained E and transfer T are distinct |
| QA-ECON-04 | PASS | equilibrium claims use p_m^* |
| QA-ECON-05 | PASS | logit, dynamics, matching, entry, finance, and R&D allocation are isolated from the baseline |
| QA-ECON-06 | PASS | empirical interfaces state grain, keys, availability, and identification limits |
| QA-ECON-07 | PASS | innovation language identifies the actual project-advancement or outcome margin |
| QA-ECON-08 | PASS | Shi Gu claims retain exact page/table evidence and inference limits |

## 6. Final success criteria

| ID | Result | Final manuscript verdict |
|---|---|---|
| SUCCESS-01 | PASS | one institutional primitive governs retained-route availability |
| SUCCESS-02 | PASS | explicit technologies and commercial-profit kernel |
| SUCCESS-03 | PASS | deterministic endogenous route choice |
| SUCCESS-04 | PASS | MAH affects common advancement only through Omega_i |
| SUCCESS-05 | PASS | zero-effect conditions are explicit |
| SUCCESS-06 | PASS | heterogeneous responses with no novelty ranking |
| SUCCESS-07 | PASS | endogenous CMO price attenuates direct gains |
| SUCCESS-08 | PASS | closure is exactly the four-object partial equilibrium |
| SUCCESS-09 | PASS | no baseline logit or inclusive-value tautology |
| SUCCESS-10 | PASS | comparative statics identify held-fixed objects and sufficient conditions |
| SUCCESS-11 | PASS | clinical-trial and patent margins may diverge |
| SUCCESS-12 | PASS | patent reallocation and separate R&D controls remain outside baseline |
| SUCCESS-13 | PASS | contribution remains commercialization organization, manufacturing mismatch, retained authorization, and CMO scarcity |

## 7. Build, citations, and visual verification

| Artifact | Pages | Final log | Visual result |
|---|---:|---|---|
| mah_route_indicator_friction_model.pdf | 12 | PASS; zero audited warnings | all 12 pages PASS |
| mah_route_indicator_friction_model_appendix.pdf | 32 | PASS; zero audited warnings | all 32 pages PASS |

Both BibTeX runs load the existing aer style and the project bibliography.
Every citation key is defined; Gu2024 is present. Main and expanded-appendix
label namespaces contain no duplicates.

## 8. Independent review and P1 correction

Three read-only reviewers found no P0. Across two review passes they identified
one editorial P1 family: reader-visible internal workflow/audit language and
Phase-only source comments in the appendix inputs. Phase 18 removed that
language and the redundant local crosswalk table, rebuilt the appendix, reran
all automated checks, and reinspected the affected pages.
No equation, proof, active label, assumption, or economic conclusion changed.
The final independent result is P0 = 0 and P1 remaining = 0.

## 9. Scope and preservation

- Exactly three files changed under paper/manuscript/.
- Exactly two final PDFs changed under paper/output/.
- The appendix-input prose corrections are enumerated in the diff summary.
- The technical memo remains byte-identical to the locked base.
- The original checkout's modified collaborator ZIP is absent.
- All build, audit, render, backup, and temporary activity remained on D:.

The explicit Phase 18 authorization, successful zero-P0 gate, and correction
of the only P1 family satisfy the final state transition to APPROVED.
