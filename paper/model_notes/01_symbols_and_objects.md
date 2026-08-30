# 01 Symbols and Objects

Phase status: `PHASE 1 - APPROVED`  
Controlling specification: `paper/model_rebuild/spec/MAH_model_rebuild_effective_spec_v1.2.md`  
Effective-spec SHA256: `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`

## 1. Classification rule

Every active economic object is assigned exactly one of the nine categories required by the specification:

1. `primitive parameter`;
2. `exogenous firm characteristic`;
3. `exogenous project characteristic`;
4. `control`;
5. `endogenous firm-level object`;
6. `endogenous route-level object`;
7. `equilibrium price`;
8. `aggregate/distributional primitive`;
9. `derived observed outcome`.

Subscripts $i,j$ and route labels $I,E,T,A$ are syntactic labels rather than separate economic objects. Symbols reserved for later phases are not active until this file is updated immediately before their first formal use.

## 2. Unit convention

| Unit | Meaning |
|---|---|
| $\mathsf{C}$ | currency/value units |
| $\mathsf{X}$ | project-advancement input units |
| $\mathsf{P}$ | expected measure of viable planning-stage projects in one cohort |
| $\mathsf{K}$ | manufacturing capability/requirement units |
| $\mathsf{B}$ | qualified manufacturing-service capacity units |
| $1$ | dimensionless index, label, probability, or distribution mass |

One decision cohort is the Phase 1 time unit. Phase 2 must define product-output and within-period monetary units before demand and operating-profit formulas are introduced.

## 3. Active Phase 1 object registry

| Symbol | Exact category | Definition | Domain / units | First formal use | Direct MAH shift? |
|---|---|---|---|---|---|
| $\mathcal I$ | aggregate/distributional primitive | continuum of original-drug developers | index set | Phase 1 | No |
| $H(a,k)$ | aggregate/distributional primitive | exogenous joint distribution of developer characteristics | probability distribution, unit $1$ | Phase 1 | No |
| $a_i$ | exogenous firm characteristic | research capability: viable planning-stage projects per unit of advancement input | $a_i>0$, units $\mathsf{P}/\mathsf{X}$ | Phase 1 | No; `RL-07` |
| $k_i$ | exogenous firm characteristic | internal manufacturing capability | $k_i>0$, units $\mathsf{K}$ | Phase 1 | No |
| $\theta_i=(a_i,k_i)$ | exogenous firm characteristic | complete permanent baseline characteristic vector of developer $i$ | $(\mathsf{P}/\mathsf{X},\mathsf{K})$ | Phase 1 | No |
| $\mathcal J$ | aggregate/distributional primitive | set of qualified manufacturing-service suppliers | index set | Phase 1 | No |
| $H_C(z)$ | aggregate/distributional primitive | exogenous distribution of qualified supplier efficiency | probability distribution, unit $1$ | Phase 1 | No |
| $z_j$ | exogenous firm characteristic | qualified manufacturing-service productivity/capacity efficiency | $z_j>0$, dimensionless index | Phase 1 | No |
| $q$ | exogenous project characteristic | project commercial/scientific value shifter within the original-drug domain | $q>0$, dimensionless index | Phase 1 | No; `RL-08` |
| $m$ | exogenous project characteristic | manufacturing requirement/complexity | $m>0$, units $\mathsf{K}$ | Phase 1 | No |
| $\omega=(q,m)$ | exogenous project characteristic | complete route-planning-stage project draw | $(1,\mathsf{K})$ | Phase 1 | No |
| $F(q,m)$ | aggregate/distributional primitive | exogenous joint distribution of project characteristics | probability distribution, unit $1$ | Phase 1 | No |
| $g$ | exogenous project characteristic | empirical novelty classifier $g\in\{O,\mathrm{Inc}\}$; not a state or control | categorical label, unit $1$ | Phase 1 | No |
| $\rho_g$ | aggregate/distributional primitive | exogenous population share of novelty class $g$ | $\rho_g\geq0$, $\sum_g\rho_g=1$ | Phase 1 | No |
| $F_g(q,m)$ | aggregate/distributional primitive | conditional distribution of $(q,m)$ given $g$ | probability distribution, unit $1$ | Phase 1 | No |
| $M$ | primitive parameter | institutional regime: $0$ pre-MAH; $1$ retained holder-producer separation legally available | $M\in\{0,1\}$, unit $1$ | Phase 1 | This is the policy object |
| $\tau_E(M)$ | primitive parameter | institutional barrier attached only to retained entrusted route $E$ | $\mathsf{C}$ per project | Phase 1 | Yes, only through $M$ |
| $\bar\tau_E$ | primitive parameter | finite post-MAH entrusted-route institutional burden | $\bar\tau_E\geq0$, $\mathsf{C}$ per project | Phase 1 | No independent policy margin |
| $x_i$ | control | original-drug innovation investment / project-advancement intensity chosen before project draws | $x_i\geq0$, units $\mathsf{X}$ | Phase 1 | No direct shift; expected-value channel later |
| $\lambda_i^{\mathrm{plan}}$ | endogenous firm-level object | expected measure of viable projects reaching route planning | units $\mathsf{P}$ | Phase 1 | Indirect only through optimal $x_i$ |
| $p_m,p_m^*$ | equilibrium price | conjectured and market-consistent qualified manufacturing-service price | $\mathsf{C}/\mathsf{B}$ | Phase 1 reservation; Phase 6 solution | No direct downward shift; `RL-10` |
| $r_i$ | control | route choice made after $(q,m)$ is known | categorical route label | Phase 1 | $M$ changes feasibility of $E$ only |
| $r_i^*(q,m;M,p_m)$ | endogenous route-level object | eventual optimal route; value comparison is deferred to Phase 4 | subset of $\{I,E,T,A\}$ | Phase 1 reservation; Phase 4 derivation | Indirect through route wedge |
| $\Omega_i(M,p_m)$ | endogenous firm-level object | expected optimized value per route-planning-stage project | $\mathsf{C}$ per project | Phase 1 reservation; Phase 5 derivation | Indirect route-value channel only |
| $s(q)$ | primitive parameter | exogenous route-independent downstream realization probability | $[0,1]$, unit $1$ | Phase 1 | No; `RL-09` |
| $s_g(q)$ | primitive parameter | optional exogenous class-specific probability for typed observed outcomes | $[0,1]$, unit $1$ | Phase 1 boundary; Phase 9 if needed | No |
| observed holder-producer separation; realized products | derived observed outcome | post-route empirical outcomes, distinct from advancement and planning-stage project mass | route/product records; units deferred to Phase 9 | Phase 1 timing; Phase 9 formalization | Indirect only |

