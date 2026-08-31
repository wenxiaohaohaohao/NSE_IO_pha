# Phase 3 Independent Technology Audit

Status: APPROVED

This record reviews the Phase 3 technology block independently of its exposition order. It does not construct route payoffs or choose a route.

## 1. Internal technology

For the feasible domain \(k_i\geq\underline{k}(m)\):

- \(c_I(m,k_i)>0\) has units \(\mathsf C/\mathsf Y\);
- \(c_{I,m}>0\) means more demanding manufacturing raises internal marginal cost;
- \(c_{I,k}<0\) means higher internal capability lowers that marginal cost;
- finite \(F_I(m,k_i)\) has units \(\mathsf C\) per project;
- \(F_{I,m}>0\) and \(F_{I,k}<0\) have the analogous setup-cost meanings.

For \(k_i<\underline{k}(m)\), \(F_I=+\infty\). This is sufficient to exclude internal production from any later finite-value maximization without retaining the old binary feasibility object.

Result: PASS for signs, units, feasible domain, and the mandatory low-capability boundary.

## 2. Entrusted technology

The qualified external producer uses \(c_E(m)>0\), measured in \(\mathsf C/\mathsf Y\). The kernel is independent of developer capability \(k_i\). The physical capacity requirement \(b(m)>0\) is measured in \(\mathsf B\) per project and satisfies \(b'(m)>0\).

The real readiness cost \(F_E(m)\geq0\) and retained holder burden \(\mu_E\geq0\) are both currency per project. No derivative sign for \(c_E\) or \(F_E\) has been added because the controlling specification does not require one.

Result: PASS for exact scope and no unapproved sign restriction.

## 3. Accounting separation

The technology objects have four separate roles:

| Object | Role | Later accounting location |
|---|---|---|
| \(c_E(m)\) | technological marginal cost | enters \(R(q,c_E)\) through operating cost |
| \(b(m)\) | physical qualified-capacity requirement | later multiplied once by \(p_m\) |
| \(F_E(m)\) | real transfer/validation/readiness cost | later subtracted once outside \(R\) |
| \(\mu_E\) | residual holder-side burden | later subtracted once outside \(R\) |
| \(\tau_E(M)\) | institutional barrier | later subtracted once from route \(E\) |

In particular, \(c_E(m)\) does not contain \(p_m b(m)\). This preserves the Phase 2 no-double-counting restriction.

Result: PASS for dimensions and accounting.

## 4. Organizational distinction

- Route \(I\): developer is holder and manufacturer; own \(k_i\) matters.
- Route \(E\): developer remains authorization holder; qualified external producer manufactures; holder responsibility remains.
- Route \(T\): non-retained transfer/out-license outside option; not equivalent to \(E\).

Result: PASS for the retained-authorization red line.

## 5. Policy and scarcity boundary

Across \(M=0\) and \(M=1\), the technology functions and characteristics are unchanged. Only \(\tau_E(M)\) changes, with \(\tau_E(0)=+\infty\) and \(\tau_E(1)=\bar\tau_E<+\infty\). The residual burden \(\mu_E\) is not removed.

Phase 3 defines no CMO supply curve, aggregate demand, market-clearing price, or policy-induced scarcity relief. The price \(p_m^*\) remains an endogenous Phase 6 object.

Result: PASS for the single policy wedge and deferred scarcity mechanism.

## 6. Crosswalk boundary

The local table maps only manufacturing-related legacy objects. It expressly defers the exhaustive equation/proposition/paragraph/calibration trace to Phase 12. No old manuscript or model-note file is modified.

Independent review conclusion: no P0 and no P1 detected in the Phase 3 technology block.
