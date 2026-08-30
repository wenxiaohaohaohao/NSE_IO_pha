# 03 Assumptions and Scope

Phase status: `PHASE 1 - APPROVED`

This file records only assumptions needed for Phase 1 objects and timing. It does not impose the signs of later propositions. Demand, technology, optimization, market-regularity and comparative-static assumptions must be added in their approved phases before use.

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
