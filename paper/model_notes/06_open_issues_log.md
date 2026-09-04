# 06 Open Issues Log

## RESOLVED — ISSUE-SPEC-001

- ID: `ISSUE-SPEC-001`
- Phase: Specification checkpoint; blocking gate at Phase 16 and Phase 18
- Equation/object: Shi Gu (2024) empirical-boundary claims
- Severity now: `CLOSED-EVIDENCE`
- Issue: The SSRN abstract verifies the core clinical-development/patent/incremental boundary, but the supplied v1.1 details on first-stage trials, high-value/granted/core patents, original biological drugs, and pure-researcher transitions have not yet been verified by page and table in the formal paper PDF.
- Why it matters economically: These details determine which heterogeneity claims may be presented as established evidence rather than extension motivation.
- Why it matters mathematically: It does not change Phase 1-15 derivations, but it constrains interpretation of class-specific outcomes and the Phase 16 boundary subsection.
- Resolution: the user identified the August 22, 2024, 74-page paper PDF.
  `paper/model_notes/08_shigu_empirical_boundary_check.md` records source
  provenance, SHA256, pages 1, 19--26, and Tables II--IX on PDF pages
  45--52. All seven required details are verified; the two cross-class
  comparisons retain an explicit no-equality-test precision limit.
- Resolution date: 2026-09-01
- Does this alter the locked architecture? `NO`
- Approval required before change? `NO` for verification; `YES` for any resulting architecture change
- Escalation rule: closed. Reopen only if later prose exceeds the recorded
  evidence or cites a different paper version without a new version audit.

## RESOLVED — ISSUE-SPEC-002

- ID: `ISSUE-SPEC-002`
- Phase: Phase 12 and Phase 18
- Equation/object: legacy manuscript and `research_notes/model_notes/`
- Severity now: `CLOSED-INTEGRATION`
- Issue: The locked manuscript still uses logit, inclusive value, continuous `eta`, generic R&D terminology and the old closure stack.
- Why it matters economically: These objects conflict with the new deterministic baseline.
- Why it matters mathematically: Old equations and propositions cannot be mixed with the rebuilt modules.
- Candidate resolutions: complete Phase 12 dependency crosswalk; replace only approved model/directly dependent text in Phase 18.
- Preferred resolution: follow the scheduled Phase 12/18 process while keeping legacy files read-only beforehand.
- Resolution: Phase 12 completed the exhaustive dependency crosswalk while the
  legacy manuscript remained read-only. After separate explicit Phase 18
  approval and a byte-preserving pre-integration backup, Phase 18 replaced the
  old active model and directly dependent prose with the deterministic baseline,
  rebuilt both final PDFs, and passed the scope, theory, evidence, notation,
  reference, compilation, and visual audits with no remaining P0 or P1.
- Resolution date: 2026-09-01
- Does this alter the locked architecture? `NO`
- Approval required before change? `YES`; explicit Phase 18 approval received
  on 2026-09-01

## Closed specification decisions

- `CLOSED-SPEC-001`: incremental class notation changed from `I` to `Inc` to avoid collision with internal route `I`.
- `CLOSED-SPEC-002`: common `x_i` retained; novelty decomposition uses `rho_g F_g` rather than `x_ig`.
- `CLOSED-SPEC-003`: empirical timing chain split into anticipated option value and later realized assignment.
- `CLOSED-SPEC-004`: the status table is expanded to formal Phase 1-18 and full draft assembly is assigned to Phase 15.

## SUPERSEDED AND ARCHIVED — ISSUE-EXT-001

- ID: `ISSUE-EXT-001`
- Phase: post-Phase-18 separately approved extension
- Equation/object: $x_i^R,x_i^D,\bar X_i,P_i^A$
- Severity now: `SUPERSEDED-ARCHIVED`
- Issue: The approved baseline could distinguish project advancement from
  patents but did not endogenize a patent response or explain why development
  and patent applications may move in opposite directions.
- Historical resolution: on 2026-09-03 the user selected the full
  research-versus-development allocation option. That implementation and its
  audit evidence are preserved under `paper/model_rebuild/archive/`.
- Current resolution: the 2026-09-04 recentering instruction supersedes its
  active status. The current baseline has one common $x_i$, no patent
  production function, and no research/development allocation controls.
- Core result: a strict increase in $\Omega_i$ raises development and reduces
  research/patenting when the resource ceiling binds and
  $a_i>\gamma_i(x_i^D-x_i^R)$. With slack resources, development rises and
  research weakly rises instead.
- Why this is not avoidance of Gu (2024): the extension directly rationalizes
  the documented constrained-firm patent decline while stating the conditions
  under which it does and does not follow.
- Remaining empirical limitation: observed financial-resource groups do not
  directly identify the KKT multiplier, and patent applications do not
  directly identify upstream research.
- Does this alter the current baseline architecture? `NO`; the superseded
  extension is archived and no active formal document imports it.
- Current P0 issue: none.

## RESOLVED — ISSUE-RECENTER-001

- ID: `ISSUE-RECENTER-001`
- Phase: post-Phase-18 recentering revision
- Equation/object: baseline type, internal technology, and financing status
- Severity now: `CLOSED-RECENTERED`
- Issue: the 2026-09-03 revision made financing capacity and liquidity
  requirements part of the active baseline, which made the central mechanism
  broader than the commercialization-organization argument.
- Resolution: the 2026-09-04 instruction restores baseline
  $\theta_i=(a_i,k_i)$, represents weak manufacturing capability with high but
  finite $c_I$ and $F_I$, removes the hard low-$k$ cutoff, and confines
  $\ell_i,J_I,J_E$ and finance-adjusted values to an explicitly inactive
  appendix extension.
- Empirical treatment: financing remains a secondary, pre-policy
  heterogeneity test and can be promoted only if it predicts
  holder--manufacturer separation after capability and firm controls.
- Current P0 issue: none.
