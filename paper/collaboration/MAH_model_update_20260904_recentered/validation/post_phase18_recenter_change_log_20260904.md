# Post-Phase-18 Recenter Change Log

Date: 2026-09-04
Source instruction SHA256: `78FE720E4BEEE624FFF3DDF0E1D51CD7FE773178BBE4740E7951B39DDDD0E45E`

## Baseline finance objects removed

- developer type changed from $(a_i,k_i,\ell_i)$ to $(a_i,k_i)$;
- joint distribution changed from $H(a,k,\ell)$ to $H(a,k)$;
- $\ell_i$, $J_I$, $J_E$, financeability screens, finance-adjusted route
  values, and the financing corridor were removed from baseline timing,
  route choice, advancement, CMO demand, equilibrium, propositions, and the
  empirical mapping table;
- all baseline route comparisons again use ordinary $W_i^I,W_i^E,W^T,W^A$.

## Internal-production interpretation

The positive hard capability cutoff was removed. For every $k_i>0$,
$c_I(m,k_i)$ and $F_I(m,k_i)$ are finite; weak capability can make them very
high. The single-crossing derivative remains positive. Cutoff existence now
uses a finite-point value crossing rather than a binary feasibility boundary.

## Main-text propositions rewritten

1. `prop:main-finance-sorting` became
   `prop:main-organizational-sorting`.
2. `prop:main-financing-corridor` became `prop:main-relevant-set`.
3. `prop:main-finance-advancement` became `prop:main-advancement`.
4. `prop:main-finance-cmo` became `prop:main-cmo`.

The two finance-adjusted equation labels
`eq:p16m-finance-adjusted-internal` and
`eq:p16m-finance-adjusted-entrusted` were removed. No replacement equation
labels were needed because the ordinary route values were already defined.

## Financing extension location

The retained financing structure is now
`paper/model_rebuild/15_financing_commercialization_extension.tex`. It is
explicitly inactive, follows the general extension-quarantine module in the
technical appendix, separates liquidity thresholds from real costs, and
includes exact nesting when liquidity never binds.

## Prose and empirical mapping

The abstract, introduction, Gu boundary, empirical table, finance-heterogeneity
subsection, and conclusion now describe commercialization organization as the
primary mechanism. Manufacturing capability is the primary heterogeneity;
financing is a secondary pre-policy test. Hall--Lerner appears only in that
extension-based discussion. Patents remain outside the baseline.

## Unresolved theoretical issues

None at P0 or P1. Empirical promotion of financing remains deliberately
conditional on future evidence; this is a research boundary, not an
unresolved baseline derivation.
