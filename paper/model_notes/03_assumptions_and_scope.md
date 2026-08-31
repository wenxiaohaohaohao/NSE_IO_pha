# 03 Assumptions and Scope

Phase status: `PHASE 1 - APPROVED; PHASE 2 - APPROVED; PHASE 3 - APPROVED; PHASE 4 - APPROVED; PHASE 5 - APPROVED`

This file records assumptions needed through the current phase. It does not impose the signs of later propositions. Technology, route-choice, project-advancement, market-regularity and equilibrium comparative-static assumptions must be added in their authorized phases before use.

## A. Institutional primitives

### `A-P01-INST-01` - Binary institutional regime

$M\in\{0,1\}$ is exogenous. $M=0$ is pre-MAH; $M=1$ makes retained holder-producer separation legally available.

Used by: Phase 1 timing and route feasibility.

### `A-P01-INST-02` - Single direct policy wedge

The only direct baseline policy channel is

$$
\tau_E(0)=+\infty,
\qquad
\tau_E(1)=\bar\tau_E<+\infty.
$$

The finite $\bar\tau_E$ is a primitive post-MAH burden, not a second implementation index.

Used by: Phase 1 institutional definition. No payoff effect is derived yet.

### `A-P01-INST-03` - Retained authorization

Under $E$, the developer remains the holder and a qualified external producer manufactures. Route $E$ is not ownership or authorization transfer.

Used by: Phase 1 route taxonomy.

## B. Developer and supplier characteristics

### `A-P01-FIRM-01` - Continuous developer heterogeneity

Developers $i\in\mathcal I$ have predetermined $\theta_i=(a_i,k_i)$, with $a_i>0$ and $k_i>0$, distributed according to exogenous $H(a,k)$. No permanent discrete firm type is imposed.

### `A-P01-FIRM-02` - Distinct firm-characteristic roles

$a_i$ converts advancement input into planning-stage projects. $k_i$ measures internal manufacturing capability. Neither is directly changed by $M$.

Used by: $\lambda_i^{\mathrm{plan}}=a_ix_i$ and timing interpretation.

### `A-P01-FIRM-03` - Qualified supplier heterogeneity

Qualified suppliers $j\in\mathcal J$ have predetermined efficiency $z_j>0$ distributed according to exogenous $H_C(z)$. Capacity optimization is deferred to Phase 6.

## C. Project characteristics and empirical classifier

### `A-P01-PROJ-01` - Post-investment project draw

After $x_i$ is chosen, each viable planning-stage project draws $\omega=(q,m)$ from exogenous $F(q,m)$. The distribution is invariant to $M$ and $x_i$.

### `A-P01-PROJ-02` - Distinct project roles

$q>0$ is a commercial/scientific value shifter. $m>0$ is a manufacturing requirement on the same scale as $k_i$. MAH directly changes neither.

### `A-P01-PROJ-03` - Novelty decomposition without a new control

When needed, $g\in\{O,\mathrm{Inc}\}$ is an exogenous classifier with $\rho_g\geq0$, $\sum_g\rho_g=1$, and

$$
F(q,m)=\sum_g\rho_gF_g(q,m).
$$

The baseline retains one common $x_i$. The class label creates no $x_{ig}$ and imposes no ordering of class-specific reform gains.

### `A-P01-PROJ-04` - Exogenous downstream realization

$s(q)\in[0,1]$ is route independent and MAH invariant. If later typed outcomes use $s_g(q)$, it is also exogenous and MAH invariant. Neither function is patent generation.

## D. Information and timing

### `A-P01-TIME-01` - Information before advancement

Developer $i$ observes $M$ and $(a_i,k_i)$ before choosing $x_i\geq0$. It conditions the decision on anticipated $p_m^*$ and expected future route values, solved jointly in later phases.

### `A-P01-TIME-02` - Advancement precedes project and route realization

The common $x_i$ is chosen before $(q,m)$ is drawn and before route choice. Realized holder-producer separation cannot be a causal event preceding $x_i$.

### `A-P01-TIME-03` - Anticipation versus realization

The permissible ex ante chain is

$$
M
\longrightarrow
\text{anticipated availability/value of }E
\longrightarrow
\Omega_i
\longrightarrow
x_i.
$$

The later realization chain is

