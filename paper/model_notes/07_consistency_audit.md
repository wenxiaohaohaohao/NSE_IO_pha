# 07 Phase 17 Global Consistency Audit

Date: 2026-09-01

## 1. Audit target and method

This audit covers:

- `paper/model_rebuild/13_main_text_model_candidate.tex`;
- `paper/model_rebuild/14_appendix_model_candidate.tex` expanded through all
  of its imported modules;
- `paper/model_rebuild/10_empirical_mapping.tex` and the Phase 15 full-draft
  assembly that imports it; and
- the research-versus-development boundary that appears between the approved
  baseline modules and `11_extensions_not_baseline.tex`.

The main candidate remains byte-identical to Phase 16. Phase 17 corrected two
evidence-boundary sentences in the appendix container:

| Candidate | SHA256 |
|---|---|
| Main text | `1FEBFBE7C6F989C817937CBB49377E8816C60CEB790B4713884F6BE54367B688` |
| Appendix container, Phase 16 entry | `8165589801A389FADA4CD3ED9957F8F2D01B1B787569861C08B1A3CBD64194FF` |
| Appendix container, after Phase 17 P1 correction | `PENDING FINAL HASH` |

The audit combines four checks:

1. a case-sensitive occurrence catalog of every required core object;
2. manual review of each occurrence class against the symbol registry,
   dependency map, assumptions, and 28 red lines;
3. rule-based scans for forbidden arrows, mechanisms, timing reversals, and
   price-scope errors; and
4. fresh two-pass compilation, label/reference inspection, and locked-scope
   Git checks.

The occurrence catalog contains 1,489 rows. Each row records candidate
surface, baseline/boundary/extension scope, source file, line, matched token,
variant, category, canonical meaning, permitted direct MAH shift, and source
context:

`paper/model_rebuild/audit/phase17_occurrence_catalog.csv`.

## 2. Exhaustive core-object ledger

Upper-case `M` and lower-case `m` are counted case-sensitively and retain
different meanings.

| Object | Occurrences | Classification and single meaning | Direct MAH shift | Consistency result |
|---|---:|---|---|---|
| `M` | 135 | primitive binary institutional regime, pre-MAH `0` and MAH `1` | it is the policy object | PASS; never differentiated as continuous |
| `tau_E` | 31 | primitive monetary/legal barrier attached only to retained entrusted route `E` | yes, only as `tau_E(M)` | PASS; `+infinity` pre-MAH and finite post-MAH |
| `p_m` | 295 | qualified manufacturing-service capacity price; 253 candidate/generic occurrences and 42 starred equilibrium occurrences | no direct shift | PASS; fixed-candidate and equilibrium usages are separated |
| `a_i` | 173 | predetermined capability for generating viable planning-stage projects per advancement input | no | PASS; never becomes current patent effort or a policy outcome |
| `k_i` | 79 | predetermined internal manufacturing capability | no | PASS; affects route technology/value, not advancement cost |
| `q` | 230 | exogenous project commercial/scientific value shifter | no | PASS; not changed by MAH |
| `m` | 232 | exogenous manufacturing requirement/complexity | no | PASS; not a policy or price object |
| `s(q)` | 34 | exogenous route-independent downstream realization probability | no | PASS; distinct from post-commercialization survival `varphi` |
| `W_I` | 13 | internal-manufacturing route value `W_i^I` | indirect only | PASS; explicit technology and one-time cost accounting |
| `W_E` | 30 | retained entrusted-manufacturing route value `W_i^E` | only through `tau_E(M)`, then equilibrium feedback | PASS; holder rights remain with developer |
| `W_T` | 10 | finite non-retained transfer/out-licensing value `W^T` | no | PASS; never identified with `E` |
| `Omega_i` | 88 | expected optimized value per planning-stage project | indirect only | PASS; integral of deterministic optimized route value |
| `x_i` | 139 | common original-drug innovation investment / project-advancement intensity; 81 control and 58 optimized occurrences | only through `Omega_i` | PASS; neither pure clinical effort nor patent-generating research |

The catalog covers the main candidate, appendix container, ten approved
baseline/proof modules, the empirical interface, the Phase 15 full-draft
container, and the quarantined extension module. The full-draft container has
no standalone match because it only imports the audited modules. No required
object has an uncatalogued formal surface or an empty classification.

