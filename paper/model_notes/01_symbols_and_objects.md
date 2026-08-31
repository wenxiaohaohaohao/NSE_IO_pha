# 01 Symbols and Objects

Phase status: `PHASE 1 - APPROVED; PHASE 2 - APPROVED; PHASE 3 - APPROVED; PHASE 4 - APPROVED; PHASE 5 - APPROVED; PHASE 6 - APPROVED`  
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

The locked nine-category taxonomy has no separate label for a derived market
aggregate. Accordingly, a supply or demand function obtained by integrating
endogenous firm-level choices is classified as an endogenous firm-level
object, with its market-aggregate status stated explicitly in the definition.
This convention adds no new category and does not treat an aggregate as an
individual firm's choice.

## 2. Unit convention

| Unit | Meaning |
|---|---|
| $\mathsf{C}$ | currency/value units |
| $\mathsf{Y}$ | physical product-output units per operating period |
| $\mathsf{X}$ | project-advancement input units |
| $\mathsf{P}$ | expected measure of viable planning-stage projects in one cohort |
| $\mathsf{K}$ | manufacturing capability/requirement units |
| $\mathsf{B}$ | qualified manufacturing-service capacity units |
| $1$ | dimensionless index, label, probability, or distribution mass |

One decision cohort is the project-planning time unit. Phase 2 defines product-output and within-period monetary units; Phase 3 technology costs use those same units.

