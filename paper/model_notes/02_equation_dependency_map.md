# 02 Equation Dependency Map

Phase status: `PHASE 1 - APPROVED; PHASE 2 - APPROVED; PHASE 3 - APPROVED; PHASE 4 - APPROVED; PHASE 5 - APPROVED`  
This map records definitions, timing dependencies, demand/profit, manufacturing technologies, deterministic route/sorting and the Phase 5 project-advancement problem. Items marked `DEFERRED` are obligations for later authorized phases, not current results.

## 1. Phase 1 definition ledger

| ID / planned LaTeX label | Object defined | Inputs already defined | Mathematical status | First proof obligation |
|---|---|---|---|---|
| `P01-E01` / `eq:p01-developer-type` | $\theta_i=(a_i,k_i)$ | $a_i,k_i$ | definition | none |
| `P01-E02` / `eq:p01-project-draw` | $\omega=(q,m)\sim F(q,m)$ | $q,m,F$ | definition/distribution statement | none |
| `P01-E03` / `eq:p01-class-mixture` | $F=\sum_g\rho_gF_g$, $\sum_g\rho_g=1$ | $g,\rho_g,F_g$ | distribution identity | verify valid mixture weights |
| `P01-E04` / `eq:p01-institutional-wedge` | $\tau_E(0)=+\infty$, $\tau_E(1)=\bar\tau_E<+\infty$ | $M,\tau_E,\bar\tau_E$ | primitive institutional definition | Phase 3 verifies no second policy channel |
| `P01-E05` / `eq:p01-planned-intensity` | $\lambda_i^{\mathrm{plan}}=a_ix_i$ | $a_i,x_i$ | technology definition | Phase 5 adds optimization for $x_i$ |
| `P01-E06` / `eq:p01-route-domain` | feasible route labels conditional on $M$ | $M,r_i,I,E,T,A$ | choice-domain definition | Phase 4 derives $r_i^*$ from values |
| `P01-E07` / `eq:p01-downstream-probability` | downstream probability $s(q)$ | $q,s$ | primitive probability definition | Phase 4 uses it in route values |

No FOC, SOC, route cutoff, price equation, payoff equation, or comparative static belongs to Phase 1.

## 2. Phase 2 demand/profit ledger

Every Phase 2 equation conditions on project value $q>0$ and a positive route-implied marginal cost $c>0$. Phase 2 does not yet define $c_I$ or $c_E$.

| ID / LaTeX label | Object defined or result derived | Inputs already defined | Mathematical status | Proof / boundary obligation |
|---|---|---|---|---|
| `P02-E01` / `eq:p02-demand` | $y(p;q)=Aq p^{-\varepsilon}$ | $A,q,p,\varepsilon$ | primitive residual-demand schedule | verify units and $\varepsilon>1$ pricing boundary |
| `P02-E02` / `eq:p02-price-foc` | derivative of $(p-c)y(p;q)$ | $A,q,p,c,\varepsilon$ | optimization-derived FOC expression | check held-fixed objects and unique sign crossing |
| `P02-E03` / `eq:p02-optimal-price` | $p^*(c)=\varepsilon c/(\varepsilon-1)$ | `P02-E02` | optimization-derived unique maximizer | verify feasibility, SOC, and global maximum |
| `P02-E04` / `eq:p02-operating-profit` | $\pi(q,c)=Aq(\varepsilon-1)^{\varepsilon-1}\varepsilon^{-\varepsilon}c^{1-\varepsilon}$ | `P02-E01`, `P02-E03` | optimization-derived one-period profit | verify no repeated cost and dimensions |
| `P02-E05` / `eq:p02-profit-derivatives` | $\pi_q=\pi/q>0$, $\pi_c=(1-\varepsilon)\pi/c<0$ | `P02-E04` | algebraic derivatives | hold $A,\varepsilon$ and the other argument fixed |
| `P02-E06` / `eq:p02-present-value` | $R(q,c)=\pi(q,c)/(1-\beta\varphi)$ | `P02-E04`, $\beta,\varphi$ | derived convergent geometric present value | verify $\beta\varphi<1$ and conditional-success interpretation |
| `P02-E07` / `eq:p02-return-derivatives` | $R_q=R/q>0$, $R_c=(1-\varepsilon)R/c<0$ | `P02-E05`, `P02-E06` | algebraic derivatives | keep $\beta,\varphi$ fixed |