There are 27 active rows. Each has one and only one exact category.

## 4. Definitional identities active in Phase 1

The only Phase 1 equalities are definitions or distribution identities:

$$
\theta_i=(a_i,k_i),
\qquad
\omega=(q,m)\sim F(q,m),
$$

$$
F(q,m)=\sum_{g\in\{O,\mathrm{Inc}\}}\rho_gF_g(q,m),
\qquad
\sum_{g\in\{O,\mathrm{Inc}\}}\rho_g=1,
$$

$$
\tau_E(0)=+\infty,
\qquad
\tau_E(1)=\bar\tau_E<+\infty,
$$

and

$$
\lambda_i^{\mathrm{plan}}=a_ix_i.
$$

No payoff, FOC, SOC, cutoff, route share, or equilibrium-clearing equation is derived in Phase 1.

## 5. Route labels and institutional meaning

| Label | Meaning | Holder status | Feasible in $M=0$ | Feasible in $M=1$ |
|---|---|---|---|---|
| $I$ | internal manufacturing | developer remains holder | potentially feasible | potentially feasible |
| $E$ | retained entrusted manufacturing | developer remains holder; qualified producer manufactures | institutionally unavailable | legally available subject to later conditions |
| $T$ | transfer/out-license/non-retained outside option | developer does not use retained entrusted route | available | available |
| $A$ | abandonment or indefinite delay | no commercialization route selected | available | available |

Entrusted production $E$ is not ownership or authorization transfer. Empirical class $\mathrm{Inc}$ is unrelated to route $I$.

## 6. Explicit non-objects and forbidden interpretations

The following are not baseline endogenous objects:

- patent applications, patent grants, patent value, or upstream scientific output;
- basic-compound discovery effort;
- separate $x_{ig}$, $x_i^R$, or $x_i^D$ controls;
- logit shocks, inclusive value, or continuous implementation parameter $\eta$;
- entry, exit, welfare, portfolios, labor-market or capital-market objects.

Patent history may later proxy predetermined $a_i$; it is not equal to $x_i$ or $\lambda_i^{\mathrm{plan}}$.

## 7. Reserved names requiring future updates

The specification names future objects including demand $y(p;q)$, product price $p$, profit $\pi$, present value $R$, manufacturing-cost functions, route values $W^r$, project-advancement cost $C_X$, CMO capacity $s_j$, aggregate CMO supply/demand, and the organizational cutoff. They are not active Phase 1 objects. Each must be added here with one category and units immediately before its first formula in an approved later Phase.
