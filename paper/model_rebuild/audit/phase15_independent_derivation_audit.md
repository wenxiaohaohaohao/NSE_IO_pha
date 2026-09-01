# Phase 15 Independent Derivation Audit

## 1. Audit scope

The audit independently re-derives the pricing, project-advancement and
supplier FOCs/SOCs; the route and equilibrium derivatives; the binary finite
comparisons; all mandatory boundaries; dimensions; dependency parents; and
the compiled full-draft structure. It treats the Phase 14 four-block
assumption ledger as authoritative.

## 2. FOC, SOC and corner reconstruction

### Product pricing

For
\[
\pi(p)=Aq(p-c)p^{-\varepsilon},
\]
\[
\pi_p=Aq p^{-\varepsilon-1}[(1-\varepsilon)p+\varepsilon c].
\]
The interior FOC gives
\(p^*=\varepsilon c/(\varepsilon-1)>c\). At that point,
\[
\pi_{pp}
=Aq(1-\varepsilon)(p^*)^{-\varepsilon-1}<0.
\]
Profit is zero at \(p=c\), positive at the candidate, and tends to zero at
infinity, so the candidate is the unique global maximizer.

Substitution gives
\[
\pi(q,c)=\frac{Aq}{\varepsilon}
\left(\frac{\varepsilon}{\varepsilon-1}c\right)^{1-\varepsilon},
\]
hence \(p_c^*=\varepsilon/(\varepsilon-1)\),
\(\pi_q=\pi/q\), and \(\pi_c=(1-\varepsilon)\pi/c\). Dividing by
\(1-\beta\varphi>0\) gives the stated \(R_q,R_c\).

### Project advancement

For
\[
V(x)=\beta a_i x\Omega_i-\frac{\kappa}{1+\nu}x^{1+\nu},
\]
the KKT residual is
\(\kappa x^\nu-\beta a_i\Omega_i\). When \(\Omega_i>0\), the FOC gives
\[
x_i^*=(\beta a_i\Omega_i/\kappa)^{1/\nu}.
\]
The interior SOC is \(-\kappa\nu x^{\nu-1}<0\), and strict convexity of
the cost gives global uniqueness. At \(\Omega_i=0\), the unique corner is
\(x_i^*=0\). Log differentiation at the interior yields exactly
\[
x_\Omega^*=\frac{x^*}{\nu\Omega},\quad
x_a^*=\frac{x^*}{\nu a},\quad
x_\kappa^*=-\frac{x^*}{\nu\kappa}.
\]
Combining the first expression with the deterministic envelope
\(\Omega_{p_m}=-\chi_i^E\) gives
\(x_{p_m}^*=-x_i^*\chi_i^E/(\nu\Omega_i)\).

### Qualified-capacity supply

Supplier profit is \(p_ms-\Psi(s;z)\). For \(p_m>0\), the FOC is
\(p_m=\Psi_s\) and the SOC is \(-\Psi_{ss}<0\). The boundary
\(\Psi_s(0;z)=0\), strict convexity and unbounded marginal cost give the
unique interior solution. Implicit differentiation gives
\[
s_p^*=1/\Psi_{ss}>0,\qquad
s_z^*=-\Psi_{sz}/\Psi_{ss}>0.
\]
At \(p_m=0\), \(s_j^*=0\) is the unique corner.

## 3. Route and market derivatives

The route-gap derivative is
\[
\Delta_{IE,k}=sR_c c_{I,k}-F_{I,k}.
\]
The first term is weakly positive, not always strictly positive, because it
vanishes when \(s(q)=0\). The second is strictly positive. Therefore the sum
is strictly positive. This confirms the proposition and resolves the one P1
wording defect found in the earlier proof.

At a finite crossing,
\[
dk^*=-\frac{d\tau_E+b(m)\,dp_m}{\Delta_{IE,k}},
\]
which gives the two fixed-argument cutoff derivatives. This calculation is
not valid at \(\tau_E(0)=+\infty\) and is not a derivative with respect to
binary \(M\).

At differentiability points, product differentiation of
\(D_m^{\mathrm{MAH}}=\int a_ix_i^*\chi_i^E\,dH\) gives the two terms in
`eq:p15-study-demand-slope`. Both are weakly nonpositive. At route cutoffs the
classical derivative may fail, but atomless aggregation and monotonicity retain
the global weak decrease.

For a direct continuous perturbation of demand/supply at a fixed price,
total differentiation of \(D_m(p_m)-S_m(p_m)=0\) yields
\[
(D_{m,p}-S_{m,p})dp_m^*+dD_m-dS_m=0.
\]
Because \(S_{m,p}-D_{m,p}>0\), rearrangement gives
`eq:p15-equilibrium-ift` with the correct sign and price units.

## 4. Binary policy and equilibrium-price audit