The pricing control is product price $p$, not the CMO capacity price $p_m$. The derivative with respect to $c$ is a continuous conditional-cost derivative, not a derivative with respect to binary policy $M$.

## 3. Phase 3 manufacturing-technology ledger

Phase 3 defines technological and organizational primitives. It does not yet assemble route values or select a route.

| ID / LaTeX label | Object defined | Inputs already defined | Mathematical status | Boundary / later obligation |
|---|---|---|---|---|
| `P03-E01` / `eq:p03-internal-cost` | $c_I(m,k_i)>0$ with $c_{I,m}>0$, $c_{I,k}<0$ on the feasible domain | $m,k_i$ | primitive technology function and shape restrictions | Phase 4 composes $R(q,c_I)$ |
| `P03-E02` / `eq:p03-internal-setup` | $F_I(m,k_i)$ with $F_{I,m}>0$, $F_{I,k}<0$ when feasible and $+\infty$ if $k_i<\underline{k}(m)$ | $m,k_i,\underline{k}$ | primitive setup technology plus feasibility convention | verify the internal-infeasibility limit |
| `P03-E03` / `eq:p03-external-cost` | $c_E(m)>0$ | $m$ | primitive qualified-external marginal-cost kernel | Phase 4 composes $R(q,c_E)$ |
| `P03-E04` / `eq:p03-capacity-requirement` | $b(m)>0$, $b'(m)>0$ | $m$ | primitive physical capacity requirement | Phase 4 prices it once; Phase 6 aggregates it |
| `P03-E05` / `eq:p03-external-fixed-cost` | $F_E(m)\geq0$ | $m$ | primitive real validation/readiness cost | Phase 4 subtracts once |
| `P03-E06` / `eq:p03-holder-burden` | $\mu_E\geq0$ | none | primitive retained holder-side burden | not removed by policy |
| `P03-E07` / `eq:p03-policy-invariance` | only $\tau_E(M)$ changes with $M$; all technology primitives are invariant | Phase 1 policy wedge and Phase 3 functions | scope/causal restriction | Phase 4 applies the wedge to route $E$ |

The evaluated route-cost input $c$ from Phase 2 is supplied by $c_I(m,k_i)$ or $c_E(m)$ only after a route is under consideration. The monetary capacity payment $p_m b(m)$ is separate from the technological marginal-cost kernel $c_E(m)$ and cannot also be embedded in it.

## 4. Phase 4 route-value and sorting ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| `P04-E01` / `eq:p04-internal-value` | $W_i^I=s(q)R(q,c_I)-F_I$ | $s,R,c_I,F_I$ | derived route value | internal infeasibility gives $-\infty$ |
| `P04-E02` / `eq:p04-entrusted-value` | $W_i^E=s(q)R(q,c_E)-F_E-p_mb-\mu_E-\tau_E(M)$ | Phase 1-3 external objects | derived route value at fixed $p_m$ | each cost appears once; holder rights retained |
| `P04-E03` / `eq:p04-outside-values` | $W^T=T(q,m)$, $W^A=0$ | $T$ | outside-option definitions | no second transfer market |
| `P04-E04` / `eq:p04-optimized-value` | $W_i=\max\{W_i^I,W_i^E,W^T,W^A\}$ | `P04-E01`--`P04-E03` | deterministic optimized value | no probabilistic route share |
| `P04-E05` / `eq:p04-route-choice` | $r_i^*$ is the argmax over the four explicitly listed route values | `P04-E01`--`P04-E04` | deterministic choice | ties have measure zero; no undeclared generic payoff symbol |
| `P04-E06` / `eq:p04-value-gap` | $\Delta_{IE}=W_i^I-W_i^E$ | `P04-E01`, `P04-E02` | derived value gap | hold $q,m,M,p_m$ fixed when varying $k_i$ |
| `P04-E07` / `eq:p04-gap-slope` | $\Delta_{IE,k}=sR_c c_{I,k}-F_{I,k}>0$ | Phase 2 derivative and Phase 3 signs | derived monotonicity | feasible internal domain |
| `P04-E08` / `eq:p04-cutoff` | unique finite $k^*$ solves $\Delta_{IE}(k^*)=0$ | `P04-E07` plus endpoint crossing | implicit definition/theorem | only when finite-wedge crossing conditions hold |
| `P04-E09` / `eq:p04-cutoff-derivatives` | $k^*_{\tau}=-1/\Delta_k<0$, $k^*_{p_m}=-b/\Delta_k<0$ | `P04-E08`, $b>0$ | IFT derivatives | fixed conjectured $p_m$; finite $\tau_E$ |

