# Codex Revision Notes
## Integrating a Financing Friction into the MAH Baseline Model

**Target project:** `Regulatory Separation and Pharmaceutical Innovation: Evidence from China’s MAH Reform`

**Current baseline:** heterogeneous developers \((a_i,k_i)\), one common project-advancement control \(x_i\), deterministic route choice \(I/E/T/A\), route-independent downstream realization \(s(q)\), and one endogenous qualified-manufacturing-capacity market with price \(p_m^*\).

**Revision objective:** add a **commercialization-stage financing friction** that makes it costly for research-oriented developers to finance vertical integration before MAH, while preserving the paper’s core mechanism as an **organizational/complementary-asset reform**, not turning the paper into a finance paper and not importing Gu-style research-versus-development reallocation.

---

# 0. Executive decision

Implement the financing friction in the **baseline**, but only in the following form:

\[
\boxed{
\text{financing friction affects whether a developer can finance a commercialization organization}
}
\]

Do **not** model MAH as increasing financing supply.

Do **not** impose a Gu-style budget constraint such as

\[
x_i^R+x_i^D\le B_i,
\]

and do **not** let financing capacity directly constrain \(x_i\).

The intended mechanism is:

\[
\boxed{
\text{MAH lowers the amount of vertical-integration capital that must be financed
in order to retain commercialization rights.}
}
\]

The causal chain must remain:

\[
M
\rightarrow
\text{availability of retained entrusted manufacturing}
\rightarrow
\text{commercialization feasibility/value}
\rightarrow
\Omega_i
\rightarrow
x_i^*.
\]

Financing capacity determines **who is exposed to this institutional change**, but MAH must **not** directly change financing capacity.

---

# 1. Economic interpretation to preserve

The revised model should distinguish three developer characteristics:

\[
\theta_i=(a_i,k_i,\ell_i).
\]

Interpret them as follows:

- \(a_i>0\): research/project-advancement capability.
- \(k_i>0\): pre-existing internal manufacturing capability/know-how.
- \(\ell_i>0\): predetermined financing/liquidity capacity available for commercialization-stage commitments.

Use a joint distribution

\[
(a_i,k_i,\ell_i)\sim H(a,k,\ell).
\]

Important:

- \(a_i\) is **not** financing capacity.
- \(k_i\) is **not** financing capacity.
- \(\ell_i\) is **not** changed by MAH.
- Do not impose independence unless required for a proof. Allow arbitrary correlation in the baseline distribution \(H\).

The revised economic story is:

> Before MAH, retaining the product and commercializing it typically required internal production. For a developer with weak pre-existing manufacturing capability, this required a large up-front commitment to build or acquire compliant production capability. Financing frictions could therefore make vertical integration infeasible even when the project had positive NPV. MAH creates a legally recognized retained-outsourcing route with a lower up-front capital requirement. The reform does not relax the developer’s financing constraint; it changes the organizational technology so that less internalization capital must be financed.

This sentence should guide all notation and propositions.

---

# 2. Critical guardrail: do not copy Gu’s finance mechanism

The paper must remain distinct from Gu’s mechanism.

## Forbidden baseline structure

Do not introduce:

\[
x_i^R,\qquad x_i^D,
\]

with a resource constraint

\[
x_i^R+x_i^D\le \ell_i.
\]

Do not derive

\[
x_i^D\uparrow,\qquad x_i^R\downarrow
\]

after MAH.

Do not make patent applications a baseline endogenous outcome.

Do not make financing the direct determinant of the advancement FOC.

The current one-control advancement block must remain:

\[
\max_{x_i\ge0}
\left\{
\beta a_ix_i\Omega_i
-
\frac{\kappa}{1+\nu}x_i^{1+\nu}
\right\},
\]

with

\[
x_i^*
=
\left[
\frac{\beta a_i\Omega_i}{\kappa}
\right]^{1/\nu}.
\]

Financing affects \(x_i^*\) **only through the optimized commercialization value \(\Omega_i\)**.

---

# 3. Replace the current hard internal-feasibility convention

The current baseline uses a hard technological convention such as

\[
F_I(m,k_i)=+\infty
\quad\text{when}\quad
k_i<\underline k(m).
\]

This should be removed or substantially softened in the baseline.

Reason: a developer with little pre-existing manufacturing capability is not literally incapable of internalizing forever; with enough financing it can build, acquire, validate, or upgrade compliant capacity.