$$
x_i
\longrightarrow
\text{planning-stage projects}
\longrightarrow
r_i^*
\longrightarrow
\text{observed holder-producer separation}
\longrightarrow
\text{realized products}.
$$

These are timing restrictions, not Phase 1 comparative-static proofs.

### `A-P01-TIME-04` - Equilibrium consistency is not a later shock

Stage 5 determines a $p_m^*$ jointly consistent with decisions made using that anticipated price. Stage 5 is an equilibrium condition, not a chronological policy shock after downstream realization.

## E. Scope exclusions

### `A-P01-SCOPE-01` - Partial-equilibrium boundary

No entry, exit, labor-market clearing, capital-market clearing, product-market aggregate clearing, representative household, portfolio dynamics, or welfare object is included.

### `A-P01-SCOPE-02` - Innovation-object boundary

$x_i$ is original-drug innovation investment / project-advancement intensity. It is broader than pure clinical-development effort but excludes upstream basic research, basic-compound discovery, patent-generating effort, and patent applications.

### `A-P01-SCOPE-03` - Baseline/extension boundary

Logit route choice, inclusive value, continuous $\eta$, route-specific realization, transfer-market microfoundation, matching, dynamic evolution, and research-versus-development allocation are not baseline Phase 1 objects.

## F. Phase 1 assumption-use matrix

| Definition or timing claim | Assumptions actually used |
|---|---|
| Developer characteristic vector | `A-P01-FIRM-01`, `A-P01-FIRM-02` |
| Supplier population | `A-P01-FIRM-03` |
| Project draw and mismatch roles | `A-P01-PROJ-01`, `A-P01-PROJ-02` |
| Novelty mixture identity | `A-P01-PROJ-03` |
| Institutional route availability | `A-P01-INST-01`, `A-P01-INST-02`, `A-P01-INST-03` |
| $\lambda_i^{\mathrm{plan}}=a_ix_i$ | `A-P01-FIRM-02`, `A-P01-TIME-01` |
| Advancement before route realization | `A-P01-TIME-02`, `A-P01-TIME-03` |
| Downstream realization timing | `A-P01-PROJ-04` |
| Anticipated equilibrium price in Stage 1 | `A-P01-TIME-01`, `A-P01-TIME-04` |
| Excluded mechanisms | `A-P01-SCOPE-01`--`A-P01-SCOPE-03` |

None of these assumptions directly states a later sign, cutoff, existence, uniqueness, or welfare conclusion.

## G. Phase 2 demand and operating-profit assumptions

### `A-P02-DEMAND-01` - Constant-elasticity residual demand

Conditional on product price $p>0$ and project value shifter $q>0$, one-period residual demand is

$$
y(p;q)=Aq p^{-\varepsilon},
$$

where $A>0$ and $\varepsilon>1$. The institutional regime $M$ changes none of $A$, $q$, or $\varepsilon$.

Used by: `P02-E01`--`P02-E05`.

### `A-P02-PRICE-01` - Conditional static pricing domain

For a fixed positive marginal manufacturing-cost input $c>0$, product price $p$ is chosen from $[c,\infty)$. Phase 2 takes $q$ and $c$ as fixed arguments. Route technologies that map $(m,k_i,p_m)$ into a value of $c$ are deferred to Phase 3.

Used by: pricing FOC, feasibility, SOC, and global-maximizer proof.

### `A-P02-PV-01` - Commercial survival and discounting

After successful commercialization, the optimized one-period operating profit is stationary. The product remains commercially active for the next period with conditional probability $\varphi\in[0,1]$, independently of the stationary operating-profit amount, and future currency is discounted by $\beta\in(0,1)$. Hence $0\leq\beta\varphi<1$.

The parameter $\varphi$ is post-commercial survival, not the pre-commercial downstream realization probability $s(q)$.

Used by: `P02-E06` and `P02-E07`.

### `A-P02-ACCOUNT-01` - Gross operating-value boundary

Marginal cost $c$ is the only cost subtracted inside one-period operating profit. The derived $R(q,c)$ is gross of route-specific fixed organizational costs, institutional burdens, and any separately defined capacity procurement payment. Phase 3 and Phase 4 must state whether each future route cost is embedded in route-specific $c_r$ or subtracted outside $R$; the same economic cost cannot appear in both places.

Used by: Phase 2 dimension and double-counting audit; binding accounting restriction for Phase 3-4.

