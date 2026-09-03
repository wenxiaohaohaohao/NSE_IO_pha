# 03 Assumptions and Scope

Phase status: `PHASE 1--14 - APPROVED`

This is the authoritative Phase 14 assumption ledger. Earlier phase-specific
IDs remain stable aliases for traceability, but the four blocks below are the
only active assumption taxonomy. Architecture restrictions, definitions,
optimization results and proposition conclusions are recorded separately and
must not be promoted into assumptions.

## 1. Classification rule

| Status | Meaning | May be cited as an assumption? |
|---|---|---|
| Primitive | Exogenous object, functional form, support or technology supplied by the model | Yes, through its canonical ID |
| Maintained regularity | Smoothness, integrability, endpoint or atomlessness condition needed for a stated theorem | Yes, only for the result named in its scope |
| Optimization-derived | FOC, SOC, envelope derivative, best response or value comparison proved from primitives | No |
| Derived conclusion | Cutoff, sorting, policy effect, equilibrium price order or outcome effect proved in a proposition | No |
| Architecture restriction | Timing, ownership, policy-channel, accounting, baseline/extension or partial-equilibrium boundary | No; cite the `ARCH-*` ID as a scope guard |

The model therefore never assumes a route choice, a positive reform effect,
an original-versus-incremental ranking, a patent increase, a cutoff, or an
equilibrium-price sign. Such statements must be proved or reported as
ambiguous/zero when their sufficient conditions fail.

## A. Demand and commercial-return assumptions

### `A-DEM-01` - Residual demand and parameter domain

**Type:** primitive.

For product price \(p>0\) and project value shifter \(q>0\), residual demand is

\[
y(p;q)=Aq p^{-\varepsilon},
\qquad A>0,\quad \varepsilon>1.
\]

The policy regime does not change \(A,q,\varepsilon\). The derivative signs,
markup and optimized-profit formula are optimization-derived, not assumed.

### `A-DEM-02` - Conditional pricing domain

**Type:** primitive decision domain.

For fixed marginal manufacturing cost \(c>0\), the product price is chosen
from \(p\in[c,\infty)\). Route technologies supply the value of \(c\); the
pricing problem does not itself contain route fixed costs or CMO capacity
payments.

### `A-DEM-03` - Stationary commercial present value

**Type:** primitive stochastic environment.

Future currency is discounted by \(\beta\in(0,1)\), and a commercialized
product remains active next period with conditional probability
\(\varphi\in[0,1)\). Thus \(\beta\varphi<1\). This \(\varphi\) is commercial
survival, not the pre-commercial realization probability \(s(q)\).

## B. Manufacturing technology assumptions

### `B-MFG-01` - Internal feasibility and capability domain

**Type:** primitive technology.

Developer capability \(k_i>0\) and project manufacturing requirement \(m>0\)
share the same capability scale. A positive threshold
\(\underline{k}(m)\) defines internal feasibility. The setup cost is encoded as
\(F_I(m,k_i)=+\infty\) when \(k_i<\underline{k}(m)\); no second feasibility
indicator is introduced.

### `B-MFG-02` - Internal technology shape

**Type:** primitive technology restriction.

On the interior of the feasible domain, \(c_I(m,k)>0\) and \(F_I(m,k)\) is
finite and differentiable, with

\[
c_{I,m}>0,\qquad c_{I,k}<0,\qquad
F_{I,m}>0,\qquad F_{I,k}<0.
\]

These signs describe technology. The induced sign of a value derivative and
the sorting result are derived.

### `B-MFG-03` - Qualified external technology

**Type:** primitive technology.

