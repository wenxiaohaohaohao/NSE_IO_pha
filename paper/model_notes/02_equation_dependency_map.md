# 02 Equation Dependency Map

Phase status: `PHASE 1 - APPROVED; PHASE 2 - APPROVED; PHASE 3 - APPROVED; PHASE 4 - APPROVED; PHASE 5 - APPROVED; PHASE 6 - APPROVED; PHASE 7 - APPROVED; PHASE 8 - APPROVED; PHASE 9 - APPROVED; PHASE 10 - APPROVED`  
This map records definitions, timing dependencies, demand/profit, manufacturing technologies, deterministic route/sorting, project advancement, the Phase 6 CMO market, the Phase 7 partial-equilibrium definition, the Phase 8 proposition stack, the Phase 9 outcome boundary and the Phase 10 empirical interface. Items marked `DEFERRED` are obligations for later authorized phases, not current results.

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

The expected-value and optimization arrows are active at a fixed conjectured
$p_m$. Phase 6 now uses them inside the market-clearing map that selects
$p_m^*$.

## 6. Phase 6 CMO-market ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| P06-E01 / eq:p06-supplier-problem | $\max_{s_j\geq0}\{p_ms_j-\Psi(s_j;z_j)\}$ | $p_m,s_j,z_j,\Psi$ | supplier optimization | KKT/SOC and no entry margin |
| P06-E02 / eq:p06-supplier-capacity | $p_m=\Psi_s(s_j^*;z_j)$ for $p_m>0$ | P06-E01 | optimization-derived capacity | unique solution; zero-price corner |
| P06-E03 / eq:p06-capacity-derivatives | $s_{j,p}^*=1/\Psi_{ss}>0$, $s_{j,z}^*=-\Psi_{sz}/\Psi_{ss}>0$ | P06-E02 | IFT derivatives | fixed primitives and active supplier |
| P06-E04 / eq:p06-aggregate-supply | $S_m(p_m)=\int s_j^*(p_m,z)\,dH_C(z)$ | P06-E03, $H_C$ | derived market aggregate | continuity, strict increase and units |
| P06-E05 / eq:p06-entrusted-capacity | $\chi_i^E=\int b(m)1\{r_i^*=E\}\,dF$ | $b,F,r_i^*$ | derived expected capacity per project | deterministic indicator; zero ties |
| P06-E06 / eq:p06-omega-price-envelope | $\Omega_{i,p_m}=-\chi_i^E\leq0$ almost everywhere | Phase 4 route value; P06-E05 | envelope derivative | fixed $M$ and zero-tie regularity |
| P06-E07 / eq:p06-advancement-price-response | $x_{i,p_m}^*=-x_i^*\chi_i^E/(\nu\Omega_i)\leq0$ for $\Omega_i>0$ | Phase 5 optimizer; P06-E06 | chain-rule derivative | intensive advancement-price response |
| P06-E08 / eq:p06-study-demand | $D_m^{\mathrm{MAH}}=\int a_ix_i^*\chi_i^E\,dH$ | P05 optimizer; P06-E05--P06-E07 | derived aggregate demand | both advancement and route responses |
| P06-E09 / eq:p06-total-demand | $D_m=D_m^B+D_m^{\mathrm{MAH}}$ | P06-E08, background demand | derived total demand | continuity and weak decrease |
| P06-E10 / eq:p06-market-clearing | $D_m(p_m^*;M)=S_m(p_m^*)$ | P06-E04, P06-E09 | scalar equilibrium condition | existence and uniqueness |
| P06-E11 / eq:p06-existence-boundaries | demand exceeds supply at zero and supply dominates at high price | Phase 6 regularity | sufficient boundary result | IVT plus strict excess-demand decrease |

The Phase 6 solution order is explicit: for a candidate $p_m$, evaluate route
values and deterministic choices, integrate $\Omega_i$, compute $x_i^*$ and
entrusted capacity demand, evaluate supplier capacity, and solve the one
scalar clearing equation. This closes the CMO-price loop without closing any
other market.

## 7. Phase 7 partial-equilibrium-definition ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| P07-E01 / eq:p07-equilibrium-collection | $\{p_m^*,x_i^*,r_i^*(q,m),s_j^*\}$ | Phase 4--6 optimal objects | equilibrium definition | exactly four families; no fifth equilibrium object |
| P07-E02 / eq:p07-route-optimality | deterministic route optimality at $p_m^*$ | P04-E01--P04-E05, P06-E10 | inherited optimization condition | retain $I,E,T,A$ and holder rights |
| P07-E03 / eq:p07-advancement-optimality | $x_i^*=[\beta a_i\Omega_i(M,p_m^*)/\kappa]^{1/\nu}$ | P05-E07, P06-E10 | inherited unique optimizer | common control; no $x_{ig}$ |
| P07-E04 / eq:p07-capacity-optimality | $s_j^*\in\arg\max_{s_j\geq0}\{p_m^*s_j-\Psi(s_j;z_j)\}$ | P06-E01--P06-E03 | inherited unique optimizer | no supplier entry condition |
| P07-E05 / eq:p07-market-clearing | $D_m(p_m^*;M)=S_m(p_m^*)$ | P06-E04, P06-E09--P06-E11 | sole equilibrium-clearing condition | no labor, capital, product or welfare clearing |