Instead, introduce a finite **up-front financing requirement** for internal production.

---

# 4. Add commercialization financing requirements

Introduce two new primitives.

## 4.1 Internal route financing requirement

Let

\[
J_I(m,k_i)>0
\]

be the up-front financing/liquidity requirement needed to organize internal manufacturing.

Assume:

\[
J_{I,m}(m,k_i)>0,
\qquad
J_{I,k}(m,k_i)<0.
\]

Interpretation:

- more manufacturing-intensive projects require more up-front capital;
- developers with stronger pre-existing manufacturing capability require less additional financing.

Do **not** treat \(J_I\) as an extra cost if the current route-value cost \(F_I\) already includes the corresponding real resource cost.

The clean accounting convention should be:

- \(F_I(m,k_i)\): total real setup/readiness cost entering project value;
- \(J_I(m,k_i)\): the portion or liquidity commitment that must be financeable ex ante.

Thus \(J_I\) is a **feasibility/liquidity requirement**, not an additional subtraction from \(W_I\).

State explicitly that

\[
0<J_I(m,k_i)\le F_I(m,k_i)
\]

is a possible interpretation, but do not make this inequality essential unless needed.

Internal production is financially feasible iff

\[
J_I(m,k_i)\le \ell_i.
\]

Define the finance-adjusted internal value:

\[
\widetilde W_i^I(q,m)=
\begin{cases}
s(q)R(q,c_I(m,k_i))-F_I(m,k_i),
&
J_I(m,k_i)\le \ell_i,\\
-\infty,
&
J_I(m,k_i)>\ell_i.
\end{cases}
\]

The technology signs should remain:

\[
c_{I,m}>0,\qquad c_{I,k}<0,
\]

\[
F_{I,m}>0,\qquad F_{I,k}<0.
\]

The model should no longer need a blanket \(k_i<\underline k(m)\Rightarrow W_I=-\infty\) assumption.

If a minimal physical feasibility condition is retained for a narrow subset of projects, clearly separate it from financial infeasibility. Do not let the hard physical cutoff carry the main mechanism.

---

## 4.2 Entrusted-route financing requirement

Introduce

\[
J_E(m)>0
\]

as the up-front financing/liquidity requirement associated with retained entrusted manufacturing.

Examples in the interpretation:

- technology transfer and validation;
- quality-system preparation;
- initial CMO contracting/commitment;
- holder-side compliance preparation.

Assume:

\[
J_E'(m)>0.
\]

Do not set \(J_E=0\).

Do not add \(J_E\) as another cost if \(F_E\), \(p_mb(m)\), and \(\mu_E\) already account for the real monetary costs of the entrusted route.

The finance-adjusted entrusted value is:

\[
\widetilde W_i^E(q,m;M,p_m)=
\begin{cases}
s(q)R(q,c_E(m))
-F_E(m)
-p_mb(m)
-\mu_E
-\tau_E(M),
&
J_E(m)\le \ell_i,\\
-\infty,
&
J_E(m)>\ell_i.
\end{cases}
\]

Keep:

\[
\tau_E(0)=+\infty,\qquad
\tau_E(1)=\bar\tau_E<+\infty.
\]

Thus pre-MAH unavailability continues to be encoded by the institutional wedge, not by the financing condition.

Important:

\[
M\nrightarrow \ell_i,
\qquad
M\nrightarrow J_I,
\qquad
M\nrightarrow J_E.
\]

The policy changes only the legal/institutional availability of route \(E\).

---

# 5. Capital-requirement ordering: use a local/relevant condition, not a universal assumption

Do **not** assume globally that entrusted production is always cheaper to finance than internal production.

Instead introduce a proposition-specific condition:

\[
J_E(m)<J_I(m,k_i)
\]

for the **research-oriented / low-internal-capability region relevant to MAH**.

This is economically sharper.

For high-\(k_i\) developers, internal production may require little additional financing, so the inequality need not hold.

The key institutional interpretation is:

> MAH creates a lower-capital retained commercialization route particularly for developers that lack pre-existing manufacturing capability.

---

# 6. Update deterministic route choice

Keep the same common route labels:

\[
r\in\{I,E,T,A\}.
\]

Use finance-adjusted route values:

\[
\widetilde W_i(q,m;M,p_m)
=
\max
\left\{
\widetilde W_i^I,
\widetilde W_i^E,
W^T,
0
\right\}.
\]

Define:

\[
r_i^*(q,m;M,p_m,\ell_i)
\in
\arg\max_{r\in\{I,E,T,A\}}
\widetilde W_i^r.
\]

Do not add a logit shock.

Do not add a financing choice.

Do not add borrowing, debt contracts, VC bargaining, bank screening, or endogenous interest rates.

This is still a partial-equilibrium organizational-choice model.

---

# 7. Preserve and update the I/E sorting result

Conditional on both routes being financially feasible, the existing internal-minus-entrusted value gap remains:

\[
\Delta_{IE}(k_i)
=
W_i^I-W_i^E.
\]

The derivative should remain:

\[
\frac{\partial\Delta_{IE}}{\partial k_i}
=
s(q)R_c(q,c_I)c_{I,k}
-
F_{I,k}
>0.
\]

Thus the old conditional \(I/E\) cutoff result survives **within the set where both routes are financeable**.

The revised proposition should explicitly have two layers:

### Layer 1: financial feasibility

\[
J_I(m,k_i)\le \ell_i
\quad\text{and/or}\quad
J_E(m)\le \ell_i.
\]

### Layer 2: value ranking

Conditional on both \(I\) and \(E\) being financeable and dominating \(T,A\), a unique

\[
k^*(q,m;p_m,M)
\]

continues to sort low-\(k_i\) developers into \(E\) and high-\(k_i\) developers into \(I\).

This is important: financing constraints do not replace the old comparative-advantage sorting; they create an additional feasibility margin before the value comparison.

---

# 8. Add a new “financing corridor” result

This is the main new economic result and should be stated formally.

For fixed \((q,m,k_i,p_m)\), suppose post-MAH entrusted manufacturing is privately valuable relative to \(T\) and \(A\), and suppose:

\[
J_E(m)<J_I(m,k_i).
\]

Then financing capacity divides developers into three regions.

## Region F0: too little financing for either retained route

\[
\ell_i<J_E(m).
\]

Then \(E\) is financially infeasible even after MAH.

If \(I\) is also infeasible, the reform need not affect the project:

\[
\Delta W_i=0
\]

unless another mechanism is added (do not add one).

## Region F1: financing corridor

\[
J_E(m)\le \ell_i<J_I(m,k_i).
\]

Then:

- \(E\) is financially feasible after MAH;
- \(I\) is not financially feasible;
- this is the cleanest group for which MAH can relax the commercialization bottleneck without changing financing supply.

If

\[
W_i^E(q,m;1,p_m)>\max\{W^T(q,m),0\},
\]

then the reform gives a strict project-value gain.

This region is the key interpretation of:

\[
\boxed{
\text{financially constrained but commercially viable innovators}
}
\]

## Region F2: enough financing to internalize

\[
\ell_i\ge J_I(m,k_i).
\]

Both \(I\) and, post-MAH, \(E\) can be financeable.

The MAH gain is then:

\[
\left[
W_i^E-
\max\{W_i^I,W^T,0\}
\right]_+.
\]

Do not claim this gain is always zero.

Do not claim the MAH effect is globally decreasing in \(\ell_i\).

The correct statement is:

> The reform effect need not be monotone in financing capacity. Extremely low financing capacity can make even entrusted commercialization infeasible, intermediate capacity can place a developer in the financing corridor where MAH has the strongest feasibility effect, and high financing capacity restores internalization as an old option.

This non-monotonicity is a useful non-tautological prediction.

---

# 9. Update the MAH-relevant project set

The old definition based only on route values should be expanded to include financing feasibility.

Define the pre-MAH optimized value:

\[
W_i^0(q,m;\ell_i)
=
\max
\{
\widetilde W_i^I(q,m;\ell_i),
W^T(q,m),
0
\}.
\]

Define post-MAH value:

\[
W_i^1(q,m;p_m,\ell_i)
=
\max
\{
W_i^0(q,m;\ell_i),
\widetilde W_i^E(q,m;1,p_m,\ell_i)
\}.
\]

Then:

\[
W_i^1-W_i^0
=
\left[
\widetilde W_i^E-W_i^0
\right]_+.
\]

Define the revised MAH-relevant set:

