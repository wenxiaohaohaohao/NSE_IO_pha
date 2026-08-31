# Phase 8 Independent Proof Audit

Status: APPROVED

This audit re-derives the six propositions and the novelty corollary without
using their displayed conclusions as assumptions.

## 1. Proposition 1 - organizational sorting

At fixed $(q,m,M,p_m)$ on the internally feasible domain,

$$
\Delta_{IE,k}
=s(q)R_c(q,c_I)c_{I,k}-F_{I,k}.
$$

The three primitive signs are $s(q)\geq0$, $R_c<0$, $c_{I,k}<0$ and
$F_{I,k}<0$. The first product is nonnegative and the second term is strictly
positive, so the derivative is strictly positive. Continuity plus a negative
lower endpoint and positive upper endpoint gives a root; the strict slope
makes it unique. The global route claim still requires both $I$ and $E$ to
beat $T/A$.

Boundary checks:

- $k_i<\underline k(m)$ makes $F_I=+\infty$ and $I$ infeasible: PASS.
- $k_i\rightarrow\infty$ weakly favors $I$ relative to $E$: PASS.
- $M=0$ makes $E$ unavailable and removes a finite $I/E$ cutoff: PASS.
- no endpoint crossing means no interior-cutoff claim: PASS.

Result: PASS.

## 2. Proposition 2 - MAH-relevant set

For arbitrary real $a,b$,

$$
\max\{a,b\}-a=\max\{0,b-a\}=[b-a]_+.
$$

Putting $a=W_i^0$ and $b=W_i^E$ gives the exact value identity. Strict gain
occurs if and only if $W_i^E>W_i^0$, so the relevant-set definition is neither
too broad nor too narrow.

Boundary checks:

- $W_i^E\leq W_i^0$ pointwise gives zero expected gain: PASS.
- $p_m\rightarrow\infty$ sends $W_i^E$ to minus infinity but leaves $W_i^0$
  unchanged: PASS.
- adding $E$ cannot lower the optimized old-set value: PASS.

Result: PASS.

## 3. Proposition 3 - advancement and heterogeneity

Let $c_i=(\beta a_i/\kappa)^{1/\nu}>0$ and
$h(t)=t^{1/\nu}$. Since $\Omega_i^1=\Omega_i^0+\Delta\Omega_i$,

$$
\Delta x_i=c_i[h(\Omega_i^0+\Delta\Omega_i)-h(\Omega_i^0)].
$$

The function $h$ is strictly increasing for every $\nu>0$. Thus
$\Delta x_i>0$ if and only if $\Delta\Omega_i>0$.

Holding route-value objects fixed, the bracket does not depend on $a_i$.
Differentiating the scale factor gives

$$
\Delta x_{i,a}
=\frac{1}{\nu a_i}\Delta x_i.
$$

The sign is strictly positive exactly when the response itself is positive.
This does not state that high research capability creates an entrusted
advantage.

For the $k_i$ comparison, $W_i^I$ is nondecreasing in $k_i$ and all other
values in the relevant-set comparison are $k_i$ invariant. Therefore
$W_i^0$, and hence $\Omega_i^0$, is nondecreasing; the positive entrusted
gap, and hence $\Delta\Omega_i$, is nonincreasing. If $\nu\geq1$, $h$ is
concave. For $u,d\geq0$, the increment $h(u+d)-h(u)$ is increasing in $d$
and decreasing in $u$. Both changes induced by higher $k_i$ therefore weakly
lower $\Delta x_i$. For $0<\nu<1$, $h$ is convex and the baseline-value
effect works in the opposite direction, so no unconditional sign is valid.

Boundary checks:

- $\Delta\Omega_i=0$ implies $\Delta x_i=0$: PASS.
- $\nu=1$ gives $x_i^*=\beta a_i\Omega_i/\kappa$: PASS.
- units: $(\beta a_i\Omega_i/\kappa)^{1/\nu}$ has units $\mathsf X$: PASS.
- no patent or upstream-research outcome enters the proof: PASS.

Result: PASS.

## 4. Novelty corollary

Applying the positive-part identity under each conditional distribution gives

$$
\Delta\Omega_{ig}=E_{F_g}[(W_i^E-W_i^0)_+].
$$

