# Phase 5 Independent Advancement Derivation

Status: APPROVED

This record re-derives the Phase 5 project-advancement problem independently
of the formal module. The CMO price is fixed and conjectured throughout.

## 1. Units and primitives

The common control \(x_i\) has units \(\mathsf X\). Predetermined
project-advancement productivity \(a_i\) has units
\(\mathsf P/\mathsf X\), so
\(\lambda_i^{\mathrm{plan}}=a_ix_i\) has units \(\mathsf P\).

The cost
\[
C_X(x_i)=\frac{\kappa}{1+\nu}x_i^{1+\nu}
\]
has units \(\mathsf C\) when
\(\kappa\) has units \(\mathsf C/\mathsf X^{1+\nu}\).
Its marginal cost has units \(\mathsf C/\mathsf X\).

Expected optimized value \(\Omega_i\) has units
\(\mathsf C/\mathsf P\). Therefore \(a_i\Omega_i\) has units
\(\mathsf C/\mathsf X\), matching \(C_X'(x_i)\), and
\(\beta a_ix_i\Omega_i\) has units \(\mathsf C\).

Result: PASS for dimensional consistency.

## 2. Expected value and nonnegativity

The Phase 4 optimized value includes abandonment with value zero. Hence
\(W_i(q,m;M,p_m)\geq0\) pointwise. Measurability and integrability imply
\[
0\leq\Omega_i(M,p_m)
=\int W_i(q,m;M,p_m)\,dF(q,m)<+\infty.
\]
The expectation is over a downstream project draw and is fixed when an
individual developer chooses \(x_i\) at the conjectured price.

Result: PASS for the expectation, conditioning and zero-value boundary.

## 3. Optimization and KKT conditions

For fixed \(M,p_m,a_i,k_i\), the objective is
\[
\beta a_ix_i\Omega_i
-\frac{\kappa}{1+\nu}x_i^{1+\nu}.
\]
Its first derivative is
\[
\beta a_i\Omega_i-\kappa x_i^\nu.
\]
The lower-bound KKT conditions can be written as
\[
x_i\geq0,\quad
\kappa x_i^\nu-\beta a_i\Omega_i\geq0,\quad
x_i(\kappa x_i^\nu-\beta a_i\Omega_i)=0.
\]

If \(\Omega_i>0\), \(x_i=0\) violates the second KKT inequality, so the
solution is interior and satisfies the FOC. If \(\Omega_i=0\), the unique
solution is the corner \(x_i=0\).

Result: PASS for KKT signs and both cases.

## 4. SOC, existence and uniqueness

For \(x_i>0\), the second derivative is
\[
-\kappa\nu x_i^{\nu-1}<0.
\]
For every \(\nu>0\), the function \(x_i^{1+\nu}\) is strictly convex on
the nonnegative domain. The objective is therefore strictly concave even
when its second derivative is zero at the boundary for \(\nu>1\). The
superlinear cost dominates the linear benefit as \(x_i\to\infty\), which
ensures existence. Strict concavity gives uniqueness.

Solving the FOC and including the corner gives
\[
x_i^*(M,p_m)
=
\left[
\frac{\beta a_i\Omega_i(M,p_m)}{\kappa}
\right]^{1/\nu}.
\]
The term inside brackets has units \(\mathsf X^\nu\), so the optimizer has
units \(\mathsf X\). At \(\nu=1\), the cost is quadratic and
\(x_i^*=\beta a_i\Omega_i/\kappa\).

Result: PASS for SOC, global optimization, units and the mandatory
\(\nu=1\) boundary.

## 5. Binary reform channel at fixed price

At fixed \(p_m\), post-MAH route opportunities weakly contain pre-MAH
opportunities. Therefore
\[
W_i(q,m;1,p_m)-W_i(q,m;0,p_m)\geq0
\]
pointwise and
\[
\Omega_i(1,p_m)-\Omega_i(0,p_m)\geq0.
\]
The optimizer is strictly increasing in \(\Omega_i\) on its positive domain
and strictly order preserving on the full nonnegative domain. Hence the
binary reform raises \(x_i^*\) strictly if and only if it raises expected
optimized route value strictly. A weak or zero route-value gain produces a
weak or zero advancement response.

This is a finite comparison in binary \(M\), not a derivative with respect to
\(M\), and it holds at fixed \(p_m\), not after the Phase 6 equilibrium-price
feedback.

Result: PASS for the causal channel, strict condition and zero-effect case.

## 6. Innovation and capability boundaries

- There is one common \(x_i\), not \(x_{ig}\), \(x_i^R\), or \(x_i^D\).
- \(x_i\) is broader than pure clinical-development effort but is not patent
  applications, patent-generating effort, basic research or upstream
  scientific discovery.
- \(M\) shifts neither \(a_i\) nor advancement-cost primitives.
- \(k_i\) affects \(\Omega_i\) through manufacturing organization; it enters
  neither \(a_ix_i\) nor \(C_X(x_i)\).
- The derivation makes no claim about patent applications or novelty-class
  rankings.

Result: PASS for the v1.2 object and red-line boundaries.

## 7. Downstream value gap

The appendix accounting identity
\[
K_i=B_i+\Omega_i
\]
implies \(K_i-B_i=\Omega_i\). Substitution into the interior FOC yields
\[
C_X'(x_i)=\beta a_i(K_i-B_i).
\]
This is exactly the downstream project-value gap. \(B_i\) and \(K_i\) need
not be recursive states, and the derivation adds no Bellman equation.

Result: PASS for the Akcigit-style interpretation and unified \(C_X\)
notation.

Independent review conclusion: no P0 and no P1 detected in the Phase 5
project-advancement block.
