# Assumptions and Scope

**Status: Block A drafted at Phase 2; other blocks stub, opened at Phase 1,
formally populated at Phase 14** (execution note §19, amended §P).

## A. Demand and commercial-return assumptions
*(drafted in Phase 2; finalized with full assumption-usage listing per
proposition in Phase 14)*

- $A>0$ (market-size shifter, exogenous, not a function of $M$).
- $\varepsilon>1$ (demand elasticity strictly above 1, needed for a finite,
  interior optimal markup and for the profit-maximization SOC to hold:
  $\Pi''(p^*)<0$ requires $\varepsilon>1$, since the bracket term collapses
  to $-\varepsilon c<0$ only under this condition — see
  `02_demand_profit_derivation.tex` §Static pricing problem).
- $\beta\in(0,1)$ (discount factor; matches the pre-existing manuscript's
  $\beta\in(0,1)$, Assumption ass:baseline\_regular).
- $\varphi\in[0,1)$ (probability of remaining commercially active next
  period; needed jointly with $\beta<1$ so that $\beta\varphi<1$ and the
  present-value geometric series in §Present value converges). No
  pre-existing manuscript analog — new object.

## B. Manufacturing technology assumptions
*(populate in Phase 3/14)*

## C. Advancement (formerly "R&D") assumptions
*(populate in Phase 5/14; note the pre-existing manuscript's
$\kappa>0$ in $C_i^R(x_i)=\frac{\kappa}{2}x_i^2$ is the $\nu=1$ special
case of this module's general $C_X(x_i)=\frac{\kappa}{1+\nu}x_i^{1+\nu}$)*

## D. CMO-market regularity
*(populate in Phase 6/14; pre-existing manuscript's Assumption
ass:cmo\_regular is the direct predecessor — excess demand
$Z_m(p;M,\eta)$ strictly decreasing, boundary sign conditions — to be
crosswalked without the $\eta$ argument, RL-13)*

## Standing discipline rules (apply once populated)

- Every proposition must list exactly which assumptions it uses.
- Do not place a desired comparative-static sign directly into an assumption
  unless it is economically primitive and independently defensible.
- (Amend. §P) No assumption may be imposed solely to guarantee
  $\Delta\Omega_{iO}>0$ or $\Delta\Omega_{iO}>\Delta\Omega_{iI}$. Any
  sufficient condition for a stronger incremental effect must be labeled an
  **extension**, with the exact primitive restriction stated and
  economically defended. Similarly, no assumption may be imposed solely to
  force patent applications to rise after MAH.
