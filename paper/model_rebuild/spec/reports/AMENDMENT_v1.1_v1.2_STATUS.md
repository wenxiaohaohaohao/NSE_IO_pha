# AMENDMENT v1.1 / v1.2 STATUS

Status: `APPROVED`  
Branch: `codex/mah-model-rebuild`  
Locked base: `cd5b6e49608749e0bf32f3d9aa235a84f378347b`  
Effective-spec SHA256: `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`

## Required v1.1 status fields

### Sections modified

PASS — v1.1 sections A-W are represented in the effective specification and construction record. Application used 55 unique-anchor or controlled terminology operations. Frozen source files were not edited.

### New red lines added

PASS — `RL-21` through `RL-28` were appended to the original 20 red lines. The effective red-line section contains the complete ordered sequence 1-28.

### Terminology replacements

PASS — the canonical definition is:

\[
x_i=\text{original-drug innovation investment / project-advancement intensity}.
\]

It is broader than pure clinical-development effort, but it is not patent applications, basic research, or upstream scientific discovery.

### Changes to Phase 5

PASS — Phase 5 is renamed Project-Development / Advancement Problem; `C_X` is preferred; the optimization, FOC and value-gap structure are retained; interpretation is restricted to advancing viable projects toward route planning.

### Changes to propositions

PASS — Proposition 3 is renamed and its interpretation narrowed. A novelty-composition corollary is added without adding a seventh substantive proposition. Novelty classes use \(g\in\{O,\mathrm{Inc}\}\).

### Changes to empirical mapping

PASS — the mapping distinguishes capability, project advancement, route organization, realized products and upstream patents. Candidate proxies carry explicit construct-validity limits. The timing chain is split into anticipated option value and later realized assignment.

### New extension boundary

PASS — the research-versus-development allocation block is isolated in extensions and requires separate approval.

### Potential conflict with work already completed

PASS WITH SCHEDULED FOLLOW-UP — no new-rebuild Phase has been completed, so there is no Phase output to repair. The legacy manuscript and `research_notes/model_notes/` use old logit/inclusive-value/eta/generic-R&D objects; they remain read-only and are scheduled for Phase 12 crosswalk and Phase 18 integration.

### Files that must be revised

- Phase 1-17: only new rebuild modules and new `paper/model_notes/` files.
- Phase 12: crosswalk must inventory dependencies in the legacy manuscript, appendix and old notes without editing them.
- Phase 18 only after approval: `paper/manuscript/mah_route_indicator_friction_model.tex`, its appendix, and directly dependent references/text.

### P0 issues requiring approval

None at the specification checkpoint.

Detailed Shi Gu claims are `UNVERIFIED`. This is a P1 evidence issue now and becomes a P0 blocker at Phase 16/18 if unresolved. It does not authorize unsupported claims.

## Item-by-item amendment audit

| Requirement | Result | Evidence |
|---|---|---|
| `AMD11-A` | PASS | effective §0 precision block and construction record |
| `AMD11-B` | PASS | model-lineage empirical boundary with verification qualifier |
| `AMD11-C` | PASS | ordered red lines 21-28 |
| `AMD11-D` | PASS | `g={O,Inc}`, `rho_g`, `F_g`, common `x_i` |
| `AMD11-E` | PASS | Phase 1 timing replacement |
| `AMD11-F` | PASS | Phase 5 title, `C_X`, optimization terminology |
| `AMD11-G` | PASS | downstream value-gap interpretation |
| `AMD11-H` | PASS | Proposition 3 title and bounded interpretation |
| `AMD11-I` | PASS | novelty ambiguity corollary |
| `AMD11-J` | PASS | planning interpretation and common-control type outcomes |
| `AMD11-K` | PASS | outcome hierarchy/data boundary |
| `AMD11-L` | PASS | empirical table and two timing-consistent chains |
| `AMD11-M` | PASS | research-development extension quarantine |
| `AMD11-N` | PASS | crosswalk additions |
| `AMD11-O` | PASS | dependency and exclusion branches |
| `AMD11-P` | PASS | novelty/patent assumption restrictions |
| `AMD11-Q` | PASS | object-specific result interpretation |
| `AMD11-R` | PASS | Phase 16 terminology and appendix boundary |
| `AMD11-S` | PASS | audit questions 11-16, P0 rule |
| `AMD11-T` | PASS | Phase 18 integration limits |
| `AMD11-U` | PASS | empirical evidence checkpoint and UNVERIFIED handling |
| `AMD11-V` | PASS | success criteria 4-6 and 11-13 |
| `AMD11-W` | PASS | amendment checkpoint and mandatory pause |
| `AMD12-01` | PASS | v1.2 canonical definition; v1.1 otherwise retained |

## Governance repairs required by the active plan

| Repair | Result |
|---|---|
| Incremental class `I` conflicts with internal route `I` | PASS — class renamed `Inc` |
| v1.1's optional `x_ig` conflicts with common-control baseline | PASS — common `x_i` plus `rho_g F_g` used |
| Observed holder-producer split appeared before ex ante effort in empirical chain | PASS — anticipation and realization chains separated |
| Example status table had 15 rows | PASS — expanded to formal Phase 1-18 |
| Full draft appeared too early in example table | PASS — assigned to Phase 15, approval required before Phase 16 |

## Approval and next action

User approval was recorded at 2026-08-30T13:11:40.9653412+08:00. Create and push exactly one specification commit, then begin Phase 1. This approval does not extend to Phase 1 results or Phase 2.