### `A-P02-POLICY-01` - Policy invariance of the Phase 2 kernel

MAH does not directly shift $A$, $q$, $\varepsilon$, $\beta$, or $\varphi$. Phase 2 therefore establishes no direct $M$ comparative static. Any later change in $R$ must operate through an approved route-value or route-cost channel.

Used by: Phase 2 economic-interpretation audit and `RL-08`.

## H. Phase 2 assumption-use matrix

| Result | Assumptions actually used | Held fixed |
|---|---|---|
| Demand schedule | `A-P02-DEMAND-01` | $A,q,\varepsilon$ when varying $p$ |
| Unique interior product price | `A-P02-DEMAND-01`, `A-P02-PRICE-01` | $A,q,c,\varepsilon$ |
| Optimized operating profit | `A-P02-DEMAND-01`, `A-P02-PRICE-01`, `A-P02-ACCOUNT-01` | $A,q,c,\varepsilon$ as appropriate |
| $\pi_q>0$ and $\pi_c<0$ | `A-P02-DEMAND-01`, `A-P02-PRICE-01` | all parameters except the differentiated argument |
| Convergent commercial present value | `A-P02-PV-01`, `A-P02-ACCOUNT-01` | $q,c,A,\varepsilon,\beta,\varphi$ as appropriate |
| No direct MAH effect in Phase 2 | `A-P02-POLICY-01` | Phase 2 kernel primitives |

The derivative signs are derived results, not assumptions. No route ranking, policy effect, welfare result, or equilibrium-price claim is imposed here.

## I. Phase 3 manufacturing-technology assumptions

### `A-P03-INT-01` - Internal feasibility through setup cost

There is a positive capability threshold $\underline{k}(m)$ measured in $\mathsf K$. Internal production is technologically feasible only when $k_i\geq\underline{k}(m)$. The baseline encodes infeasibility by

$$
F_I(m,k_i)=+\infty
\quad\text{for }k_i<\underline{k}(m),
$$

rather than by a separate binary feasibility primitive.

Used by: `P03-E02`; later route-domain boundary in Phase 4.

### `A-P03-INT-02` - Internal technology shape on its feasible domain

For $k_i\geq\underline{k}(m)$, $c_I(m,k_i)>0$ and $F_I(m,k_i)$ is finite. Both functions are differentiable on the interior of that domain and satisfy

$$
c_{I,m}>0,\qquad c_{I,k}<0,
\qquad
F_{I,m}>0,\qquad F_{I,k}<0.
$$

These are primitive technology shape restrictions. They do not by themselves state a route ranking or sorting result.

Used by: `P03-E01`, `P03-E02`; Phase 4 derivatives after route values are defined.

### `A-P03-EXT-01` - Qualified external production technology

Qualified external production has positive technological marginal-cost kernel $c_E(m)>0$. An entrusted project requires $b(m)>0$ units of qualified manufacturing-service capacity, with $b'(m)>0$. The functions depend on project manufacturing requirement $m$, not on developer capability $k_i$.

Used by: `P03-E03`, `P03-E04`.

### `A-P03-EXT-02` - External readiness cost and retained burden

$F_E(m)\geq0$ is a real technology-transfer, validation and production-readiness cost. $\mu_E\geq0$ is a residual holder-side responsibility/coordination burden. Neither is a payment for CMO capacity and neither is embedded in $c_E(m)$.

Used by: `P03-E05`, `P03-E06`; binding accounting separation for Phase 4.

### `A-P03-HOLDER-01` - Entrusted production retains holder rights

Under route $E$, a qualified external producer manufactures while the developer remains the authorization holder and retains holder responsibility. Route $E$ is technologically and organizationally distinct from internal route $I$ and from non-retained transfer route $T$.

Used by: Phase 3 organizational distinction and `RL-11`.

### `A-P03-POLICY-01` - Technology invariance and single institutional wedge

The institutional regime $M$ changes only $\tau_E(M)$ and the resulting legal feasibility/friction of route $E$. It does not shift $c_I$, $F_I$, $\underline{k}$, $c_E$, $b$, $F_E$, $\mu_E$, $a_i$, $k_i$, $q$, $m$, $s(q)$, or $s_g(q)$.

Used by: `P03-E07` and the Phase 3 red-line audit.

### `A-P03-SCARCITY-01` - CMO scarcity remains endogenous and deferred

