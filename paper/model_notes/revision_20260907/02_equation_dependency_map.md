<!-- Inherited from Phase 1 commit 7c7dad4; current revision only, historical files unchanged. -->
# 02 Equation Dependency Map

Phase status: `PHASE 1 REVISION - APPROVED; PHASE 2 REVISION - APPROVED`  
This map retains Phase 1 definitions/timing and adds the current Phase 2 commercial-value kernel. Items marked `DEFERRED` are obligations for later approved phases, not Phase 1 results.

## 1. Phase 1 definition ledger

| ID / planned LaTeX label | Object defined | Inputs already defined | Mathematical status | First proof obligation |
|---|---|---|---|---|
| `P01-E01` / `eq:p01-developer-type` | $\theta_i=(a_i,k_i)$ | $a_i,k_i$ | definition | none |
| `P01-E02` / `eq:p01-project-draw` | $\omega=(q,m)\sim F(q,m)$ | $q,m,F$ | definition/distribution statement | none |
| `P01-E03` / `eq:p01-class-mixture` | $F=\sum_g\rho_gF_g$, $\sum_g\rho_g=1$ | $g,\rho_g,F_g$ | distribution identity | verify valid mixture weights |
| `P01-E04` / `eq:p01-institutional-wedge` | $\tau_E(0)=+\infty$, $\tau_E(1)=\bar\tau_E<+\infty$ | $M,\tau_E,\bar\tau_E$ | primitive institutional definition | Phase 3 verifies no second policy channel |
| `P01-E05` / `eq:p01-planned-intensity` | $\lambda_i^{\mathrm{plan}}=a_ix_i$ | $a_i,x_i$ | technology definition | Phase 5 adds optimization for $x_i$ |
| `P01-E06` / `eq:p01-route-domain` | common route-label domain; effective E availability encoded only by the wedge | $M,r_i,I,E,T,A$ | choice-domain definition | Phase 4 derives $r_i^*$ from values |
| `P01-E07` / `eq:p01-downstream-probability` | downstream probability $s(q)$ | $q,s$ | primitive probability definition | Phase 4 uses it in route values |

No FOC, SOC, route cutoff, price equation, payoff equation, or comparative static belongs to Phase 1.

## 2. Causal and timing order

