# 06 Open Issues Log

## OPEN — ISSUE-SPEC-001

- ID: `ISSUE-SPEC-001`
- Phase: Specification checkpoint; blocking gate at Phase 16 and Phase 18
- Equation/object: Shi Gu (2024) empirical-boundary claims
- Severity now: `P1-EVIDENCE`
- Issue: The SSRN abstract verifies the core clinical-development/patent/incremental boundary, but the supplied v1.1 details on first-stage trials, high-value/granted/core patents, original biological drugs, and pure-researcher transitions have not yet been verified by page and table in the formal paper PDF.
- Why it matters economically: These details determine which heterogeneity claims may be presented as established evidence rather than extension motivation.
- Why it matters mathematically: It does not change Phase 1-15 derivations, but it constrains interpretation of class-specific outcomes and the Phase 16 boundary subsection.
- Candidate resolutions: obtain the official paper PDF; record version, page/table and exact result; mark each claim VERIFIED, PARTIALLY VERIFIED, CONTRADICTED, or UNVERIFIED.
- Preferred resolution: full primary-source verification before Phase 16.
- Does this alter the locked architecture? `NO`
- Approval required before change? `NO` for verification; `YES` for any resulting architecture change
- Escalation rule: unresolved status becomes a P0 blocker at Phase 16 and Phase 18.

## OPEN — ISSUE-SPEC-002

- ID: `ISSUE-SPEC-002`
- Phase: Phase 12 and Phase 18
- Equation/object: legacy manuscript and `research_notes/model_notes/`
- Severity now: `P1-SCHEDULED-CROSSWALK`
- Issue: The locked manuscript still uses logit, inclusive value, continuous `eta`, generic R&D terminology and the old closure stack.
- Why it matters economically: These objects conflict with the new deterministic baseline.
- Why it matters mathematically: Old equations and propositions cannot be mixed with the rebuilt modules.
- Candidate resolutions: complete Phase 12 dependency crosswalk; replace only approved model/directly dependent text in Phase 18.
- Preferred resolution: follow the scheduled Phase 12/18 process while keeping legacy files read-only beforehand.
- Does this alter the locked architecture? `NO`
- Approval required before change? `YES`, at Phase 18

## Closed specification decisions

- `CLOSED-SPEC-001`: incremental class notation changed from `I` to `Inc` to avoid collision with internal route `I`.
- `CLOSED-SPEC-002`: common `x_i` retained; novelty decomposition uses `rho_g F_g` rather than `x_ig`.
- `CLOSED-SPEC-003`: empirical timing chain split into anticipated option value and later realized assignment.
- `CLOSED-SPEC-004`: the status table is expanded to formal Phase 1-18 and full draft assembly is assigned to Phase 15.