The binary policy comparison is not a derivative: $M=0$ sets $W_i^E=-\infty$, while $M=1$ supplies a finite barrier. The $\tau_E$ derivative is local within the finite-wedge domain.

## 5. Phase 5 project-advancement ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| P05-E01 / eq:p05-planned-intensity | $\lambda_i^{\mathrm{plan}}=a_ix_i$ | $a_i,x_i$ | Phase 1 technology restated | one common control; no $x_{ig}$ |
| P05-E02 / eq:p05-advancement-cost | $C_X(x_i)=\kappa x_i^{1+\nu}/(1+\nu)$ | $x_i,\kappa,\nu$ | primitive cost function | units, strict convexity and $\nu=1$ boundary |
| P05-E03 / eq:p05-expected-value | $\Omega_i=\int W_i\,dF$ | Phase 1 distribution; Phase 4 optimized value | derived expectation | measurability, integrability and nonnegativity |
| P05-E04 / eq:p05-advancement-objective | $\max_{x_i\geq0}\{\beta a_ix_i\Omega_i-C_X(x_i)\}$ | P05-E01--P05-E03 | optimization problem | $p_m$ fixed and project draw downstream |
| P05-E05 / eq:p05-kkt | advancement KKT conditions | P05-E04 | optimization-derived | cover interior and zero-value corner |
| P05-E06 / eq:p05-soc | objective curvature $-\kappa\nu x_i^{\nu-1}<0$ for $x_i>0$ | P05-E02 | optimization-derived | strict concavity also established globally |
| P05-E07 / eq:p05-optimal-advancement | $x_i^*=[\beta a_i\Omega_i/\kappa]^{1/\nu}$ | P05-E05, nonnegative $\Omega_i$ | unique optimizer | units and $\Omega_i=0$ corner |
| P05-E08 / eq:p05-binary-channel | fixed-price binary reform affects $x_i^*$ only through $\Omega_i$ | Phase 4 binary value comparison; P05-E07 | finite comparison | no derivative with respect to $M$ |
| P05-E09 / eq:p05-value-gap | $K_i-B_i=\Omega_i$ and $C_X'=\beta a_i(K_i-B_i)$ | P05-E05, appendix auxiliaries | accounting interpretation | no recursive state or scientific-productivity channel |

The expected-value and optimization arrows are now active at a fixed
conjectured $p_m$. Aggregate CMO demand, supply and the feedback that selects
$p_m^*$ remain deferred to Phase 6.

## 6. Causal and timing order

