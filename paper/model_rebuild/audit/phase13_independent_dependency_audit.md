# Phase 13 Independent Dependency Audit

## 1. Coverage

The source catalog independently extracts 89 unique labeled equations from
the approved Phase 1--10 TeX modules:

| Phase | Equation labels |
|---:|---:|
| 1 | 10 |
| 2 | 9 |
| 3 | 7 |
| 4 | 11 |
| 5 | 11 |
| 6 | 11 |
| 7 | 5 |
| 8 | 18 |
| 9 | 5 |
| 10 | 2 |
| Total | 89 |

The dependency map contains 89 equation-ledger rows and 89 unique source
labels. Every catalog label appears in exactly one ledger row. The earlier
omissions for the Phase 1 causal chains, Phase 2 pricing problem/SOC, Phase 4
binary comparison/cutoff sorting, and Phase 5 FOC/value-gap FOC are closed.

## 2. Re-derivation of the only feedback loop

At a candidate capacity price \(p\):

1. all route values are explicit;
2. deterministic \(r_i^*\) and optimized \(W_i\) are single valued almost
   surely;
3. integration gives \(\Omega_i\);
4. the strictly concave advancement problem gives unique \(x_i^*\);
5. \(r_i^*\), \(x_i^*\), and \(b(m)\) give \(D_m\);
6. each strictly concave supplier problem gives \(s_j^*\), hence \(S_m\).

Thus \(Z_M(p)=D_m(p;M)-S_m(p)\) is a scalar function. There is no unresolved inner cycle. The apparent arrows
\(p\to(r_i^*,\Omega_i,x_i^*)\to D_m\to p\) are closed by one root.

Existence follows from continuity, \(Z_M(0)>0\), and a negative high-price
limit. Uniqueness follows because demand is weakly decreasing and supply is
strictly increasing. Continuous aggregate demand under deterministic choice
requires zero-measure ties, pointwise convergence off the tie set, and a
common integrable envelope. Removing any of these maintained regularity
conditions removes the corresponding conclusion; the map does not hide a
selection rule.

## 3. Price-comparison audit

The old map sentence that imposed no cross-regime price sign was stale. Under
the approved baseline, pre-MAH study demand is zero, post-MAH study demand is
nonnegative, and supply is invariant. Therefore
\(p_m^*(1)\ge p_m^*(0)\), strictly when post-MAH study demand is positive at
the pre-MAH price.

This is not a direct policy shift in price. It is an equilibrium consequence.
The map now separates:

- fixed-price finite comparisons in \(M\);
- local derivatives in continuous \(p_m\) or finite \(\tau_E\); and
- equilibrium comparisons after solving \(p_m^*(M)\).

The Phase 8 scarcity bounds correctly state that equilibrium price feedback
weakly attenuates the direct value and advancement gains.

## 4. Architecture review

- The only direct policy arrow remains \(M\to\tau_E(M)\).
- \(M\) is never differentiated.
- Product price \(p^*(c)\) and CMO price \(p_m^*\) remain distinct.
- Technology cost and capacity payment are not double counted.
- No logit, inclusive value, continuous \(\eta\), entry, welfare, or second
  market appears in the active dependency graph.
- Phase 11 extensions have no arrow into the baseline.
- Planning and realized outcomes follow the v1.2 timing order.

Independent review conclusion: no P0 and no P1.