\[
\mathcal C_i(p_m,\ell_i)
=
\left\{
(q,m):
J_E(m)\le\ell_i,\ 
W_i^E(q,m;1,p_m)>W_i^0(q,m;\ell_i)
\right\}.
\]

The strict value gain occurs only on this set.

Use this set in all later expected-value and advancement results.

---

# 10. Update expected project value and advancement

Replace the project-value expectation with:

\[
\Omega_i(M,p_m)
=
\int
\widetilde W_i(q,m;M,p_m,\ell_i)
\,dF(q,m).
\]

The advancement problem remains unchanged:

\[
\max_{x_i\ge0}
\left\{
\beta a_ix_i\Omega_i(M,p_m)
-
\frac{\kappa}{1+\nu}x_i^{1+\nu}
\right\}.
\]

Hence:

\[
x_i^*(M,p_m)
=
\left[
\frac{\beta a_i}{\kappa}
\Omega_i(M,p_m)
\right]^{1/\nu}.
\]

The reform affects advancement only through \(\Omega_i\).

Add an explicit statement:

\[
\frac{\partial x_i^*}{\partial \ell_i}
\]

is **not assigned a global sign** because financing capacity can expand the old internal route as well as the post-MAH entrusted route.

The central heterogeneity prediction should instead be conditional:

> For developers in the financing corridor, MAH can create a strict project-value and advancement response because it makes retained commercialization financeable without requiring full internalization.

---

# 11. Update the developer distribution everywhere

Replace all integrals over

\[
H(a,k)
\]

with

\[
H(a,k,\ell).
\]

In particular, study-related CMO demand becomes:

\[
D_m^{MAH}(p_m;M)
=
\int
 a_i x_i^*(M,p_m)
\chi_i^E(p_m;M)
\,dH(a,k,\ell),
\]

where

\[
\chi_i^E(p_m;M)
=
\int
b(m)
\mathbf 1
\{
r_i^*(q,m;M,p_m,\ell_i)=E
\}
\,dF(q,m).
\]

Supply is unchanged.

Background demand is unchanged.

The CMO clearing condition remains:

\[
D_m(p_m^*;M)=S_m(p_m^*).
\]

---

# 12. Check CMO monotonicity and equilibrium proofs

The financing extension should not break the scalar CMO equilibrium.

Because \(J_E(m)\) is independent of \(p_m\), raising \(p_m\) still:

- lowers \(W_E\);
- weakly contracts route-\(E\) choice;
- weakly lowers \(\Omega_i\);
- weakly lowers \(x_i^*\);
- weakly lowers study demand.

Therefore the existing proof that total demand is weakly decreasing in \(p_m\) should survive with only the extra \(\ell_i\) integration.

Update the dominated-convergence/continuity proof to integrate over \(H(a,k,\ell)\).

Preserve:

\[
p_m^*(1)\ge p_m^*(0),
\]

with strict inequality when post-MAH study demand is positive at the old price.

Preserve scarcity attenuation:

\[
0\le
\Delta\Omega_i^{eq}
\le
\Delta\Omega_i^{dir},
\]

\[
0\le
\Delta x_i^{eq}
\le
\Delta x_i^{dir}.
\]

Do not let financing change CMO supply directly.

---

# 13. New interaction between manufacturing capability and financing capacity

The revised model should make this interaction explicit.

Since:

\[
J_{I,k}<0,
\]

better internal manufacturing capability reduces the capital required to internalize.

Therefore, holding financing capacity fixed, a lower \(k_i\) makes it more likely that:

\[
J_E(m)\le \ell_i<J_I(m,k_i),
\]

i.e. that the developer lies in the MAH financing corridor.

This provides a stronger interpretation of the old low-\(k_i\) result:

> Low manufacturing capability not only makes internal production more expensive in value terms; it can also make the up-front internalization commitment financially infeasible.

However, do not collapse \(k_i\) and \(\ell_i\) into one index.

They must remain conceptually and empirically separable:

- \(k_i\): production capability / know-how.
- \(\ell_i\): ability to finance the required organizational commitment.

---

# 14. Main-text proposition structure after revision

The main text should contain four formal results.

## Proposition 1. Organizational feasibility and sorting

State:

1. route feasibility conditions using \(J_I,J_E,\ell_i\);
2. conditional \(I/E\) single crossing in \(k_i\);
3. \(k_i\) reduces the capital requirement for internalization via \(J_{I,k}<0\).

Proof details in appendix.