External production has \(c_E(m)>0\), requires \(b(m)>0\) units of qualified
CMO capacity with \(b'(m)>0\), and has readiness cost \(F_E(m)\geq0\) plus
holder-side burden \(\mu_E\geq0\). These objects do not depend on developer
capability and are distinct from the capacity payment \(p_m b(m)\).

### `B-MFG-04` - Deterministic route choice regularity

**Type:** maintained regularity.

The noncore transfer value \(T(q,m)\) is finite and continuous, abandonment is
normalized to zero, and route choice maximizes the deterministic values of
\(I,E,T,A\). Continuous firm/project heterogeneity makes exact route ties a
zero-measure event. This condition makes the maximizer single valued almost
surely; it does not assume which route wins.

### `B-MFG-05` - Proposition-specific cutoff crossing

**Type:** maintained sufficient condition for Proposition 1 only.

At a fixed finite \((q,m,p_m,\tau_E)\), the gap
\(\Delta_{IE}(k)\) is continuous on the internally feasible domain and obeys

\[
\lim_{k\downarrow\underline{k}(m)}\Delta_{IE}(k)<0,
\qquad
\lim_{k\to\infty}\Delta_{IE}(k)>0.
\]

These endpoint restrictions guarantee that a crossing exists once the strict
slope has been derived from `A-DEM-01` and `B-MFG-02`. They do not assume the
cutoff or sorting conclusion, and they need not hold for every project-price
cell.

## C. Project-advancement assumptions

### `C-ADV-01` - Common advancement control and cost

**Type:** primitive technology and decision domain.

Each developer has \(a_i>0\), uses one common \(x_i\), restricts it to
\(x_i\geq0\), and incurs

\[
C_X(x_i)=\frac{\kappa}{1+\nu}x_i^{1+\nu},
\qquad \kappa>0,\quad \nu>0.
\]

The canonical meaning of \(x_i\) is original-drug innovation investment /
project-advancement intensity. It is broader than pure clinical-development
effort but is not patent applications, patent effort, basic research, or
upstream scientific discovery. The optimal \(x_i^*\) is derived.

### `C-ADV-02` - Exogenous project draw and finite route value

**Type:** primitive distribution plus maintained integrability.

After \(x_i\) is chosen, a planning-stage project draws
\(\omega=(q,m)\sim F\), where \(F\) is invariant to policy and advancement.
For each developer and fixed candidate \(p_m\), optimized route value \(W_i\)
is measurable and integrable. Because abandonment is available,

\[
0\leq\Omega_i(M,p_m)=\int W_i(q,m;M,p_m)\,dF(q,m)<\infty.
\]

### `C-ADV-03` - Ex ante timing and anticipated price

**Type:** information/timing restriction.

The developer observes \(M,(a_i,k_i)\), anticipates route opportunities and
the equilibrium-consistent CMO price, then chooses \(x_i\) before the project
draw and route assignment. Realized holder-producer separation cannot be a
causal event preceding \(x_i\).

### `C-ADV-04` - Novelty mixture without a class-specific control

**Type:** primitive empirical decomposition.

For \(g\in\{O,\mathrm{Inc}\}\), exogenous shares and conditional distributions
satisfy

\[
\rho_g\geq0,
\quad \sum_g\rho_g=1,
\quad F=\sum_g\rho_gF_g,
\quad \Omega_i=\sum_g\rho_g\Omega_{ig}.
\]

There is no \(x_{ig}\), and no ordering of class-specific reform gains is
imposed.

### `C-ADV-05` - Exogenous downstream realization

**Type:** primitive measurement/outcome mapping.

The measurable functions \(s(q)\) and, when the novelty decomposition is used,
\(s_g(q)\), lie in \([0,1]\), are route-independent where specified, and are
invariant to policy. They do not represent patent generation and do not feed
back into advancement or route choice.

### `C-ADV-06` - Capability-response curvature

**Type:** maintained sufficient condition for the manufacturing-capability
part of Proposition 3 only.

Impose \(\nu\geq1\) when signing the level response of \(\Delta x_i\) to
internal capability while holding \(a_i\), candidate price and exogenous
primitives fixed. For \(0<\nu<1\), no sign is claimed without an additional
bound. This restriction does not assume the sign of the response itself.

## D. CMO-market regularity assumptions

### `D-CMO-01` - Qualified-capacity supply

**Type:** primitive technology plus regularity.

For fixed supplier efficiency \(z_j>0\), \(\Psi(s_j;z_j)\) is twice
continuously differentiable on \(s_j\geq0\), satisfies

\[
\Psi(0;z_j)=\Psi_s(0;z_j)=0,
\quad \Psi_s>0\ (s_j>0),
\quad \Psi_{ss}>0,
\quad \Psi_{sz}<0,
\]

and \(\Psi_s\to\infty\) as \(s_j\to\infty\). The supplier distribution
\(H_C(z)\) is exogenous and policy invariant. The unique capacity best response
and upward-sloping supply are optimization-derived.

### `D-CMO-02` - Background CMO demand

**Type:** primitive demand regularity.

\(D_m^B(p_m)\) is finite, continuous, nonnegative and weakly decreasing,
with \(D_m^B(0)>0\) and \(D_m^B(p_m)\to0\) as \(p_m\to\infty\). It belongs to
the background market, is outside the study cohort, and is policy invariant.

### `D-CMO-03` - Deterministic aggregation regularity

**Type:** maintained regularity.

At every finite candidate price, firm/project heterogeneity assigns zero mass
to route ties. Route values are continuous in price, relevant first moments
are finite, and \(a_ix_i^*(M,p_m)b(m)\) admits an integrable envelope on
compact price intervals. These conditions justify aggregate continuity by
dominated convergence; they do not replace deterministic choice with logit.

### `D-CMO-04` - Single-market price-taking closure

**Type:** maintained equilibrium architecture.

Developers and suppliers take a candidate \(p_m\) as given. The equilibrium
price is selected only by qualified-capacity market clearing. Supply
technology, supplier heterogeneity and background demand are not shifted by
policy. No entry, labor, capital, product-market or welfare market is closed.

## 2. Architecture guards (not assumptions)

| ID | Binding restriction |
|---|---|
| `ARCH-01` | \(M\in\{0,1\}\) acts directly only through \(\tau_E(0)=+\infty\), \(\tau_E(1)=\bar\tau_E<\infty\); no direct shift of technology, project draws, realization, supply or background demand |
| `ARCH-02` | Under \(E\), the developer remains the holder; \(E\neq T\) and retained rights are not transferred |
| `ARCH-03` | Anticipation precedes \(x_i\); planning, project draw, route assignment, observed separation and realized products follow in that order |
| `ARCH-04` | Baseline is partial equilibrium and excludes entry, welfare, portfolio dynamics, representative households and additional market clearing |
| `ARCH-05` | \(x_i\) has the v1.2 meaning and cannot be interpreted as patent applications or upstream research |
| `ARCH-06` | Binary policy comparisons, finite-wedge derivatives, fixed-price derivatives and equilibrium-price comparisons are distinct operations |
| `ARCH-07` | One common \(x_i\); \(g\in\{O,\mathrm{Inc}\}\) is only an empirical classifier and creates no new control |
| `ARCH-08` | Marginal, fixed, readiness, holder-side and CMO-capacity costs are accounted for once and only once |
| `ARCH-09` | Logit, inclusive value, continuous \(\eta\), matching, dynamics, route-specific realization and research-versus-development allocation remain extension-only |

## 3. Proposition--assumption matrix

Definition parents and architecture guards are reported separately so that the
matrix does not mislabel them as economic assumptions.

| Result | Canonical assumptions actually used | Definition/derived parents | Architecture guards | Sufficient/strict condition and zero-effect boundary |
|---|---|---|---|---|
| Proposition 1: organizational sorting | `A-DEM-01`, `A-DEM-03`; `B-MFG-01`, `B-MFG-02`, `B-MFG-04`, `B-MFG-05` | derived \(R_c<0\), route values and \(\Delta_{IE,k}>0\) | `ARCH-02`, `ARCH-06`, `ARCH-08` | Endpoint crossing is cell-specific; sorting applies only where \(I,E\) beat \(T,A\); otherwise no cutoff-based route conclusion |
| Proposition 2: MAH-relevant set | `B-MFG-04` | deterministic maximum and old choice-set value \(W_i^0\) | `ARCH-01`, `ARCH-06` | Strict gain iff \(W_i^E>W_i^0\); null relevant set or prohibitive price gives zero effect |
| Proposition 3: advancement and heterogeneity | `C-ADV-01`, `C-ADV-02`, `C-ADV-03`; additionally `B-MFG-02`, `C-ADV-06` only for manufacturing-capability scaling | route-value gain and strictly concave advancement objective | `ARCH-01`, `ARCH-05`, `ARCH-06`, `ARCH-07` | \(\Delta\Omega_i>0\) gives a strict fixed-price response; zero gain gives zero response; no capability sign for \(0<\nu<1\) without another bound |
| Novelty corollary | `C-ADV-04`, `C-ADV-05` | mixture identity | `ARCH-05`, `ARCH-07` | No cross-class order; includes \(\rho_O=0\), \(\rho_{\mathrm{Inc}}=0\), and either class gain equal to zero |
| Proposition 4: CMO existence and uniqueness | `B-MFG-03`; `D-CMO-01`--`D-CMO-04` | supplier best responses and aggregate demand derived at a candidate price | `ARCH-04`, `ARCH-06` | Existence uses low/high-price boundaries; uniqueness uses strictly increasing supply and weakly decreasing total demand |
| Proposition 5: scarcity attenuation | `B-MFG-03`; `D-CMO-01`--`D-CMO-04` | Proposition 4 and nonnegative study demand | `ARCH-01`, `ARCH-06` | Strict price increase requires positive post-MAH study demand at the old price; no demand, no entrusted advantage, or perfectly elastic supply gives the stated zero/common-price boundary |
| Proposition 6: planning and observed outcomes | `B-MFG-04`; `C-ADV-02`--`C-ADV-05` | common \(x_i^*\), deterministic route indicator and outcome integrals | `ARCH-03`, `ARCH-05`, `ARCH-07` | Realization is policy invariant; either novelty class may have zero effect and no patent outcome is implied |

## 4. Derived results that cannot be cited as assumptions

| Derived object or sign | Derivation source |
|---|---|
| Unique product price, pricing SOC, \(R_q>0\), \(R_c<0\) | Phase 2 optimization under `A-DEM-01`--`A-DEM-03` |
| \(\Delta_{IE,k}>0\), cutoff uniqueness and sorting | Phase 4 from `A-DEM-01`, `B-MFG-02`, `B-MFG-05` |
| \(W_i^1-W_i^0=[W_i^E-W_i^0]_+\geq0\) | deterministic choice-set expansion in Phase 4/8 |
| \(x_i^*=[\beta a_i\Omega_i/\kappa]^{1/\nu}\) | Phase 5 KKT/SOC under `C-ADV-01`--`C-ADV-03` |
| Supply increasing, study demand weakly decreasing | Phase 6 best responses and route/advancement response |
| CMO equilibrium existence/uniqueness | Phase 6/8 under `D-CMO-01`--`D-CMO-04` |
| \(p_m^*(1)\geq p_m^*(0)\) and scarcity attenuation | Phase 8 equilibrium comparison, not a policy primitive |
| Novelty ranking is ambiguous | Phase 8 reverse-support construction under `C-ADV-04` |

## 5. Legacy-ID alias ledger

Every old ID remains resolvable, but it does not create an additional
assumption category.

| Legacy ID | Canonical assumption or guard |
|---|---|
| `A-P01-FIRM-01` | `C-ADV-01`, `D-CMO-03` |
| `A-P01-FIRM-02` | `B-MFG-01`, `C-ADV-01`, `ARCH-01` |
| `A-P01-FIRM-03` | `D-CMO-01` |
| `A-P01-INST-01` | `ARCH-01` |
| `A-P01-INST-02` | `ARCH-01` |
| `A-P01-INST-03` | `ARCH-02` |
| `A-P01-PROJ-01` | `C-ADV-02` |
| `A-P01-PROJ-02` | `A-DEM-01`, `B-MFG-01` |
| `A-P01-PROJ-03` | `C-ADV-04`, `ARCH-07` |
| `A-P01-PROJ-04` | `C-ADV-05` |
| `A-P01-SCOPE-01` | `ARCH-04` |
| `A-P01-SCOPE-02` | `ARCH-05` |
| `A-P01-SCOPE-03` | `ARCH-09` |
| `A-P01-TIME-01` | `C-ADV-03`, `ARCH-03` |
| `A-P01-TIME-02` | `C-ADV-03`, `ARCH-03` |
| `A-P01-TIME-03` | `ARCH-03` |
| `A-P01-TIME-04` | `D-CMO-04`, `ARCH-06` |
| `A-P02-ACCOUNT-01` | `ARCH-08` |
| `A-P02-DEMAND-01` | `A-DEM-01` |
| `A-P02-POLICY-01` | `ARCH-01` |
| `A-P02-PRICE-01` | `A-DEM-02` |
| `A-P02-PV-01` | `A-DEM-03` |
| `A-P03-EXT-01` | `B-MFG-03` |
| `A-P03-EXT-02` | `B-MFG-03`, `ARCH-08` |
| `A-P03-HOLDER-01` | `ARCH-02` |
| `A-P03-INT-01` | `B-MFG-01` |
| `A-P03-INT-02` | `B-MFG-02` |
| `A-P03-POLICY-01` | `ARCH-01` |
| `A-P03-SCARCITY-01` | `D-CMO-04`, `ARCH-06` |
| `A-P04-CHOICE-01` | `B-MFG-04` |
| `A-P04-CUTOFF-01` | `B-MFG-05` |
| `A-P04-CUTOFF-02` | `B-MFG-04` |
| `A-P04-OUTSIDE-01` | `B-MFG-04` |
| `A-P04-POLICY-01` | `ARCH-01`, `ARCH-06` |
| `A-P04-PRICE-01` | `ARCH-06` |
| `A-P05-CHANNEL-01` | `ARCH-01`, `ARCH-05` |
| `A-P05-COST-01` | `C-ADV-01` |
| `A-P05-GAP-01` | `ARCH-08` |
| `A-P05-TIME-01` | `C-ADV-03` |
| `A-P05-VALUE-01` | `C-ADV-02` |
| `A-P06-AGG-01` | `D-CMO-03` |
| `A-P06-BACKGROUND-01` | `D-CMO-02` |
| `A-P06-PRICE-01` | `D-CMO-04`, `ARCH-04`, `ARCH-06` |
| `A-P06-SUPPLY-01` | `D-CMO-01` |
| `A-P08-HET-01` | `C-ADV-06` |
| `A-P08-OBS-01` | `C-ADV-05` |

Legacy references in earlier approved files are therefore non-orphaned. New
work must cite canonical IDs.

## 6. Assumption discipline audit rules

1. Each new maintained condition must enter exactly one of Blocks A--D and
   state whether it is primitive or proposition-specific regularity.
2. An optimization-derived sign must cite its FOC/envelope argument rather
   than appear in an assumption row.
3. A binary \(M\) comparison cannot be written as a derivative with respect to
   \(M\).
4. Fixed candidate price and equilibrium price must be named explicitly.
5. No class ranking or baseline patent response can be introduced without a
   separately approved architecture change and external evidence. The
   research--development extension was separately approved on 2026-09-03;
   its patent sign remains conditional and extension-only.
6. Extension-only assumptions cannot be cited by a baseline proposition.
7. Failure of a sufficient condition yields an unsigned or zero-effect case;
   it does not authorize a stronger conclusion.

## 7. Activated extension-only assumptions

These assumptions apply only to
`15_research_development_patent_extension.tex`. They do not enter any of the
six baseline propositions or the baseline CMO equilibrium.

### `E-RD-01` - Two allocations and a common resource ceiling

**Type:** extension primitive.

The developer chooses $x_i^R,x_i^D\geq0$ subject to
$x_i^R+x_i^D\leq\bar X_i$, where $\bar X_i>0$ is predetermined and policy
invariant. A firm is financially/resource constrained in the model only when
the KKT multiplier $\varpi_i$ is positive.

### `E-RD-02` - Project-production complementarity

**Type:** extension primitive technology.

Planning-stage project mass is
$N_i=(a_i+\gamma_i x_i^R)x_i^D$, with $a_i>0$ predetermined and
$\gamma_i\geq0$ policy invariant. The policy does not shift $a_i$ or
$\gamma_i$ directly.

### `E-RD-03` - Research and development payoff curvature

**Type:** extension primitive and sufficient curvature restriction.

$u_i,\kappa_{Ri},\kappa_{Di}>0$ are policy invariant. On every value reached
in the comparison,

$$
\kappa_{Ri}\kappa_{Di}-(\beta\Omega_i\gamma_i)^2>0.
$$

This makes the quadratic-bilinear objective strictly concave. It is not a
conclusion about the response signs.

### `E-RD-04` - Interior-regime qualification

**Type:** proposition-specific regularity.

The strict local signs in Extension Propositions 1 and 2 apply when both
allocations are positive and the resource regime is locally unchanged. At a
nonnegativity corner, the KKT inequalities give weak signs. A slack/binding
switch is evaluated by finite solutions rather than differentiation through
the kink.

### `E-RD-05` - Development-biased value shift

**Type:** sufficient condition for the binding-resource sign.

At an interior binding allocation,

$$
a_i>\gamma_i(x_i^D-x_i^R).
$$

This condition makes the marginal commercialization-value increase favor
development. If it fails, the extension does not sign a patent decline.

### `E-RD-06` - Patent-production mapping

**Type:** extension measurement/production condition.

$P_i^A=h_i(x_i^R)$ with $h_i'>0$ for the strict patent-sign result. Patent
applications remain an imperfect empirical interface rather than a direct
observation of upstream research. A locally unchanged high-value patent
component requires an additional local-inelasticity condition and is not a
general proposition.

### `E-RD-07` - Baseline isolation and equilibrium mapping

**Type:** extension architecture guard.

The extension takes $\Omega_i(M,p_m)$, deterministic routes, and
$\chi_i^E(p_m;M)$ from the commercialization block. Its study CMO demand is
$\int N_i^*\chi_i^E\,dH$. Supplier technology, background demand, and the
single market-clearing condition are unchanged. Binary MAH effects are finite
comparisons through $\tau_E(M)$ and the endogenous CMO price; no direct
$M\to x_i^R$, $M\to x_i^D$, or $M\to P_i^A$ arrow is allowed.

## 8. Extension-result assumption matrix

| Extension result | Assumptions used | Derived parents | Zero/ambiguity boundary |
|---|---|---|---|
| Extension Proposition 1: slack-resource response | `E-RD-01`--`E-RD-04` | slack KKT system and strict concavity | $\gamma_i=0$ gives zero research response; corners give weak signs |
| Extension Proposition 2: binding-resource reallocation | `E-RD-01`--`E-RD-05` | binding KKT system | equality in `E-RD-05` gives no local reallocation; reversal makes the research sign positive |
| Extension Corollary 1: patent sign | `E-RD-04`--`E-RD-07` | Extension Propositions 1--2 and $P_i^A=h_i(x_i^R)$ | zero equilibrium value gain, $h_i'=0$, regime switch, or failed development-bias condition removes the strict sign |
| Extension CMO monotonicity | `E-RD-01`--`E-RD-03`, `E-RD-07`; baseline `D-CMO-01`--`D-CMO-04` | revealed-preference monotonicity of $N_i^*$ and baseline $\Omega_{i,p_m}=-\chi_i^E$ | failure of baseline aggregation regularity is a closure failure |