Phase 7 introduces no new primitive, control or state. It only collects the
four already classified optimal-object families and their four inherited
conditions. Aggregate demand and supply remain functions used to determine
$p_m^*$; they are not additional members of the equilibrium collection.

## 8. Phase 8 proposition ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| P08-E01 / eq:p08-sorting-slope | $\Delta_{IE,k}>0$ | P04-E06--P04-E07 | inherited derivative inside Proposition 1 | fixed $q,m,M,p_m$ and feasible internal domain |
| P08-E02 / eq:p08-old-new-values | $W_i^0=\max\{W_i^I,W^T,0\}$ and $W_i^1=\max\{W_i^0,W_i^E\}$ | Phase 4 route values | definitions for Proposition 2 | fixed support price |
| P08-E03 / eq:p08-positive-part-gain | $W_i^1-W_i^0=[W_i^E-W_i^0]_+$ | P08-E02 | max identity | direct gain only on relevant set |
| P08-E04 / eq:p08-relevant-set | $\mathcal C_i(p_m)=\{(q,m):W_i^E>W_i^0\}$ | P08-E02--P08-E03 | set definition | strict fixed-price gain |
| P08-E05 / eq:p08-expected-gain | $\Delta\Omega_i=\int[W_i^E-W_i^0]_+dF$ | P08-E03 | derived expectation | finite comparison, no $M$ derivative |
| P08-E06 / eq:p08-advancement-change | closed-form $\Delta x_i$ from $\Omega_i^1=\Omega_i^0+\Delta\Omega_i$ | P05-E07, P08-E05 | derived finite response | strict iff expected gain is positive |
| P08-E07 / eq:p08-capability-response | $\partial\Delta x_i/\partial a_i=\Delta x_i/(\nu a_i)$ | P08-E06 | conditional derivative | hold route-value objects fixed |
| P08-E08 / eq:p08-manufacturing-response | $\Delta x_i$ weakly decreases in $k_i$ under $\nu\geq1$ and inherited monotonicities | P04-E07, P08-E05--P08-E06 | sufficient comparative result | no unconditional sign for $\nu<1$ |
| P08-E09 / eq:p08-class-gain | $\Delta\Omega_{ig}=E_{F_g}[W_i^E-W_i^0]_+$ | class mixture and P08-E03 | corollary identity | no cross-class ordering without primitives |
| P08-E10 / eq:p08-excess-demand | $Z_M(p_m)=D_m(p_m;M)-S_m(p_m)$ | P06-E04, P06-E09 | proof device for Proposition 4 | continuous and strictly decreasing |
| P08-E11 / eq:p08-price-order | $p_m^1\geq p_m^0$ | P08-E10 plus positive post-MAH study demand | equilibrium comparison | strict only with positive demand at $p_m^0$ |
| P08-E12 / eq:p08-scarcity-value-bounds | $0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir}$ | $W_{E,p_m}=-b(m)$, P08-E11 | pointwise/integrated inequality | old route set remains available |
| P08-E13 / eq:p08-scarcity-advancement-bounds | $0\leq\Delta x_i^{eq}\leq\Delta x_i^{dir}$ | P05-E07, P08-E12 | monotone transformation | fixed baseline value |
| P08-E14 / eq:p08-planning-arrival | $\Lambda_i^{plan}=a_ix_i^*$ | P01-E05 evaluated at optimum | derived equilibrium arrival intensity | not patent generation |
| P08-E15 / eq:p08-retained-outcome | $Y_i^{ret}$ | P08-E14, $s$, deterministic route choice | derived observed outcome | no direct policy shift in $s$ |
| P08-E16 / eq:p08-entrusted-outcome | $Y_i^E$ | P08-E14, $s$, route $E$ indicator | derived observed outcome | holder--producer separation only |
| P08-E17 / eq:p08-type-outcome | $Y_{ig}^{ret}$ | common $x_i^*$, $\rho_gF_g$, $s_g$ | derived class contribution | no $x_{ig}$ and no sign ranking |
| P08-E18 / eq:p08-outcome-decomposition | $\Delta Y_i^{ret}=a_i\Delta x_iQ_i^{ret,0}+a_ix_i^1\Delta Q_i^{ret}$ | P08-E15 | exact algebraic decomposition | advancement versus retained-route composition |

The novelty result is one corollary of the MAH-relevant-set identity, not a
seventh substantive proposition. The proposition stack adds no new market or
choice control.

## 9. Phase 9 outcome-boundary ledger