## Proposition 2. MAH-relevant projects and the financing corridor

State:

\[
W_i^1-W_i^0
=
[\widetilde W_i^E-W_i^0]_+,
\]

define

\[
\mathcal C_i(p_m,\ell_i),
\]

and characterize the three financing regions:

\[
\ell_i<J_E,
\]

\[
J_E\le\ell_i<J_I,
\]

\[
\ell_i\ge J_I.
\]

Make clear that the reform response is not globally monotone in financing capacity.

## Proposition 3. Project advancement and heterogeneity

Keep the existing advancement solution.

State strict response iff the expected MAH-relevant surplus is positive.

Highlight:

- \(a_i\) scales a positive response;
- low \(k_i\) increases exposure to the financing corridor;
- \(\ell_i\) has no global monotonic sign.

Retain any existing \(\nu\ge1\) condition for the formal manufacturing-capability ordering if still needed.

## Proposition 4. CMO equilibrium and scarcity attenuation

Keep the existing price existence/uniqueness and attenuation result.

No finance-market equilibrium should be added.

---

# 15. Appendix changes

Update the technical appendix systematically.

## Sections to revise

### Primitives / units

Add:

- financing-capacity unit;
- \(\ell_i\);
- \(J_I(m,k_i)\);
- \(J_E(m)\).

Define \(\ell_i\) as predetermined.

### Timing

At Stage 1, developer observes:

\[
(a_i,k_i,\ell_i,M)
\]

and anticipates \(p_m^*\).

At route choice, after \((q,m)\) is realized, financial feasibility is checked using \(J_I,J_E,\ell_i\).

Do not introduce a separate financing decision stage.

### Internal technology

Remove the hard use of \(F_I=+\infty\) solely because \(k_i\) is below a cutoff.

Add \(J_I\).

### External technology

Add \(J_E\).

### Route values

Introduce finance-adjusted values \(\widetilde W^I,\widetilde W^E\).

### Sorting

Clarify that value-based I/E cutoff applies conditional on both routes being financially feasible.

### Project advancement

Only update \(\Omega_i\); leave the optimization structure unchanged.

### CMO market

Change the heterogeneity integral to \(H(a,k,\ell)\).

### Propositions

Add the financing-corridor proposition and reorganize the old propositions so the baseline does not become an unwieldy list.

A clean appendix can still contain six or seven propositions, but the main text should use only four grouped results.

### Boundary cases

Add:

1. \(\ell_i\to0\): both retained routes may be infeasible.
2. \(\ell_i\to\infty\): financing ceases to constrain route choice; the old no-finance-friction model is recovered.
3. \(J_E\to0\): extreme low-capital outsourcing boundary, not baseline.
4. \(J_E\ge J_I\): no financing-relief advantage from route \(E\); organizational value can still matter.
5. \(J_I\to\infty\) for low \(k_i\): reproduces the old hard internal-infeasibility approximation as a limiting case.

---

# 16. Model nesting requirement

The revised model must explicitly nest the current model.

If:

\[
\ell_i\ge
\max\{
J_I(m,k_i),J_E(m)
\}
\]

for all relevant developer-project pairs, then financing never binds.

The model should collapse to the current baseline:

\[
\widetilde W_i^I=W_i^I,
\qquad
\widetilde W_i^E=W_i^E.
\]

This nesting is required for robustness and clean exposition.

---

# 17. Empirical mapping to add

Add financing capacity to the empirical-interface table.

## Model object

\[
\ell_i
\]

## Candidate pre-policy interfaces

Use only validated pre-policy measures, such as:

- registered/paid-in capital;
- cash or liquid assets;
- leverage/debt capacity;
- listed status;
- VC/PE backing;
- parent-company backing;
- pre-policy external financing history.

Do not assert that any particular data source is available until validated.

Do not use post-reform financial outcomes to define the baseline financing capacity.

## Key empirical interactions

The strongest empirical prediction should be tied to route \(E\), not patents:

\[
MAH
\times
\text{weak internal manufacturing capability}
\times
\text{limited/intermediate pre-policy financing capacity}.
\]

Outcomes should prioritize:

1. holder-manufacturer separation / route \(E\);
2. development-stage project advancement;
3. retained approvals/realized products.

Patent applications remain outside the baseline.

A particularly useful test is whether developers with weak manufacturing capability and limited financing become more likely to retain authorization while using an external manufacturer after MAH.