Phase 3 defines the physical capacity requirement $b(m)$ but no CMO supply, demand, price-clearing or scarcity-relief equation. The price $p_m^*$ remains an endogenous Phase 6 object and is not directly shifted by $M$.

Used by: Phase 3 scope gate and `RL-10`.

## J. Phase 3 assumption-use matrix

| Definition / boundary | Assumptions actually used |
|---|---|
| Internal marginal cost and setup technology | `A-P03-INT-01`, `A-P03-INT-02` |
| Internal infeasibility at low capability | `A-P03-INT-01` |
| External marginal-cost kernel and capacity requirement | `A-P03-EXT-01` |
| External readiness and holder-side costs | `A-P03-EXT-02` |
| $I/E/T$ organizational distinction | `A-P03-HOLDER-01` |
| Only direct MAH wedge is $\tau_E(M)$ | `A-P03-POLICY-01` |
| No exogenous CMO scarcity relief | `A-P03-SCARCITY-01` |

No Phase 3 assumption states which route is chosen, that a cutoff exists, that MAH raises project value, or that equilibrium CMO price falls.

## K. Phase 4 route-choice and cutoff assumptions

### `A-P04-OUTSIDE-01` - Transfer and abandonment outside options

$T(q,m)$ is a finite continuous noncore outside-value function. It is not separately microfounded in the baseline and does not depend directly on $M$, $k_i$, or $p_m$. Abandonment/indefinite delay is normalized to zero.

Used by: definitions of $W^T$ and $W^A$ and the optimized value maximum.

### `A-P04-CHOICE-01` - Deterministic choice and negligible ties

Route choice maximizes the four deterministic values over feasible routes. Continuous project/firm heterogeneity implies that exact ties have measure zero, so $r_i^*$ is single valued almost surely. No route-specific taste shock or probabilistic share is introduced.

Used by: optimized value and route-choice definitions.

### `A-P04-CUTOFF-01` - Finite-wedge crossing conditions

For a fixed $(q,m,p_m)$ and a finite entrusted barrier $\tau_E$, the value gap $\Delta_{IE}(k;q,m,M,p_m)$ is continuous on the internally feasible capability domain. The endpoint conditions satisfy

$$
\lim_{k\downarrow\underline{k}(m)}\Delta_{IE}(k)<0,
\qquad
\lim_{k\to\infty}\Delta_{IE}(k)>0.
$$

Together with the derivative implied by Phase 2-3 signs, these are sufficient crossing conditions for a unique finite $I/E$ cutoff. They are not assumed to hold for every $(q,m,p_m,M)$.

Used by: cutoff existence and uniqueness.

### `A-P04-CUTOFF-02` - Conditional organizational interpretation

The statements $k_i<k^*\Rightarrow E$ and $k_i>k^*\Rightarrow I$ apply only where $I$ and $E$ both dominate $T$ and $A$. If an outside option dominates, the $I/E$ cutoff does not determine the realized route.

Used by: organizational-sorting proposition draft and zero-effect cases.

### `A-P04-PRICE-01` - Fixed-price Phase 4 comparison

Phase 4 treats $p_m$ as a fixed conjectured CMO capacity price when constructing route values and differentiating the cutoff. The equilibrium feedback through $p_m^*$ is deferred to Phase 6 and the fixed-price/equilibrium-price distinction must remain explicit.

Used by: $\partial k^*/\partial p_m$ and scope audit.

### `A-P04-POLICY-01` - Binary policy versus finite wedge derivative

The reform comparison remains binary: $M=0$ makes $E$ unavailable via $\tau_E=+\infty$, while $M=1$ gives finite $\bar\tau_E$. The derivative $\partial k^*/\partial\tau_E$ is a local structural derivative within the finite-wedge domain, not a derivative with respect to binary $M$.

Used by: cutoff comparative derivative and policy interpretation.

## L. Phase 4 assumption-use matrix

