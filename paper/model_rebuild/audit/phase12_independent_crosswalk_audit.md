# Phase 12 Independent Crosswalk Audit

## 1. Review question

Does the Phase 12 crosswalk identify every legacy dependency of the objects
that are deleted, replaced, retained, or quarantined, without modifying the
legacy sources or importing an old mechanism into the new baseline?

## 2. Independent inventory review

The generated occurrence index contains 1,242 rows across all 24 CW IDs and
all thirteen authorized legacy evidence files:

| Evidence class | Indexed rows |
|---|---:|
| rows inside an equation environment | 274 |
| rows inside a proposition, lemma, or corollary | 81 |
| calibration or empirical rows | 300 |
| appendix rows | 570 |
| rows with an enclosing equation/proposition label | 312 |

Roles overlap: an appendix row may also be an equation, proposition, or
calibration row. The counts therefore are coverage diagnostics rather than
mutually exclusive partitions.

Every indexed row was checked against the UTF-8 source line named in the CSV.
No source path, line number, or exact-text mismatch was found. No CW ID is
missing. The two locked manuscript files and eleven named legacy notes are
all represented.

## 3. Object-by-object economic review

| IDs | Independent conclusion |
|---|---|
| CW-01--CW-03 | The old return/continuation stack is fully removed; \(R(q,c)\) and the nonrecursive value gap are not aliases for the old primitives |
| CW-04--CW-07 | Internal and external technology accounting is explicit; feasibility and holder responsibility are preserved without the old dummies/composites |
| CW-08--CW-13 | Binary \(M\) is retained; continuous \(\eta\), route-specific realization, logit, inclusive value, and strict log-sum gain are removed |
| CW-14--CW-15 | The generalized cost and nonlinear \(x_i^*\) formula replace both the old objective and every direct derivative consequence |
| CW-16--CW-19 | The CMO market and planning/observed distinction remain; transfer stays an outside option; entry is excluded |
| CW-20--CW-24 | v1.2 semantics, planned-project meaning, patent boundary, conditional innovation claim, and novelty-mixture restriction are all explicit |

The crosswalk does not silently retain \(\Gamma_i\) as \(\Omega_i\):
\(\Omega_i\) is the expectation of a deterministic maximum over project
heterogeneity. It also does not silently relabel the old quadratic solution:
the exponent \(1/\nu\), corner, and \(\nu=1\) boundary are recorded.

## 4. Dependency-class review

The crosswalk separately records:

1. main equations and definitions;
2. main propositions and their derivative chains;
3. main narrative and empirical/calibration claims;
4. appendix equations, propositions, aggregation modules, and protocols;
5. legacy symbol, dependency, assumption, Bellman, consistency,
   proposition, and calibration notes; and
6. the bounded Phase 18 action for each object.

The occurrence CSV is the exhaustive line-level evidence. The Markdown
crosswalk is the decision authority. Neither artifact alone substitutes for
the other.

## 5. Scope and integrity review

- paper/manuscript is byte-identical to the locked base.
- research_notes/model_notes has no diff from the locked base.
- The original checkout’s collaborator ZIP is absent from the rebuild
  worktree status and commit scope.
- The Phase 12 compile wrapper imports only the approved Phase 1--10 baseline;
  it does not import the quarantined Phase 11 extensions.
- All generated output, logs, PDF, and temporary files are inside the D-drive
  model-rebuild worktree.
- The unresolved detailed Shi Gu claims remain an explicitly deferred evidence
  issue. They do not affect the Phase 12 crosswalk, but remain blocking for
  Phase 16 wording if unresolved.

Independent review conclusion: no P0 and no new P1. The existing
Shi Gu evidence issue remains deferred exactly as recorded.