## 3. Policy-channel audit

The only direct policy chain is

`M -> tau_E(M)`, whose infinite/finite value encodes the effective
unavailability/availability of retained entrusted manufacturing `E`.

The search found no active formula or positive causal statement of:

- `M -> a_i`, `M -> k_i`, `M -> q`, `M -> m`, or `M -> s(q)`;
- `M -> c_I`, `F_I`, `c_E`, `b(m)`, `F_E`, or `mu_E`;
- a direct `M -> p_m^* down` shift;
- a direct `M -> x_i^*` channel outside `Omega_i`; or
- a derivative with respect to binary `M`.

The permitted ex ante chain is

`M -> anticipated availability/value of E -> Omega_i -> x_i^*`.

Strict effects require the positive-measure MAH-relevant set and the stated
value conditions. Zero effects remain explicit. Result: `PASS`.

## 4. Fixed-price and equilibrium-price audit

The candidate price `p_m` is held fixed in route comparison, cutoff,
`Omega_i`, advancement, demand, and supplier best-response calculations.
The starred price `p_m^*` appears only after the scalar CMO clearing condition
closes the outer fixed point.

The candidates preserve:

- local derivatives with respect to continuous `p_m` or `tau_E`;
- finite comparisons for binary `M`;
- `p_m^*(1) >= p_m^*(0)` under unchanged supply and nonnegative study demand;
- scarcity attenuation between direct fixed-price and equilibrium-price
  gains; and
- the distinction between product price `p^*(c)` and capacity price
  `p_m^*`.

No cutoff derivative at fixed `p_m` is presented as an equilibrium derivative,
and no candidate-price object is described as a second market-clearing price.
Result: `PASS`.

## 5. Timing and observed-outcome audit

Both candidates retain the sequence:

1. observe `M` and anticipate market-consistent `p_m^*`;
2. choose the common `x_i`;
3. obtain planning-stage projects and draw `(q,m)`;
4. assign `I/E/T/A` deterministically;
5. realize downstream product outcomes with `s(q)`; and
6. impose the simultaneous CMO-price consistency condition.

Actual holder--producer separation is observed only after route `E` is
assigned. It is never written as a cause of the earlier `x_i` choice.
Planning-stage intensity, route assignment, holder--producer separation,
approval/launch, and retained realized products remain distinct objects.
Result: `PASS`.

## 6. Retained route versus transfer audit

Every substantive definition of `E` says that the developer remains the
authorization holder and a qualified external producer manufactures.
Route `T` is a finite non-retained outside value. The conditional `I/E`
cutoff is never used without preserving `T/A` as possible outside options.
No occurrence equates entrusted manufacturing with ownership or authorization
transfer. Result: `PASS`.

## 7. Baseline and extension quarantine

The main candidate contains no active logit probability, inclusive value,
continuous implementation parameter, separate research/development controls,
financial constraint, entry condition, matching function, dynamic portfolio,
welfare closure, or additional market-clearing equation.

The expanded appendix contains a few deliberate lexical references that are
not active baseline mechanisms:

| Lexical item | Location and disposition |
|---|---|
| `eta` | `03_internal_external_technologies.tex:150-151`, local old-to-new crosswalk: explicitly removed from baseline |
| logit / inclusive value | main candidate and approved scope conclusions: explicit negative boundary statements |
| entry / welfare | equilibrium and scope boundaries: explicitly excluded |
| `x_{ig}` | common-control statements: explicitly says no such control |
| patents / research | v1.2 terminology and empirical-boundary statements: explicitly outside baseline endogenous outcomes |

The only active logit formula, optional transfer microfoundation, dynamics,
matching, and separate `x_i^R/x_i^D` research-allocation discussion occur in
`11_extensions_not_baseline.tex`. The appendix inputs that module last, after
the explicit research-versus-development boundary. No quarantined object has
an arrow into a baseline equation or proposition. Result: `PASS`.

## 8. Innovation and empirical-language audit

- `x_i` is consistently broader than pure clinical-development effort but
  excludes upstream scientific research, compound discovery, patent effort,
  and patent applications.