| Result | Assumptions actually used |
|---|---|
| $I/E/T/A$ values | approved Phase 1-3 primitives; `A-P04-OUTSIDE-01` |
| deterministic optimized value and route | `A-P04-CHOICE-01` |
| $\Delta_{IE,k}>0$ | `A-P03-INT-02` and Phase 2 result $R_c<0$ |
| unique finite cutoff | `A-P04-CUTOFF-01` plus derived $\Delta_{IE,k}>0$ |
| conditional $E/I$ sorting around cutoff | `A-P04-CUTOFF-02` |
| $\partial k^*/\partial\tau_E<0$ | finite-wedge differentiability and $\Delta_{IE,k}>0$ |
| $\partial k^*/\partial p_m<0$ | `A-P04-PRICE-01`, $b(m)>0$, and $\Delta_{IE,k}>0$ |
| binary MAH interpretation | `A-P04-POLICY-01` |

No assumption states that route $E$ is always chosen after MAH or that every project has a nonzero reform effect.

## M. Phase 5 project-advancement assumptions

### A-P05-COST-01 - Strictly convex common advancement cost

The single common control satisfies $x_i\geq0$. Its cost is

$$
C_X(x_i)=\frac{\kappa}{1+\nu}x_i^{1+\nu},
\qquad \kappa>0,\quad \nu>0.
$$

Thus $C_X'(x_i)=\kappa x_i^\nu$ is strictly increasing and the cost is
strictly convex on the nonnegative domain. The case $\nu=1$ is the quadratic
advancement-cost boundary. The function is not a research-versus-development
allocation block.

Used by: the Phase 5 objective, KKT conditions, SOC and unique optimizer.

### A-P05-VALUE-01 - Finite expected optimized project value

For each developer characteristic and fixed conjectured price $p_m$, the
Phase 4 optimized value $W_i(q,m;M,p_m)$ is measurable and integrable under
$F(q,m)$. Because abandonment has value zero and belongs to the maximization,
$W_i\geq0$, so

$$
0\leq\Omega_i(M,p_m)
=\int W_i(q,m;M,p_m)\,dF(q,m)<+\infty.
$$

Used by: expected-value definition, existence of a finite objective and the
zero-value corner.

### A-P05-TIME-01 - Ex ante common control at a conjectured price

Developer $i$ chooses the one common $x_i$ after observing
$(a_i,k_i,M)$ and anticipating route opportunities, but before drawing
$(q,m)$ and before route choice. Phase 5 treats $p_m$ as fixed and conjectured.
The feedback selecting $p_m^*$ is deferred to Phase 6.

Used by: objective conditioning, expected value and fixed-price reform
comparison.

### A-P05-CHANNEL-01 - Only the expected route-value channel

The institutional regime changes none of $a_i$, $k_i$, $\kappa$, $\nu$,
$C_X$, $F(q,m)$, $q$, $m$, $s(q)$ or $s_g(q)$. It can affect
$x_i^*$ only through $\Omega_i$, and within $\Omega_i$ only through the
approved route-$E$ wedge. Manufacturing capability $k_i$ may affect
$\Omega_i$ through route value and sorting, but it does not enter
$a_ix_i$ or $C_X(x_i)$.

Used by: Phase 5 causal-channel audit and the fixed-price binary comparison.

### A-P05-GAP-01 - Appendix-only value-gap accounting

$B_i$ and $K_i$ are accounting auxiliaries measured per marginal
planning-stage project, with

$$
K_i=B_i+\Omega_i.
$$

They are not persistent state variables and do not define a recursive Bellman
problem. The identity gives the downstream value gap
$K_i-B_i=\Omega_i$ without adding a scientific-research productivity channel.

Used by: the value-gap interpretation of the advancement FOC.

## N. Phase 5 assumption-use matrix

| Result | Assumptions actually used |
|---|---|
| common planned-project intensity $\lambda_i^{\mathrm{plan}}=a_ix_i$ | A-P01-FIRM-02, A-P01-TIME-01, A-P05-TIME-01 |
| advancement cost and marginal cost | A-P05-COST-01 |
| finite nonnegative $\Omega_i$ | A-P04-CHOICE-01, A-P05-VALUE-01 |
| existence and uniqueness of $x_i^*$ | A-P05-COST-01, A-P05-VALUE-01 |
| zero-value corner $x_i^*=0$ | A-P05-COST-01, A-P05-VALUE-01 |
| fixed-price binary MAH effect | Phase 4 binary value comparison, A-P05-TIME-01, A-P05-CHANNEL-01 |
| value-gap interpretation | A-P05-GAP-01 |

No assumption states that MAH raises patent applications, upstream research,
breakthrough innovation or every developer's advancement intensity.
