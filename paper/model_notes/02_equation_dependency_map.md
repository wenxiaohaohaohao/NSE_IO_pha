# Equation Dependency Map

**Status: Phase 2 partial.** Primitive → timing skeleton (Phase 1) plus the
demand → price → profit → PV chain (Phase 2) are fixed here; the full map
(execution note §18, amended by amendment §O) is not assembled until Phase
13. This file is re-opened and extended at each phase.

## Phase 1 skeleton (primitives and timing only)

```text
Stage 0: institutional regime
    M ∈ {0,1}
    [pre-existing manuscript also has continuous eta in [0,1] here; dropped
     per RL-13, not carried into this skeleton]

Stage 1: project-development / advancement investment (relabeled, Amend. §E)
    (a_i, k_i) observed
        ↓
    x_i chosen (control)
        ↓
    lambda_i^plan = a_i x_i         [production function, unchanged by amendment;
                                      matches pre-existing manuscript eq. (eq:planning_arrival) exactly]

Stage 2: project characteristics
    (q, m) ~ F(q,m)
    [empirical novelty class g ∈ {O,I} may stratify this draw: (q,m) ~ F_g(q,m), Amend. §D]
    [NEW structure -- pre-existing manuscript has no project-level draw]

Stage 3: commercialization organization
    route r ∈ {I, E, T, A} chosen given (q,m) and p_m
    [route VALUES not yet defined — Phase 4]
    [pre-existing manuscript resolves this via logit over G_i^r — RL-12 excludes
     this from baseline; deferred to Phase 11]

Stage 4: downstream realization
    s(q) ∈ [0,1]  (or s_g(q) if type-specific, Amend. §D)
    M does not directly shift s(q)  (RL-09)
    [pre-existing manuscript analog: zeta_i^r = s_i * chi_i^r, firm-level not project-level]

Stage 5: manufacturing-service market consistency
    aggregate entrusted-route demand must be consistent with p_m*
    [market clearing not yet defined — Phase 6/7]
    [pre-existing manuscript: p_m*(M,eta); new baseline drops eta]
```

## Phase 2 addition: demand → profit → present value

```text
A, q, epsilon
    ↓
demand y(p;q) = A q p^{-epsilon}
    ↓
static pricing problem  max_{p>=c} (p-c) y(p;q)
    ↓  [FOC + SOC]
optimal price p*(c) = epsilon/(epsilon-1) c
    ↓
operating profit pi(q,c) = A q (epsilon-1)^{epsilon-1}/epsilon^epsilon c^{1-epsilon}
    ↓  [x (1/(1-beta*phi)), given beta, phi]
present value R(q,c) = pi(q,c) / (1 - beta*phi)
    [replaces pre-existing manuscript's exogenous R_i^event and bar-R_i^E —
     see model_rebuild/02_demand_profit_derivation.tex subsec:crosswalk-note]
```

$c$ is a free argument at this stage (not yet $c_I(m,k_i)$ or $c_E(m)$);
that instantiation happens in Phase 3, at which point $R(q,c)$ feeds into
the Phase 4 route values $W_i^I,W_i^E$.

## Deferred branches (to be added when their defining phase is reached)

- Manufacturing-cost technologies $c_I,F_I,c_E,b,F_E,\mu_E,\tau_E(M)$: Phase 3.
- Route values $W_i^I,W_i^E,W_i^T,W^A$ and sorting cutoff $k^*$: Phase 4.
- $\Omega_i$, advancement FOC, $x_i^*$: Phase 5 (replaces manuscript's
  $\Gamma_i$ inclusive value and its $x_i^*=\frac{\beta a_i}{\kappa}\Gamma_i$).
- CMO cost $\Psi$, supply $S_m$, demand $D_m$, clearing $p_m^*$: Phase 6.
- Full fixed-point feedback loop ($p_m^*\!\leftrightarrow\! W_E,r^*,\Omega_i,x_i^*$)
  and the amendment's side branch (empirical class $g$ → type-specific
  $\Delta\Omega_{ig}$ → no ex-ante sign ranking) and exclusion branch
  (upstream patent-generating research $\not\to x_i$): Phase 13 (Amend. §O).