```text
Predetermined distributions and characteristics
  H(a,k) -> (a_i,k_i)
  H_C(z) -> z_j
  F(q,m), {rho_g,F_g} -> project draws (q,m) and optional class g

Institutional regime
  M -> tau_E(M) / legal availability of retained entrusted route E

Stage 1: ex ante project advancement
  observed (a_i,k_i,M) + anticipated p_m^*
      -> expected optimized project value Omega_i               [DEFERRED: Phases 2-5]
      -> common control x_i                                    [DEFERRED optimization: Phase 5]
      -> lambda_i^plan = a_i x_i                               [DEFINED: Phase 1]

Stage 2: project realization
  planning-stage project -> draw (q,m) from F
  g is an empirical classifier only; it creates no x_ig

Stage 3: organization
  (q,m,k_i,M,p_m^*) -> route choice r_i^* in {I,E,T,A}         [DEFERRED: Phases 3-4]

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

## 3. Initial fixed-point dependency

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

## 4. Allowed direct and indirect arrows

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

## 5. Forbidden arrows and identities

| Forbidden statement | Reason / controlling requirement |
|---|---|
| $M\to a_i$ | research capability is predetermined; `RL-07` |
| $M\to q$ or $M\to F$ | project value and distribution are exogenous; `RL-08` |
| $M\to s(q)$ or $M\to s_g(q)$ | downstream realization is MAH invariant; `RL-09` |
| $M\to k_i$ or $M\to z_j$ | manufacturing characteristics are predetermined |
| direct $M\to p_m^*\downarrow$ | $p_m^*$ is endogenous; `RL-10` |
| $x_i\equiv$ patent applications | patents are outside the baseline outcome; `RL-21`--`RL-23` |
| $g=\mathrm{Inc}\equiv I$ | empirical class and internal route differ |
| separate $x_{ig}$ | common-control restriction |
| observed holder-producer separation $\to x_i$ | reverses locked timing |
| $E\equiv T$ | entrusted production retains holder rights; transfer does not |

## 6. Update rule

Before any later Phase writes a formula, it must:

1. add every new symbol to `01_symbols_and_objects.md` with one category and units;
2. add only assumptions actually used to `03_assumptions_and_scope.md`;
3. add the equation and its parents to this ledger;
4. mark each deferred arrow it closes and feedback loop it leaves open;
5. preserve the forbidden-arrow table unless the user approves an architecture change.

## Revision boundary
Novelty classes decompose the project distribution and impose no ranking. Upstream patent-generating research is outside the common advancement control. The existing full dependency ledger at commit 8a99cc3 remains reference evidence for later phase revalidation.

## 2. Phase 2 demand/profit ledger

Every Phase 2 equation conditions on project value $q>0$ and a positive route-implied marginal cost $c>0$. Phase 2 does not yet define $c_I$ or $c_E$.

| ID / LaTeX label | Object defined or result derived | Inputs already defined | Mathematical status | Proof / boundary obligation |
|---|---|---|---|---|
| `P02-E01` / `eq:p02-demand` | $y(p;q)=Aq p^{-\varepsilon}$ | $A,q,p,\varepsilon$ | primitive residual-demand schedule | verify units and $\varepsilon>1$ pricing boundary |
| `P02-E02` / `eq:p02-pricing-problem` | $\max_{p\geq c}(p-c)y(p;q)$ | P02-E01 and conditional marginal cost $c$ | optimization problem | product price is not CMO price |
| `P02-E03` / `eq:p02-price-foc` | derivative of $(p-c)y(p;q)$ | P02-E01--P02-E02 | optimization-derived FOC expression | check held-fixed objects and unique sign crossing |
| `P02-E04` / `eq:p02-optimal-price` | $p^*(c)=\varepsilon c/(\varepsilon-1)$ | P02-E03 | optimization-derived candidate | verify feasibility and global maximum |
| `P02-E05` / `eq:p02-price-soc` | objective curvature at $p^*(c)$ is negative | P02-E01--P02-E04 | optimization-derived SOC | $\varepsilon>1$, $A,q,c>0$ |
| `P02-E06` / `eq:p02-operating-profit` | $\pi(q,c)=Aq(\varepsilon-1)^{\varepsilon-1}\varepsilon^{-\varepsilon}c^{1-\varepsilon}$ | P02-E01, P02-E04 | optimization-derived one-period profit | verify no repeated cost and dimensions |
| `P02-E07` / `eq:p02-profit-derivatives` | $\pi_q=\pi/q>0$, $\pi_c=(1-\varepsilon)\pi/c<0$ | P02-E06 | algebraic derivatives | hold $A,\varepsilon$ and the other argument fixed |
| `P02-E08` / `eq:p02-present-value` | $R(q,c)=\pi(q,c)/(1-\beta\varphi)$ | P02-E06, $\beta,\varphi$ | derived convergent geometric present value | verify $\beta\varphi<1$ and conditional-success interpretation |
| `P02-E09` / `eq:p02-return-derivatives` | $R_q=R/q>0$, $R_c=(1-\varepsilon)R/c<0$ | P02-E07--P02-E08 | algebraic derivatives | keep $\beta,\varphi$ fixed |

The pricing control is product price $p$, not the CMO capacity price $p_m$. The derivative with respect to $c$ is a continuous conditional-cost derivative, not a derivative with respect to binary policy $M$.


## Phase 2 scope and feedback

A,q,epsilon and conditional c determine demand and optimal product price, then pi and R. Beta and phi enter only the geometric operating PV. The product price p is not the CMO price p_m. R excludes route fixed costs, the institutional wedge and separately purchased capacity; those are deferred to Phases 3/4. This closes only the commercial-return branch; the outer CMO fixed point remains assigned to Phase 6. No binary-M derivative is taken.

## Phase 3 technology ledger

- eq:p03-internal-cost: (m,k) -> c_I; primitive; enters R from P02.
- eq:p03-internal-setup: (m,k,kbar) -> F_I; primitive with extended-value infeasibility; derivative signs only on interior.
- eq:p03-external-cost: m -> c_E; primitive; independent of k.
- eq:p03-capacity-requirement: m -> b; capacity units, later payment p_m b.
- eq:p03-external-fixed-cost: m -> F_E; currency/project.
- eq:p03-holder-burden: mu_E; currency/project, retained responsibility.
- eq:p03-policy-invariance: M -> tau_E; sole policy arrow.

Parents: Phase 1 project/developer definitions, Phase 2 cost/PV units, A-P03-TECH-01--03. None is an optimization-derived payoff or equilibrium equation.

## Phase 4 dependencies

Route values: s,R from P01/P02, costs from P03, T and zero -> W_I,W_E,W_T,W_A -> maximum W and deterministic r. Binary value gain compares maxima holding p fixed. Finite gap -> positive k derivative -> crossing-based unique root -> implicit derivatives. Market fixed point remains deferred.

- eq:p04-internal-value: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-entrusted-value: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-outside-values: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-optimized-value: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-route-choice: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-binary-value-effect: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-value-gap: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-gap-slope: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-cutoff: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-cutoff-sorting: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.
- eq:p04-cutoff-derivatives: parents follow the route-value/gap/cutoff chain above; finite-gap derivatives require A-P04-CUTOFF-01.

## Phase 5 dependency ledger

P04 maximum W + F -> Omega; a,x -> planned arrival; kappa,nu,x -> cost; beta,a,Omega,cost -> objective -> KKT/FOC/SOC -> unique x*. P04 binary maximum comparison -> DeltaOmega -> finite advancement response. B is an accounting benchmark; K=B+Omega; no recursive state.
- eq:p05-planned-intensity (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-advancement-cost (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-expected-value (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-advancement-objective (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-kkt (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-foc (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-soc (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-optimal-advancement (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-binary-channel (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-value-gap (parents in the preceding chain; A-P05-ADV-01--03 as applicable).
- eq:p05-value-gap-foc (parents in the preceding chain; A-P05-ADV-01--03 as applicable).

## Phase 6 fixed point and dependency ledger

Candidate p -> P04 routes and W -> P05 Omega and x -> chi and study demand; Psi,z,p -> supplier best response -> S; D_B plus study demand -> D; solve D-S=0 -> p*. Every inner object is evaluated conditional on candidate p. One scalar fixed point, no unresolved additional unknown. The price feedback includes both route selection and project intensity.
- eq:p06-supplier-problem; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-supplier-capacity; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-capacity-derivatives; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-aggregate-supply; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-entrusted-capacity; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-omega-price-envelope; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-advancement-price-response; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-study-demand; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-total-demand; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-market-clearing; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.
- eq:p06-existence-boundaries; parents follow the supplier/route/advancement/aggregate chain above; A-P06 conditions apply.

## Phase 7 equilibrium ledger
The collection eq:p07-equilibrium-collection contains only p*,x*,r*,s*. Route optimality eq:p07-route-optimality cites the Phase 4 indexed payoffs; advancement eq:p07-advancement-optimality is the Phase 5 optimizer at p*; capacity eq:p07-capacity-optimality is the Phase 6 optimizer; eq:p07-market-clearing uses the Phase 6 unique root. No additional unknown or market.