- No theoretical statement says MAH must raise patents, upstream research,
  original innovation, or breakthrough innovation.
- Original and incremental classes share `x_i` and use `rho_g F_g`; the
  baseline imposes no ranking and retains both zero-effect class boundaries.
- The Shi Gu subsection separates verified empirical facts from the present
  mechanism. It does not activate finance, entry, or research-allocation
  blocks.
- `SG-05` and `SG-06` retain the explicit precision limit that the paper
  reports no formal cross-column equality test.
- Candidate empirical statements concern composite predictions and do not
  claim separate identification of every primitive.

Result: `PASS`.

## 9. Answers to the sixteen mandatory questions

| No. | Required question | Answer | Evidence/result |
|---:|---|---|---|
| 1 | Is each object defined once and used consistently? | Yes | 1,460-row occurrence catalog and canonical ledger |
| 2 | Is each object classified as primitive or endogenous? | Yes | symbol registry and Section 2 table |
| 3 | Can MAH shift it directly? | Only `tau_E(M)` | forbidden-arrow scan PASS |
| 4 | Does any object acquire a second economic meaning? | No | upper/lower case and route/value checks PASS |
| 5 | Does empirical mapping overclaim identification? | No | composite-object/data-boundary language retained |
| 6 | Are equilibrium and fixed-price values used consistently? | Yes | Section 4 PASS |
| 7 | Is planning confused with observed approval? | No | Section 5 PASS |
| 8 | Is retained `E` confused with ownership transfer? | No | Section 6 PASS |
| 9 | Is CMO price endogenous everywhere it should be? | Yes | scalar clearing and fixed-point audit PASS |
| 10 | Does active old logit/inclusive-value language remain in baseline? | No | only negative crosswalk/scope language remains |
| 11 | Is `x_i` patent research or pure clinical effort? | No | v1.2 definition preserved |
| 12 | Does theory claim MAH must raise patents? | No | patents explicitly outside baseline |
| 13 | Does theory claim MAH must raise original/breakthrough innovation? | No | zero effects and no-ranking corollary retained |
| 14 | Are original/incremental effects agnostic absent extra assumptions? | Yes | common control and reverse-support boundary |
| 15 | Is Shi Gu's resource-allocation mechanism imported? | No | extension quarantine PASS |
| 16 | Is “innovation” broader than the actual mathematical margin? | No | substantive claims name project advancement, route, or realized product |

Questions 11--16 have zero terminology/mechanism violations.

## 10. Compilation, labels, and protected scope

- Main candidate: stable after two MiKTeX passes, 4 pages, zero fatal errors,
  undefined references, multiply defined labels, PDF-string warnings, or box
  warnings.
- Appendix candidate: stable after three MiKTeX passes, 33 pages, zero fatal
  errors, undefined references, multiply defined labels, PDF-string warnings,
  or box warnings.
- Full derivation draft: stable after three MiKTeX passes, 36 pages, zero fatal
  errors, undefined references, multiply defined labels, PDF-string warnings,
  or box warnings.
- Labels are unique within the main candidate and the fully expanded appendix.
- The main candidate and active modules changed only for the frozen
  `varphi in [0,1)` domain, single-policy-channel wording, evidence boundaries,
  and PDF-bookmark correction recorded in
  `audit/phase17_p1_corrections.md`.
- Pages 4, 7, 24, and 31 of the appendix candidate were rendered at 144 dpi
  and visually checked; notation, equations, line wrapping, and evidence prose
  remain legible with no clipping or overlap.
- `paper/manuscript/` remains byte-identical to locked base
  `cd5b6e49608749e0bf32f3d9aa235a84f378347b`.
- The original checkout's collaborator ZIP remains absent from this worktree.

## 11. Severity and gate conclusion

- Candidate P0: 0
- Candidate P1 remaining: 0
- P1 corrected during Phase 17: 12
- Locked-architecture change: NO
- Unresolved evidence blocker: NONE
- Manuscript modification: NONE
- Phase 17 consistency result: `PASS`

The scheduled old-model conflict in the read-only manuscript remains
`ISSUE-SPEC-002 / P1-SCHEDULED-CROSSWALK`. It is not a candidate defect and
must be resolved only through the separately authorized Phase 18 integration.
