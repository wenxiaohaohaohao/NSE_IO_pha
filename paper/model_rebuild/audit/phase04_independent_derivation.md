# Phase 4 Independent Sorting Derivation

Status: APPROVED

This record re-derives the Phase 4 route comparison independently of the
exposition in the formal module. It treats \(p_m\) as fixed and conjectured;
CMO market clearing and equilibrium-price feedback remain outside Phase 4.

## 1. Route-value accounting

The four feasible alternatives are
\[
W_i^I=s(q)R(q,c_I(m,k_i))-F_I(m,k_i),
\]
\[
W_i^E=s(q)R(q,c_E(m))-F_E(m)-p_m b(m)-\mu_E-\tau_E(M),
\]
\[
W^T=T(q,m),\qquad W^A=0.
\]

The operating-value kernel \(R\) contains operating cost through its marginal
cost argument. The real readiness costs, capacity payment, retained-holder
burden and institutional wedge are subtracted outside \(R\), each exactly
once. Hence the Phase 2 no-double-counting condition is preserved.

Result: PASS for dimensions and unique accounting locations.

## 2. Deterministic choice and binary-policy effect

The optimized value is the maximum of the four route values, and the route is
their deterministic argmax. Continuous heterogeneity makes exact ties a
measure-zero event. No random utility, logit share or inclusive-value object
is introduced.

At \(M=0\), \(\tau_E(0)=+\infty\), so \(W_i^E=-\infty\). At fixed \(p_m\),
the reform gain is therefore
\[
\max\{W_i^I,W_i^E(1),W^T,0\}-\max\{W_i^I,W^T,0\}.
\]
It equals zero whenever \(W_i^E(1)\) does not exceed the best pre-reform
alternative. The model therefore permits a zero value and zero route response.

Result: PASS for deterministic choice and the required zero-effect case.

## 3. Value-gap derivative

Subtracting entrusted value from internal value gives
\[
\Delta_{IE}
=s(q)\{R(q,c_I)-R(q,c_E)\}-F_I+F_E+p_m b+\mu_E+\tau_E.
\]
Holding \(q,m,M,p_m\) fixed, only \(c_I(m,k_i)\) and \(F_I(m,k_i)\)
depend on \(k_i\). Hence
\[
\Delta_{IE,k}
=s(q)R_c(q,c_I)c_{I,k}-F_{I,k}.
\]
Because \(s(q)\geq0\), \(R_c<0\), \(c_{I,k}<0\), and \(F_{I,k}<0\),
the first term is weakly positive and the second is strictly positive.
Thus \(\Delta_{IE,k}>0\), including the boundary \(s(q)=0\).

Result: PASS for differentiation, fixed objects and strict sign.

## 4. Existence, uniqueness and conditional sorting

For a finite entrusted barrier, assume continuity and the endpoint signs
\[
\lim_{k\downarrow\underline{k}(m)}\Delta_{IE}(k)<0,\qquad
\lim_{k\to\infty}\Delta_{IE}(k)>0.
\]
The intermediate value theorem gives a root. Strictly positive
\(\Delta_{IE,k}\) makes that root unique. Calling it \(k^*\), the sign of the
gap implies \(E\) below the cutoff and \(I\) above it.

This conclusion is conditional on both manufacturing routes dominating
\(T\) and \(A\). If either outside option dominates, the \(I/E\) cutoff does
not determine the realized route. If \(M=0\), the entrusted barrier is
infinite and there is no finite interior \(I/E\) cutoff.

Result: PASS for the theorem logic, outside-option boundary and \(M=0\)
boundary.

## 5. Implicit derivatives

For a locally varying finite \(\tau_E\),
\[
\Delta_{IE,\tau_E}=1.
\]
For a locally varying fixed \(p_m\),
\[
\Delta_{IE,p_m}=b(m)>0.
\]
The implicit-function theorem and \(\Delta_{IE,k}>0\) give
\[
\frac{\partial k^*}{\partial\tau_E}
=-\frac{1}{\Delta_{IE,k}}<0,\qquad
\frac{\partial k^*}{\partial p_m}
=-\frac{b(m)}{\Delta_{IE,k}}<0.
\]
Therefore a lower finite institutional barrier raises \(k^*\) and expands the
region \(k_i<k^*\) choosing entrusted production, whereas a higher fixed CMO
price contracts it.

These are not derivatives with respect to the binary indicator \(M\).
The price derivative holds \(p_m\) fixed as a conjectured price and is not a
general-equilibrium derivative through \(p_m^*\).

Result: PASS for the implicit derivatives and comparative-static boundary.

## 6. Scope and non-tautology

The sorting result is not assumed: it is obtained from technology derivatives,
the value gap and explicit endpoint crossing. The crossing conditions are
sufficient conditions rather than restatements of the cutoff conclusion.
Transfer and abandonment remain valid choices. Phase 4 introduces no
advancement optimization, route share, CMO clearing, entry, welfare or
manuscript revision.

Independent review conclusion: no P0 and no P1 detected in the Phase 4 route
value and sorting block.