```text
Predetermined distributions and characteristics
  H(a,k) -> (a_i,k_i)
  H_C(z) -> z_j
  F(q,m), {rho_g,F_g} -> project draws (q,m) and optional class g

Institutional regime
  M -> tau_E(M) / legal availability of retained entrusted route E

Stage 1: ex ante project advancement
  observed (a_i,k_i,M) + anticipated p_m^*
      -> expected optimized project value Omega_i               [DEFINED: Phase 5]
      -> common control x_i                                    [OPTIMIZED: Phase 5]
      -> lambda_i^plan = a_i x_i                               [DEFINED: Phase 1]

Stage 2: project realization
  planning-stage project -> draw (q,m) from F
  g is an empirical classifier only; it creates no x_ig

Conditional product-market block
  (A,q,epsilon) + route-implied marginal cost c
      -> product demand y(p;q) and optimal product price p*(c)  [DEFINED/DERIVED: Phase 2]
      -> one-period operating profit pi(q,c)
      -> conditional commercial present value R(q,c)
  internal mapping c_I(m,k_i) and external mapping c_E(m)       [DEFINED: Phase 3]

Manufacturing technology block
  (m,k_i) -> c_I(m,k_i), F_I(m,k_i), internal feasibility      [DEFINED: Phase 3]
  m -> c_E(m), b(m), F_E(m); retained burden mu_E              [DEFINED: Phase 3]
  M -> tau_E(M) only; no technology or CMO-supply shift

Stage 3: organization
  Phase 2 value kernel + Phase 3 technologies/outside options
      -> W_I,W_E,W_T,W_A -> deterministic max W_i and r_i^*   [DERIVED: Phase 4]
  conditional I/E comparison -> Delta_IE -> capability cutoff k^*

Stage 4: downstream realization
  q -> exogenous probability s(q)                              [DEFINED: Phase 1]
  route and realization -> realized product outcome            [DEFERRED: Phase 9]

Stage 5: manufacturing-service consistency
  project mass + E-route choices -> aggregate CMO demand
  supplier technology and z_j -> aggregate CMO supply
  demand = supply -> p_m^*                                    [DEFERRED: Phase 6]
  p_m^* feeds back to Omega_i, x_i, and route choice
```

Stage 5 is a simultaneous consistency condition, not a later event developers fail to anticipate.

## 7. Initial fixed-point dependency

The future equilibrium loop is identified but not solved in Phase 1:

$$
p_m^*
\longrightarrow
\left(\Omega_i,x_i^*,r_i^*\right)
\longrightarrow
\text{aggregate entrusted-capacity demand}
\longrightarrow
p_m^*.
$$

Qualified supplier decisions create the supply side. Phase 6 must introduce capacity, cost, aggregate supply, aggregate demand, solution order, and sufficient regularity. Phase 1 makes no existence, uniqueness, or price-sign claim.

## 8. Allowed direct and indirect arrows

The only allowed direct policy arrow is

$$
M\longrightarrow\tau_E(M)
\quad\text{and the legal availability/friction of route }E.
$$

The allowed but not-yet-proved ex ante chain is

$$
M
\longrightarrow
\text{anticipated availability/value of }E
\longrightarrow
\Omega_i
\longrightarrow
x_i^*.
$$

The last two arrows require Phase 4 route values and the Phase 5 optimization. An increase requires a strictly positive expected route-value gain and the later optimization conditions.

Phase 5 closes those two arrows at fixed $p_m$:

$$
\Omega_i(M,p_m)=\int W_i(q,m;M,p_m)\,dF(q,m)
\longrightarrow
x_i^*(M,p_m)
=
\left[\frac{\beta a_i\Omega_i(M,p_m)}{\kappa}\right]^{1/\nu}.
$$

The common advancement control precedes project draws and route choice. The
reform makes no direct change to $a_i$, $\kappa$, $\nu$ or $C_X$.

Phase 2 supplies only the policy-invariant value kernel

$$
(A,q,\varepsilon,c,\beta,\varphi)
\longrightarrow
p^*(c)
\longrightarrow
\pi(q,c)
\longrightarrow
R(q,c).
$$

No direct arrow from $M$ to $A$, $q$, $\varepsilon$, $\beta$, or $\varphi$ is permitted. Any later policy effect on $R$ must pass through an approved route-technology mapping into $c$.

Phase 3 adds the policy-invariant technology arrows

$$
(m,k_i)\longrightarrow\{c_I,F_I,\text{ internal feasible domain}\},
\qquad
m\longrightarrow\{c_E,b,F_E\},
$$

and a constant retained burden $\mu_E$. Internal infeasibility is encoded by $F_I=+\infty$; no separate binary feasibility object is restored.

Phase 4 closes the route-value branch at a fixed conjectured CMO price:

$$
\{R,s,c_I,F_I,c_E,b,F_E,\mu_E,\tau_E,T\}
\longrightarrow
\{W_i^I,W_i^E,W^T,W^A\}
\longrightarrow
\{W_i,r_i^*,\Delta_{IE},k^*\}.
$$

It does not close the equilibrium feedback from aggregate entrusted demand to $p_m^*$.

The later realization chain is