Adding route \(E\) produces
\[
W_i^1-W_i^0=[W_i^E-W_i^0]_+.
\]
Integration gives a nonnegative fixed-price
\(\Delta\Omega_i\); the strictly increasing advancement mapping gives a
nonnegative finite \(\Delta x_i\). No \(M\)-derivative is used.

At the pre-MAH price,
\[
Z_1(p_m^0)=D_m^{\mathrm{MAH}}(p_m^0;1)\geq0.
\]
Strict decrease of \(Z_1\) gives \(p_m^1\geq p_m^0\), with strict inequality
exactly when this study demand is positive. Since entrusted value falls
pointwise in \(p_m\),
\[
0\leq\Delta\Omega_i^{eq}\leq\Delta\Omega_i^{dir},
\qquad
0\leq\Delta x_i^{eq}\leq\Delta x_i^{dir}.
\]
These are equilibrium attenuation bounds, not a direct policy-price channel.

For retained outcomes, if \(E\) does not beat the old maximum, the old route
choice remains; if it beats the old maximum, the new route is retained.
Therefore \(Q_i^{ret,1}\geq Q_i^{ret,0}\) almost surely. Together with
\(x_i^1\geq x_i^0\), both terms in the exact retained-outcome decomposition
are nonnegative. Reassignment from \(I\) to \(E\) changes observed separation
but not the retained-route indicator.

## 5. Dimension audit

| Expression | Units | Result |
|---|---|---|
| \(p_c^*\) | \((\mathsf C/\mathsf Y)/(\mathsf C/\mathsf Y)=1\) | PASS |
| \(R_c\) | currency per \(\mathsf C/\mathsf Y\) | PASS |
| \(k_{\tau_E}^*\) | \(\mathsf K/\mathsf C\) | PASS |
| \(k_{p_m}^*\) | \(\mathsf K/(\mathsf C/\mathsf B)\) | PASS |
| \(x_\Omega^*\) | \(\mathsf X/\mathsf C\) per project normalization | PASS |
| \(s_{j,p_m}^*\) | \(\mathsf B/(\mathsf C/\mathsf B)\) | PASS |
| \(dp_m^*=(dD-dS)/(S_p-D_p)\) | \(\mathsf C/\mathsf B\) | PASS |
| \(\Delta\Lambda_i^{plan}=a_i\Delta x_i\) | \(\mathsf P\) | PASS |

No product price \(p\) is confused with CMO price \(p_m\).

## 6. Mandatory boundary audit

| Boundary | Re-derived result | Verdict |
|---|---|---|
| \(k_i\to\infty\) | \(\Delta_{IE}\) increases; upper crossing weakly favors \(I\) relative to \(E\) | PASS |
| \(k_i<\underline{k}(m)\) | \(F_I=+\infty\), \(W_i^I=-\infty\) | PASS |
| \(M=0\) | \(E\) unavailable; \(\chi_i^E=D_m^{MAH}=0\) | PASS |
| \(p_m\to\infty\) | \(W_i^E\to-\infty\), optimized value converges to \(W_i^0\) | PASS |
| \(W_i^E\leq W_i^0\) everywhere | \(\Delta\Omega_i=\Delta x_i=0\) | PASS |
| perfectly elastic CMO supply | common price; equilibrium attenuation disappears | PASS |
| \(\nu=1\) | \(x_i^*=(\beta a_i/\kappa)\Omega_i\) | PASS |
| \(\rho_O=0\) | class \(O\) contributes zero | PASS |
| \(\rho_{\mathrm{Inc}}=0\) | class \(\mathrm{Inc}\) contributes zero | PASS |
| class ordering | reverse-support construction reverses the ranking | PASS |

## 7. Dependency, scope, terminology, and rendering

- The comparative-static module has 20 unique equation labels.
- The dependency map has exactly 20 Phase 15 rows with the same labels.
- Each of the six result groups states its object/held-fixed variables,
  algebra, sign conditions, interpretation, prediction and zero-effect case.
- Binary policy, finite wedge, fixed candidate price and equilibrium price are
  distinct.
- One common \(x_i\) remains the only advancement control.
- The result concerns project advancement, commercialization organization,
  CMO capacity/price, or realized products as explicitly stated.
- No patent outcome, upstream-research control, welfare object, entry margin,
  logit, inclusive value or continuous implementation index enters baseline.
- Manuscript files are unchanged from the locked base.
- The full draft compiles in two passes with no fatal error, undefined
  reference, duplicate label, overfull box or underfull box.
- Visual inspection of the title/contents, propositions, comparative statics,
  mandatory boundaries, empirical interfaces and final extension-quarantine
  page finds no clipped, overlapping or unreadable content.

## 8. Result

The independent Phase 15 derivation audit finds no P0. The one P1 wording
defect found during re-derivation has been corrected and recompiled. No open
Phase 15 P1 remains.