## 3. Active object registry through Phase 6

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
| $A$ | primitive parameter | residual product-market size/scale shifter | $A>0$, units $\mathsf{Y}^{1-\varepsilon}\mathsf{C}^{\varepsilon}$ per operating period | Phase 2 | No; `RL-08` |
| $\varepsilon$ | primitive parameter | absolute constant elasticity of residual product demand | $\varepsilon>1$, unit $1$ | Phase 2 | No; `RL-08` |
| $\beta$ | primitive parameter | one-period discount factor | $\beta\in(0,1)$, unit $1$ | Phase 2 | No |
| $\varphi$ | primitive parameter | conditional probability that an already commercialized product remains active for the next operating period | $\varphi\in[0,1]$, unit $1$ | Phase 2 | No; distinct from $s(q)$ |
| $p$ | control | product price in the conditional static pricing problem | $p\geq c$, units $\mathsf{C}/\mathsf{Y}$ | Phase 2 | No; distinct from $p_m$ |
| $c$ | endogenous route-level object | positive marginal manufacturing-cost input produced by a route technology; Phase 2 holds it fixed and Phase 3 supplies the route mapping | $c>0$, units $\mathsf{C}/\mathsf{Y}$ | Phase 2 conditional argument; Phase 3 route mapping | No direct shift |
| $y(p;q)$ | endogenous route-level object | residual product demand conditional on product price and project value | $\mathsf{Y}$ per operating period | Phase 2 | No direct shift |
| $p^*(c)$ | endogenous route-level object | unique profit-maximizing product price conditional on marginal cost | $\mathsf{C}/\mathsf{Y}$ | Phase 2 | No; distinct from $p_m^*$ |
| $\pi(q,c)$ | endogenous route-level object | optimized one-period operating profit before route-specific fixed organizational costs | $\mathsf{C}$ per operating period | Phase 2 | Indirect only through a later route-cost mapping |
| $R(q,c)$ | endogenous route-level object | present value of the optimized operating-profit stream conditional on successful commercialization | $\mathsf{C}$ per commercially active product | Phase 2 | Indirect only through a later route-cost mapping |
| $c_I(m,k_i)$ | primitive parameter | internal-route technological marginal manufacturing-cost function on the feasible internal domain | positive; $\mathsf{C}/\mathsf{Y}$ | Phase 3 | No |
| $F_I(m,k_i)$ | primitive parameter | internal production-readiness/setup-cost function, extended to $+\infty$ when internal production is infeasible | $\mathsf{C}$ per project or $+\infty$ | Phase 3 | No |
| $\underline{k}(m)$ | primitive parameter | minimum internal manufacturing capability required for an internally produced project of requirement $m$ | positive; units $\mathsf{K}$ | Phase 3 | No |
| $c_E(m)$ | primitive parameter | technological marginal manufacturing-cost kernel under qualified external production | positive; $\mathsf{C}/\mathsf{Y}$ | Phase 3 | No |
| $b(m)$ | primitive parameter | qualified manufacturing-service capacity required by an entrusted project | positive; $\mathsf{B}$ per project | Phase 3 | No |
| $F_E(m)$ | primitive parameter | real entrusted-route technology-transfer, validation and production-readiness cost | nonnegative; $\mathsf{C}$ per project | Phase 3 | No |
| $\mu_E$ | primitive parameter | residual holder-side responsibility/coordination burden under entrusted manufacturing | nonnegative; $\mathsf{C}$ per project | Phase 3 | No; not removed by MAH |
| $T(q,m)$ | primitive parameter | finite noncore transfer/out-license outside-value function | $\mathsf{C}$ per project | Phase 4 | No direct shift |
| $W_i^I(q,m)$ | endogenous route-level object | internal-route project value | $\mathsf{C}$ per project, possibly $-\infty$ when internal production is infeasible | Phase 4 | No direct shift |
| $W_i^E(q,m;M,p_m)$ | endogenous route-level object | retained entrusted-route project value at a conjectured CMO capacity price | $\mathsf{C}$ per project or $-\infty$ when $E$ is institutionally unavailable | Phase 4 | Yes only through $\tau_E(M)$ |
| $W^T(q,m)$ | endogenous route-level object | non-retained transfer/out-license outside-option value | $\mathsf{C}$ per project | Phase 4 | No direct shift |
| $W^A$ | endogenous route-level object | abandonment/indefinite-delay value normalized to zero | $\mathsf{C}$ per project | Phase 4 | No |
| $W_i(q,m;M,p_m)$ | endogenous route-level object | optimized deterministic route value, the maximum over $I,E,T,A$ | $\mathsf{C}$ per project | Phase 4 | Indirect through the $E$ wedge only |
| $\Delta_{IE}(k_i;q,m,M,p_m)$ | endogenous route-level object | internal-minus-entrusted value gap holding $q,m,M,p_m$ fixed | $\mathsf{C}$ per project | Phase 4 | Indirect through $W_i^E$ |
| $k^*(q,m;p_m,M)$ | endogenous route-level object | unique conditional $I/E$ capability cutoff when finite-wedge crossing conditions hold | $\mathsf{K}$ | Phase 4 | Indirect through $\tau_E(M)$; no finite cutoff at $\tau_E=+\infty$ |
| $\kappa$ | primitive parameter | scale of project-advancement cost | $\kappa>0$, units $\mathsf{C}/\mathsf{X}^{1+\nu}$ | Phase 5 | No |
| $\nu$ | primitive parameter | curvature of project-advancement cost | $\nu>0$, unit $1$; $\nu=1$ is quadratic | Phase 5 | No |
| $C_X(x_i)$ | primitive parameter | project-advancement cost function | $\mathsf{C}$ per developer and decision cohort | Phase 5 | No |
| $x_i^*(M,p_m)$ | endogenous firm-level object | unique optimal common project-advancement intensity at a fixed conjectured CMO price | $\mathsf{X}$ | Phase 5 | Indirect only through $\Omega_i$ |
| $B_i$ | endogenous firm-level object | appendix-only continuation-value accounting benchmark before one additional viable project reaches route planning | $\mathsf{C}/\mathsf{P}$ | Phase 5 value-gap interpretation | Indirect only through the downstream comparison; not a state |
| $K_i$ | endogenous firm-level object | appendix-only value accounting benchmark after that project reaches route planning, $K_i=B_i+\Omega_i$ | $\mathsf{C}/\mathsf{P}$ | Phase 5 value-gap interpretation | Indirect only through $\Omega_i$; not a state |
| $s_j$ | control | qualified manufacturing-service capacity chosen by supplier $j$ | $s_j\geq0$, units $\mathsf{B}$ per decision cohort | Phase 6 | No direct policy shift |
| $\Psi(s_j;z_j)$ | primitive parameter | real cost of qualified capacity for supplier efficiency $z_j$ | $\mathsf{C}$ per decision cohort | Phase 6 | No |
| $s_j^*(p_m,z_j)$ | endogenous firm-level object | supplier $j$'s optimal qualified capacity at CMO price $p_m$ | $\mathsf{B}$ per decision cohort | Phase 6 | Indirect only through the endogenous price |
| $\chi_i^E(p_m;M)$ | endogenous firm-level object | expected qualified capacity per planning-stage project generated by developer $i$ under deterministic entrusted-route choice | $\mathsf{B}/\mathsf{P}$ | Phase 6 | Indirect through route $E$ and price |
| $S_m(p_m)$ | endogenous firm-level object | market-aggregate qualified-capacity supply obtained by integrating $s_j^*$ over $H_C$ | $\mathsf{B}$ per decision cohort | Phase 6 | No direct policy shift |
| $D_m^{\mathrm{MAH}}(p_m;M)$ | endogenous firm-level object | market-aggregate qualified-capacity demand generated by planning-stage projects selecting route $E$ | $\mathsf{B}$ per decision cohort | Phase 6 | Indirect through route value and advancement |
| $D_m^B(p_m)$ | aggregate/distributional primitive | exogenous background qualified-capacity demand outside the modeled study cohort | $\mathsf{B}$ per decision cohort | Phase 6 | No direct policy shift |
| $D_m(p_m;M)$ | endogenous firm-level object | total market demand, equal to background plus study-related demand | $\mathsf{B}$ per decision cohort | Phase 6 | Indirect through the study component |
| $W_i^0(q,m)$ | endogenous route-level object | optimized value from the old route set $\{I,T,A\}$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 Proposition 2 | No direct MAH input |
| $W_i^1(q,m;p_m)$ | endogenous route-level object | post-MAH optimized value after adding retained entrusted route $E$ at support price $p_m$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 Proposition 2 | Indirect through $W_i^E$ |
| $\mathcal C_i(p_m)$ | endogenous route-level object | set of project draws receiving a strict fixed-price gain from access to $E$ | subset of project support | Phase 8 Proposition 2 | Defined by the entrusted-value comparison |
| $\Delta\Omega_i(p_m)$ | endogenous firm-level object | expected fixed-price project-value gain from adding route $E$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 Proposition 3 | Indirect through $W_i^E$ |
| $\Omega_{ig}^h(p_m)$ | endogenous firm-level object | conditional expected optimized project value for class $g$ in regime $h\in\{0,1\}$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 corollary | Indirect through $W_i^E$ when $h=1$ |
| $\Delta\Omega_{ig}(p_m)$ | endogenous firm-level object | class-conditional fixed-price project-value gain | $\mathsf{C}/\mathsf{P}$ | Phase 8 corollary | Indirect through $W_i^E$ |
| $p_m^0$ | endogenous firm-level object | pre-MAH/background-market equilibrium CMO price, equal to $p_m^*(0)$ | $\mathsf{C}/\mathsf{B}$ | Phase 8 Proposition 5 | Equilibrium outcome; no direct shift |
| $p_m^1$ | endogenous firm-level object | post-MAH equilibrium CMO price, equal to $p_m^*(1)$ | $\mathsf{C}/\mathsf{B}$ | Phase 8 Proposition 5 | Equilibrium outcome; no direct shift |
| $\Delta\Omega_i^{\mathrm{dir}}$ | endogenous firm-level object | fixed-price reform value gain evaluated at $p_m^0$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 Proposition 5 | Indirect through route $E$ |
| $\Delta\Omega_i^{\mathrm{eq}}$ | endogenous firm-level object | equilibrium-price reform value gain evaluated at $p_m^1$ | $\mathsf{C}/\mathsf{P}$ | Phase 8 Proposition 5 | Includes the endogenous scarcity-price response |
| $\Delta x_i^{\mathrm{dir}}$ | endogenous firm-level object | advancement response implied by the fixed-price value gain | $\mathsf{X}$ | Phase 8 Proposition 5 | Only through $\Delta\Omega_i^{\mathrm{dir}}$ |
| $\Delta x_i^{\mathrm{eq}}$ | endogenous firm-level object | advancement response implied by the equilibrium-price value gain | $\mathsf{X}$ | Phase 8 Proposition 5 | Only through $\Delta\Omega_i^{\mathrm{eq}}$ |
| $\Lambda_i^{\mathrm{plan}}$ | endogenous firm-level object | equilibrium arrival intensity of viable projects at the commercialization-relevant planning stage, $a_ix_i^*$ | $\mathsf{P}$ per decision cohort | Phase 8 Proposition 6 | Indirect only through $x_i^*$ |
| $Y_i^{\mathrm{ret}}$ | derived observed outcome | expected realized retained-holder products using route $I$ or $E$ | $\mathsf{P}$ per decision cohort | Phase 8 Proposition 6 | Indirect through advancement and route choice |
| $Y_i^E$ | derived observed outcome | expected realized products with retained holder--producer separation | $\mathsf{P}$ per decision cohort | Phase 8 Proposition 6 | Indirect through advancement and route $E$ |
| $Y_{ig}^{\mathrm{ret}}$ | derived observed outcome | class-$g$ contribution to expected realized retained-holder products under common $x_i^*$ | $\mathsf{P}$ per decision cohort | Phase 8 Proposition 6 | Indirect through common advancement and route choice |
| $Q_i^{\mathrm{ret},h}$ | endogenous firm-level object | regime-$h$ expected realization rate per planning-stage project on retained routes | unit $1$ | Phase 8 Proposition 6 decomposition | Indirect through route choice; $s$ is policy invariant |

There are 83 active rows. Each has one and only one exact category.

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

Demand, product pricing, operating value, manufacturing technologies, route
values, deterministic choice, the conditional organizational cutoff, the
common project-advancement problem and the CMO supply--demand market are active
through Phase 6. Phase 7 adds no symbol: it collects the already defined
objects \(p_m^*,x_i^*,r_i^*,s_j^*\) into the partial-equilibrium definition.
Phase 8 activates only the proposition-specific value, price-comparison and
observed-outcome objects listed above. Phase 9 adds no mathematical object; it
fixes the interpretation and measurement boundary among those objects. Future
objects must be added here with one category and units immediately before
their first formula in an authorized later Phase.