$$
x_i^*
\longrightarrow
\lambda_i^{\mathrm{plan}}
\longrightarrow
r_i^*
\longrightarrow
\text{observed holder-producer separation}
\longrightarrow
\text{realized products}.
$$

This prevents ex post observed $E$ assignment from being written before $x_i$.

## 9. Forbidden arrows and identities

| Forbidden statement | Reason / controlling requirement |
|---|---|
| $M\to a_i$ | research capability is predetermined; `RL-07` |
| $M\to q$ or $M\to F$ | project value and distribution are exogenous; `RL-08` |
| $M\to s(q)$ or $M\to s_g(q)$ | downstream realization is MAH invariant; `RL-09` |
| $M\to k_i$ or $M\to z_j$ | manufacturing characteristics are predetermined |
| direct $M\to p_m^*\downarrow$ | $p_m^*$ is endogenous; `RL-10` |
| $x_i\equiv$ clinical-development effort | v1.2 says $x_i$ is broader |
| $x_i\equiv$ patent applications | patents are outside the baseline outcome; `RL-21`--`RL-23` |
| $g=\mathrm{Inc}\equiv I$ | empirical class and internal route differ |
| separate $x_{ig}$ | common-control restriction |
| observed holder-producer separation $\to x_i$ | reverses locked timing |
| $E\equiv T$ | entrusted production retains holder rights; transfer does not |
| $p\equiv p_m$ or $p^*\equiv p_m^*$ | product pricing and CMO capacity-market pricing are different markets and controls |
| $R\equiv R_i^{event}$ or $R\equiv\bar R_i^E$ | legacy reduced-form returns are inactive; Phase 2 derives $R$ and Phase 12 records the crosswalk |
| $R$ includes $F_I,F_E,\tau_E$, or CMO capacity payment a second time | $R$ is gross operating PV; route-value accounting is deferred and must subtract each distinct route cost once |
| $\varphi\equiv s(q)$ | $\varphi$ is survival after commercialization; $s(q)$ is downstream realization before the conditional operating stream |
| $M\to c_I,F_I,c_E,b,F_E,\mu_E,k_i,m$ | MAH changes the institutional route wedge only, not technology or characteristics |
| $M\to p_m^*\downarrow$ through an assumed scarcity relief | CMO price and scarcity are endogenous Phase 6 outcomes |
| $c_E(m)$ includes $p_m b(m)$ | technological marginal cost and the monetary capacity payment are distinct accounting items |
| $\mu_E=0$ because $M=1$ | residual holder responsibility is not removed by MAH |
| $E\equiv$ authorization transfer | the developer remains the holder under entrusted manufacturing |
| route probability/share from a smooth random-utility formula | Phase 4 choice is deterministic; ties have measure zero |
| $k_i<k^*\Rightarrow E$ without checking $T/A$ | cutoff sorting is conditional on $I/E$ dominating both outside options |
| finite $k^*$ asserted at $M=0$ | $\tau_E(0)=+\infty$ makes $E$ unavailable; the finite cutoff theorem is a finite-wedge result |
| $\partial k^*/\partial p_m$ treated as an equilibrium derivative | Phase 4 holds conjectured $p_m$ fixed; equilibrium feedback begins in Phase 6 |
| $M$ differentiated as continuous | binary policy effects require finite comparisons; only the structural finite-wedge argument $\tau_E$ has a local derivative |
| $M\to x_i^*$ outside $\Omega_i$ | Phase 5 permits only the anticipated route-value channel |
| $k_i\to a_ix_i$ or $k_i\to C_X(x_i)$ | manufacturing capability affects project value through route organization, not advancement technology |
| $C_R\equiv C_X$ in the baseline notation | the unified advancement-cost notation is $C_X$ |
| $B_i$ or $K_i$ treated as recursive states | they are appendix-only value-gap accounting auxiliaries |

## 10. Update rule

Before any later Phase writes a formula, it must:

1. add every new symbol to `01_symbols_and_objects.md` with one category and units;
2. add only assumptions actually used to `03_assumptions_and_scope.md`;
3. add the equation and its parents to this ledger;
4. mark each deferred arrow it closes and feedback loop it leaves open;
5. preserve the forbidden-arrow table unless the user approves an architecture change.
