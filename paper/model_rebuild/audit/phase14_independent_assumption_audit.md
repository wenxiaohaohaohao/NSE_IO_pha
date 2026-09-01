# Phase 14 Independent Assumption Audit

## Audit question

Does the reorganized ledger state only economically primitive or mathematically
necessary regularity conditions, while deriving rather than assuming the six
propositions and the novelty corollary?

## Independent reconstruction

1. Demand and commercial return require a demand kernel, a feasible pricing
   domain, and a convergent commercial present value. The markup, SOC and signs
   of \(R_q\) and \(R_c\) follow from optimization; they are not assumptions.
2. Manufacturing requires internal feasibility/technology, external
   technology and deterministic-choice regularity. A finite cutoff additionally
   needs cell-specific endpoint crossing. Strict monotonicity of the value gap
   follows from \(R_c<0,c_{I,k}<0,F_{I,k}<0\); cutoff existence and uniqueness
   are therefore conclusions.
3. Project advancement requires one common control, convex cost, an ex ante
   project draw, finite expected route value, correct timing and exogenous
   realization. The optimizer and its policy response follow from the KKT
   problem. The novelty mixture is an accounting decomposition and cannot rank
   the two classes without further primitive restrictions.
4. CMO equilibrium requires convex qualified-capacity cost, background demand,
   atomless aggregation and a single price-taking market. Supplier supply,
   demand monotonicity, clearing and the cross-regime price comparison are
   derived. The post-MAH price cannot be inserted as a direct policy primitive.

## Proposition-by-proposition finding

| Result | Audit finding |
|---|---|
| Proposition 1 | Uses technology and crossing conditions; does not assume a cutoff, winning route or global applicability |
| Proposition 2 | Uses deterministic maximization; strict gain is limited to the explicitly defined relevant set |
| Proposition 3 | Uses common-control cost/value/timing; the \(k_i\) response additionally and explicitly requires \(\nu\geq1\) |
| Novelty corollary | Uses only the common-control mixture and invariant realization; neither class is ranked |
| Proposition 4 | Existence and uniqueness are reconstructed from low/high-price boundaries and opposite monotonicities |
| Proposition 5 | The equilibrium price order and attenuation are derived; zero-demand and perfectly elastic supply boundaries are retained |
| Proposition 6 | Preserves advancement-before-route timing and does not turn patent applications into a baseline outcome |

## Boundary and orphan-reference audit

- The authoritative taxonomy has exactly four blocks and 18 canonical IDs.
- All 46 legacy IDs are mapped exactly once to a canonical assumption or an
  `ARCH-*` scope guard.
- Earlier approved references remain resolvable through the alias ledger.
- One \(x_i\) is retained; \(g\in\{O,\mathrm{Inc}\}\) remains an empirical
  classifier and no \(x_{ig}\) control is introduced.
- Fixed-price, finite-wedge, binary-policy and equilibrium-price comparisons
  remain distinct.
- No patent increase, class ranking, route choice, cutoff or equilibrium-price
  sign is imposed as an assumption.

## Result

The independent audit finds no P0 and no P1. The assumptions are sufficient
for the results to which they are attached, and desired conclusions have not
been substituted for primitives or regularity conditions.
