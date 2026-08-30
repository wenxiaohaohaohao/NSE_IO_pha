# 02 Equation Dependency Map

Phase status: `PHASE 1 - APPROVED; INITIAL MAP`  
This map records definitions and timing dependencies only. Items marked `DEFERRED` are obligations for later approved phases, not Phase 1 results.

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
| $x_i\equiv$ clinical-development effort | v1.2 says $x_i$ is broader |
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
