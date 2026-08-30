# Phase 2 Independent Derivation Record

Status: `APPROVED`

This record recomputes the Phase 2 results independently of the prose order in `02_demand_profit_derivation.tex`. It introduces no new model object.

## 1. Pricing derivative and unique stationary point

For fixed $A>0$, $q>0$, $c>0$, and $\varepsilon>1$, define the conditional objective only for this calculation:

$$
(p-c)Aq p^{-\varepsilon},\qquad p\geq c.
$$

Direct differentiation gives

$$
Aq p^{-\varepsilon-1}\{\varepsilon c-(\varepsilon-1)p\}.
$$

The positive factor never changes sign. The bracket is strictly decreasing in $p$, is $c>0$ at $p=c$, and has the unique zero

$$
p^*=\frac{\varepsilon}{\varepsilon-1}c>c.
$$

Therefore the objective rises on $[c,p^*)$ and falls on $(p^*,\infty)$. The lower-bound value is zero, the value at $p^*$ is positive, and the objective converges to zero as $p\to\infty$. This proves the unique global maximum without relying only on the local SOC.

At the stationary point, a second differentiation gives

$$
-Aq(\varepsilon-1)(p^*)^{-\varepsilon-1}<0.
$$

Result: `PASS` for FOC, SOC, feasibility, uniqueness, and both price-domain boundaries.

## 2. Profit substitution

The optimized markup is $p^*-c=c/(\varepsilon-1)$. Substitution yields

$$
\pi(q,c)
=\frac{c}{\varepsilon-1}Aq
\left(\frac{\varepsilon c}{\varepsilon-1}\right)^{-\varepsilon}
=Aq\frac{(\varepsilon-1)^{\varepsilon-1}}{\varepsilon^\varepsilon}c^{1-\varepsilon}.
$$

Log differentiation, used as an independent check, gives

$$
d\log\pi=d\log q +(1-\varepsilon)d\log c
$$

when $A$ and $\varepsilon$ are fixed. Hence

$$
\pi_q=\pi/q>0,\qquad \pi_c=(1-\varepsilon)\pi/c<0.
$$

Result: `PASS` for algebra and signs.

## 3. Present value

Conditional on commercial activation, period-$t$ profit is received with discounted probability $(\beta\varphi)^t$. Since $\beta\in(0,1)$ and $\varphi\in[0,1]$, $|\beta\varphi|<1$. Thus

$$
R(q,c)=\pi(q,c)\sum_{t=0}^{\infty}(\beta\varphi)^t
=\frac{\pi(q,c)}{1-\beta\varphi}.
$$

The denominator is positive and independent of $q,c$, so

$$
R_q=R/q>0,\qquad R_c=(1-\varepsilon)R/c<0.
$$

Result: `PASS` for convergence and derivatives.

## 4. Units and accounting

| Object | Units | Check |
|---|---|---|
| $p,c$ | $\mathsf C/\mathsf Y$ | same units in $p-c$ |
| $y$ | $\mathsf Y$ per operating period | demand quantity |
| $(p-c)y$ and $\pi$ | $\mathsf C$ per operating period | margin times quantity |
| $\beta,\varphi$ | dimensionless | valid geometric factor |
| $R$ | $\mathsf C$ per commercially active product | discounted operating stream |

Only $c$ is subtracted inside operating profit. Route fixed costs and institutional burdens are not present in $R$. The separate realization probability $s(q)$ is not multiplied into the conditional PV in Phase 2. This prevents both route-cost and probability double counting.

Result: `PASS` for dimensions and accounting boundary.

## 5. Boundary and interpretation checks

| Check | Result |
|---|---|
| $q\downarrow0$ | $\pi,R\downarrow0$ |
| $c\to\infty$ | $\pi,R\downarrow0$ because $\varepsilon>1$ |
| $\varphi=0$ | $R=\pi$ |
| $\varphi=1$ | $R=\pi/(1-\beta)$, finite for $\beta<1$ |
| binary $M$ | no derivative taken and no direct Phase 2 effect asserted |
| product price versus CMO price | $p,p^*$ are distinct from $p_m,p_m^*$ |
| policy boundary | $M$ does not shift $A,q,\varepsilon,\beta,\varphi$ |

Independent review conclusion: no P0 and no P1 detected in the Phase 2 derivation.