| ID / LaTeX label | Object/result | Inputs already defined | Mathematical status | Proof / scope obligation |
|---|---|---|---|---|
| P09-E01 / eq:p09-outcome-hierarchy | upstream research, project advancement, route organization and realized product are distinct | Phase 1 timing; Phase 8 outcomes | interpretation boundary | no equality or reverse timing |
| P09-E02 / eq:p09-anticipated-chain | $M\to E$ availability/value $\to\Omega_i\to x_i$ | Phase 1 and Phase 5 | causal timing interface | anticipation precedes advancement |
| P09-E03 / eq:p09-realized-chain | $x_i\to\Lambda_i^{plan}\to r_i^*\to$ observed separation $\to$ realized products | Phase 8 outcomes | realized timing interface | observed separation cannot cause prior $x_i$ |
| P09-E04 / eq:p09-type-mixture | type-specific outcomes use common $x_i$ and $\rho_gF_g$ | P08-E17 | measurement identity | no $x_{ig}$ control or novelty ranking |
| P09-E05 / eq:p09-identification-boundary | approval-side outcomes discipline composites, not each primitive separately | P08-E14--P08-E18 | identification limitation | no primitive-by-primitive claim |

Phase 9 adds no FOC, derivative, control, state or market-clearing equation.
It preserves the Phase 8 outcome formulas and states what they can and cannot
mean empirically.

## 10. Phase 10 empirical-interface ledger

| ID / LaTeX label | Interface | Model parents | Status | Required boundary |
|---|---|---|---|---|
| P10-I01 | developer capability and advancement | $a_i,x_i,a_ix_i$ | future-data interface | history may proxy capability but is not current effort |
| P10-I02 | manufacturing capability and complexity | $k_i,m$ | future-data interface | product-compatible, dated capacity evidence required |
| P10-I03 | commercial value and outside option | $q,T(q,m)$ | future-data interface | proxies do not separately identify primitives |
| P10-I04 | entrusted route and retained outcomes | $r_i^*=E,Y_i^{ret}$ | future-data interface | holder, manufacturer, product and date must align |
| P10-I05 | novelty class and patent boundary | $g,\rho_gF_g$ | future-data interface | classifier only; patents outside baseline outcome |
| P10-I06 | CMO scarcity | $p_m^*,S_m,D_m$ | future-data interface | nonprice proxies do not identify price separately |
| P10-E01 / eq:p10-anticipated-interface | anticipated policy-value chain | P09-E02 | timing interface | observed separation cannot precede $x_i$ |
| P10-E02 / eq:p10-realized-interface | realized project-to-product chain | P09-E03 | timing interface | planning and realized outcomes remain distinct |

Every interface records units, observational grain, required join keys,
availability status and identification limits. None claims that a data source
has been obtained or validated.

## 11. Causal and timing order

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
  project mass + E-route choices -> aggregate CMO demand        [DERIVED: Phase 6]
  supplier technology and z_j -> aggregate CMO supply           [DERIVED: Phase 6]
  demand = supply -> p_m^*                                    [SOLVED: Phase 6]
  p_m^* feeds back to Omega_i, x_i, and route choice             [CLOSED: Phase 6]
```

Stage 5 is a simultaneous consistency condition, not a later event developers fail to anticipate.

## 8. CMO fixed-point dependency

The CMO equilibrium loop is

$$
p_m^*
\longrightarrow
\left(\Omega_i,x_i^*,r_i^*\right)
\longrightarrow
\text{aggregate entrusted-capacity demand}
\longrightarrow
p_m^*.
$$

Phase 6 closes this loop as a scalar market-clearing equation. At each
candidate price, all right-hand-side choices are explicit functions of that
price. Under the Phase 6 continuity, boundary and monotonicity conditions,
the clearing price exists and is unique. No sign is imposed on the
cross-regime change in $p_m^*$.

## 9. Allowed direct and indirect arrows

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

Phase 6 closes the remaining feedback from aggregate entrusted demand and
supplier capacity to $p_m^*$.

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

## 14. Forbidden arrows and identities

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
| individual deterministic route choice replaced by a smooth share | Phase 6 continuity comes from atomless aggregation, not logit smoothing |
| $M\to S_m$ as a direct supply shift | CMO technology and supplier distribution are policy invariant |
| $M\to D_m^B$ | background demand is exogenous and policy invariant |
| $p_m^*$ selected before evaluating $r_i^*$ and $x_i^*$ | the price is the fixed point of their induced demand and supplier capacity |
| a second market-clearing equation | Phase 6 closes only qualified manufacturing-service capacity |

## 15. Update rule

Before any later Phase writes a formula, it must:

1. add every new symbol to `01_symbols_and_objects.md` with one category and units;
2. add only assumptions actually used to `03_assumptions_and_scope.md`;
3. add the equation and its parents to this ledger;
4. mark each deferred arrow it closes and feedback loop it leaves open;
5. preserve the forbidden-arrow table unless the user approves an architecture change.