Linearity and $F=\sum_g\rho_gF_g$ give
$\Delta\Omega_i=\sum_g\rho_g\Delta\Omega_{ig}$. The baseline places no
stochastic dominance or support restriction on the entrusted surplus across
$F_O$ and $F_{\mathrm{Inc}}$. Concentrating positive surplus on one class
produces either ranking, which proves non-ordering.

Boundary checks:

- $\rho_O=0$ removes the original-class aggregate contribution: PASS.
- $\rho_{\mathrm{Inc}}=0$ removes the incremental-class contribution: PASS.
- the same common $x_i$ applies to both classes: PASS.
- this is a corollary, not a seventh proposition: PASS.

Result: PASS.

## 5. Proposition 4 - CMO existence and uniqueness

Set $Z_M=D_m-S_m$. Under the Phase 6 conditions, $Z_M$ is continuous,
$Z_M(0)>0$, and $Z_M(p_m)<0$ for all sufficiently high prices. The
intermediate value theorem gives a root. Weakly decreasing demand minus
strictly increasing supply is strictly decreasing, so there can be only one.

Boundary checks:

- pre-MAH study demand is zero but background demand supports $p_m^0>0$: PASS.
- deterministic micro choices do not invalidate aggregate continuity under
  the zero-tie and domination conditions: PASS.
- only one scalar market is cleared: PASS.

Result: PASS.

## 6. Proposition 5 - scarcity attenuation

At the pre-MAH root, background demand equals supply. Evaluating post-MAH
excess demand at the same price gives

$$
Z_1(p_m^0)=D_m^{\mathrm{MAH}}(p_m^0;1)\geq0.
$$

Since $Z_1$ is strictly decreasing and $Z_1(p_m^1)=0$, it follows that
$p_m^1\geq p_m^0$, strictly when the displayed demand is positive.

Entrusted value has derivative $-b(m)<0$. Thus
$W_i^E(p_m^1)\leq W_i^E(p_m^0)$ pointwise. The positive-part function is
monotone, so integration yields

$$
0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir}.
$$

The advancement increment is strictly increasing in the nonnegative value
gain for every $\nu>0$, which yields the corresponding $\Delta x_i$ bounds.

Boundary checks:

- perfectly elastic supply at a common price removes attenuation: PASS.
- zero study demand permits $p_m^1=p_m^0$: PASS.
- high price can eliminate the new gain but cannot lower $W_i^0$: PASS.
- the result does not assume a direct policy reduction in $p_m$: PASS.

Result: PASS.

## 7. Proposition 6 - observed outcomes

Each outcome equals planning-stage intensity $a_ix_i^*$ times an expected
policy-invariant realization probability and deterministic route indicator.
The units are projects per cohort. The class expression multiplies the common
control by $\rho_g$ and integrates under $F_g$; it creates no class-specific
control.

Let $Y^h=a_ix_i^hQ^h$. Then

$$
Y^1-Y^0
=a_i(x_i^1-x_i^0)Q^0+a_ix_i^1(Q^1-Q^0),
$$

obtained by adding and subtracting $a_ix_i^1Q^0$. This is an exact
advancement-versus-route-composition decomposition, not a causal
identification claim.

Boundary checks:

- unchanged advancement and route indicators give zero outcome change: PASS.
- $M$ never changes $s(q)$ or $s_g(q)$ directly: PASS.
- either novelty class may have a zero response while the other is positive:
  PASS.
- observed holder--producer separation follows advancement and route choice in
  timing: PASS.
- planning-stage arrival is broader than pure clinical effort and is not
  patent generation: PASS.

Result: PASS.

## 8. Global count, dimensions and scope

- Numbered substantive propositions: 6.
- Novelty corollaries: 1.
- Extra substantive propositions: 0.
- New controls or markets: 0.
- Fixed-price comparisons are separated from equilibrium-price comparisons.
- Every derivative states held-fixed objects.
- Every strict conclusion has a sufficient positive-measure, crossing, demand,
  or curvature condition.
- All new value objects have units $\mathsf C/\mathsf P$; prices have
  $\mathsf C/\mathsf B$; advancement changes have $\mathsf X$; observed
  outcomes have $\mathsf P$ per cohort.

Independent review conclusion: no P0 and no P1 detected in the Phase 8
proposition stack.