---

# 18. Literature positioning to update

Use finance literature only to support the organizational-capital mechanism.

The positioning should be:

- Grossman–Helpman: integration versus outsourcing / firm boundary.
- Teece / Arora / Gans–Stern: complementary assets and commercialization strategy.
- Ma (2026): innovation-production mismatch and specialization.
- Bøler et al.: access to external complementary inputs and innovation incentives.
- Corporate-finance/innovation literature: financing frictions can constrain capital-intensive innovative firms.
- Gu: direct empirical neighbor and explicit boundary.

The paper must state clearly that it differs from Gu:

> Gu studies financing-induced reallocation between research and development. The present baseline instead allows financing frictions to affect whether a developer can finance vertical integration in manufacturing. MAH changes the capital intensity of the organizational route needed to retain commercialization rights; it does not relax the financing constraint itself.

Do not claim novelty over Gu until the empirical implementation verifies this distinction.

---

# 19. Main-text wording to add

Use a paragraph close to the following logic, but rewrite in the paper’s established style:

> A developer’s lack of internal manufacturing capability need not make internal production technologically impossible. It may instead make internalization capital intensive. We therefore allow developers to differ in predetermined financing capacity. Internal production requires an up-front financing commitment that is larger for projects with greater manufacturing requirements and smaller for developers with stronger pre-existing manufacturing capability. Retained entrusted production also requires financing, but for research-oriented developers it can require substantially less up-front capital than building internal capability. MAH does not expand financing supply. It changes the organizational technology of commercialization, allowing some developers to retain authorization without financing full vertical integration.

This paragraph should appear before the formal route-choice problem.

---

# 20. Abstract / Introduction changes

Do not make “financial constraints” the headline of the abstract.

The headline remains:

\[
\boxed{
\text{regulatory separation and access to complementary manufacturing assets}
}
\]

Financing should appear as a heterogeneity/amplification mechanism.

A suitable abstract-level sentence is:

> The reform is especially valuable when a developer lacks internal manufacturing capability and cannot finance full vertical integration but can finance the smaller up-front commitment required for retained entrusted production.

Do not say:

> “MAH relaxes financial constraints.”

Prefer:

> “MAH reduces the amount of vertical-integration capital that must be financed to retain commercialization rights.”

---

# 21. Formal accounting audit

Before finalizing, run a full accounting audit.

For route \(I\):

- marginal manufacturing cost enters \(R(q,c_I)\) exactly once;
- setup/readiness cost \(F_I\) is subtracted exactly once;
- financing requirement \(J_I\) is **not** subtracted again if it is only a liquidity requirement.

For route \(E\):

- technological marginal cost enters \(R(q,c_E)\) exactly once;
- \(F_E\) is subtracted once;
- \(p_mb(m)\) is subtracted once;
- \(\mu_E\) is subtracted once;
- \(\tau_E(M)\) enters once;
- \(J_E\) is a feasibility/liquidity requirement and is not an extra cost.

If Codex instead chooses to make \(J_I\) or \(J_E\) actual real resource costs, then it must remove the overlapping component from \(F_I\) or \(F_E\). Do not double count.

The preferred implementation is to keep \(J_I,J_E\) as financing/liquidity requirements only.

---

# 22. Formal monotonicity audit

Verify all old signs after adding \(\ell_i\).

Required checks:

1. Conditional on financeability,

\[
\Delta_{IE,k}>0.
\]

2. \(J_{I,k}<0\) expands internal financial feasibility as \(k_i\) rises.

3. Higher \(p_m\) weakly lowers route-\(E\) value and demand.

4. \(D_m^{MAH}(p_m;M)\) remains weakly decreasing.

5. \(S_m(p_m)\) remains strictly increasing.

6. CMO equilibrium remains unique under the old assumptions.

7. No global sign is imposed on:

\[
\frac{\partial \Delta x_i}{\partial \ell_i}.
\]

8. The MAH effect can be zero for:

- extremely low \(\ell_i\);
- high-\(k_i\) firms for which \(I\) already dominates;
- projects where \(T\) or \(A\) dominates;
- high CMO scarcity.

These zero-effect regions are economically important and should be preserved.

---

# 23. Scope boundaries after revision

The revised baseline still has exactly:

- one policy variable \(M\);
- one common project-advancement control \(x_i\);
- deterministic route choice;
- one qualified-manufacturing-capacity market;
- exogenous route-independent downstream realization;
- no entry/exit;
- no dynamic firm evolution;
- no full finance market;
- no patent production function;
- no research/development allocation;
- no welfare claim.

The only new endogenous impact is through route feasibility/value given predetermined \(\ell_i\).

Do not enlarge the model beyond this.

---

# 24. Files / implementation strategy

Implement modularly.

Recommended working files:

```text
model_notes/
  finance_extension/
    00_finance_revision_scope.md
    01_new_primitives_and_accounting.md
    02_finance_adjusted_route_values.md
    03_financing_corridor_proposition.md
    04_updated_equilibrium_and_cmo_checks.md
    05_empirical_mapping_finance.md
    06_regression_and_nesting_audit.md
```

Then update:

```text
mah_route_indicator_friction_model.tex
mah_route_indicator_friction_model_appendix.tex
```

Do not overwrite a known-good baseline until:

1. the revised appendix compiles;
2. every old proposition is checked;
3. the no-binding-finance limit nests the current model;
4. equation references and notation are consistent;
5. the main text and appendix use the same meaning of \(a_i,k_i,\ell_i\).

Archive the current no-finance baseline first.

---

# 25. Execution order

## Phase 1 — notation and semantics

- Add \(\ell_i,J_I,J_E\).
- Change \(H(a,k)\to H(a,k,\ell)\).
- Remove/soften the hard low-\(k\) internal-infeasibility convention.
- Write the financing interpretation before changing any proposition.

## Phase 2 — route values

- Define finance-adjusted \(\widetilde W^I,\widetilde W^E\).
- Rebuild the route argmax.
- Check accounting.

## Phase 3 — project value and advancement

- Update \(\Omega_i\).
- Verify the \(x_i^*\) solution is unchanged in form.
- Re-establish fixed-price MAH comparisons.

## Phase 4 — propositions

- Re-prove conditional \(I/E\) sorting.
- Add financing-corridor result.
- Re-write the MAH-relevant set.
- Audit heterogeneity claims; remove any unsupported global monotonicity in \(\ell_i\).

## Phase 5 — CMO equilibrium

- Update integrals to \(H(a,k,\ell)\).
- Re-check continuity, monotonicity, existence, uniqueness, and scarcity attenuation.

## Phase 6 — empirical mapping

- Add finance-capacity interfaces and triple-interaction predictions.
- Keep patents outside baseline.
- Add a direct paragraph distinguishing this mechanism from Gu.

## Phase 7 — main-text compression

Move only the key assumptions and four grouped propositions into the main text.

Keep detailed proofs and boundary cases in the appendix.

---

# 26. Acceptance tests

The revision is acceptable only if all answers below are “yes”.

### Economic mechanism

- Is MAH still modeled as a commercialization-organization reform rather than a credit-supply reform?
- Does financing only determine whether the organizational commitment can be funded?
- Can a high-financing, low-\(k\) developer still internalize if willing to pay the high setup cost?
- Can a very low-financing developer fail to benefit from MAH because even \(E\) is not financeable?
- Is the strongest effect allowed to occur at intermediate financing capacity?

### Distinction from Gu

- Is there still only one advancement control \(x_i\)?
- Is there no \(x_R+x_D\le B\) constraint?
- Are patent applications still outside the baseline?
- Does the empirical prediction focus on retained outsourcing / holder-manufacturer separation?

### Mathematical closure

- Does the model still close with one scalar CMO price?
- Does the old baseline emerge when financing never binds?
- Is the I/E sorting proof still valid conditional on financeability?
- Are route costs counted exactly once?

### Scope discipline

- No banking sector.
- No endogenous debt.
- No VC bargaining.
- No new entry/exit block.
- No Bellman equation.
- No welfare block.
- No route-specific success probability in the baseline.

---

# 27. Core interpretation for the final paper

The revised model should make the following distinction unmistakable:

### Incorrect

> MAH relaxes financial constraints.

### Correct

> MAH changes the organizational technology of commercialization. Before the reform, retaining commercialization rights could require financing full vertical integration into compliant manufacturing. After the reform, a developer can retain authorization while purchasing qualified manufacturing services. This can make commercialization feasible for developers whose financing capacity is insufficient for internalization but sufficient for retained outsourcing.

That is the mechanism Codex should implement.
