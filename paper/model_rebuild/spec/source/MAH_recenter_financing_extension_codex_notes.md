# Codex Revision Notes  
## Recenter the MAH Model on Commercialization Organization and Move the Explicit Financing Constraint to an Inactive Extension

**Project:** *Regulatory Separation and Pharmaceutical Innovation: Evidence from China’s MAH Reform*  
**Starting point:** the current main text places \(\ell_i\), \(J_I(m,k_i)\), \(J_E(m)\), finance-adjusted route values, and the financing corridor inside the baseline model.

---

# 0. Binding decision

Revise the current model according to the following decision:

\[
\boxed{
\text{Keep the “capital-light retained-commercialization route” as core institutional motivation,}
}
\]

but

\[
\boxed{
\text{remove the explicit financing-capacity state and binding liquidity constraints from the baseline.}
}
\]

The baseline must again use developer heterogeneity

\[
\theta_i=(a_i,k_i)\sim H(a,k),
\]

not

\[
\theta_i=(a_i,k_i,\ell_i).
\]

Move the formal financing block involving

\[
\ell_i,\qquad J_I(m,k_i),\qquad J_E(m)
\]

to a clearly isolated **inactive appendix extension**.

This is not a rejection of the real-world financing mechanism. It is a scope decision:

- MAH directly changes the legal and organizational feasibility of retained entrusted manufacturing.
- For developers without existing manufacturing capability, this route can avoid a large, lumpy commitment to proprietary production assets.
- The baseline captures that advantage through the relative real costs and technologies of internal versus entrusted production.
- A binding financing constraint is an additional mechanism that should enter the baseline only if later data show that financing capacity has an independent role after controlling for manufacturing capability.

Do **not** retain the current financing corridor as a main-text proposition.

---

# 1. Economic interpretation after revision

The core mechanism must be:

\[
M
\rightarrow
\tau_E(M)
\rightarrow
\text{retained entrusted production becomes available}
\rightarrow
\Omega_i
\rightarrow
x_i^*.
\]

MAH changes the organizational technology of commercialization:

- before reform, a developer that wished to retain commercialization rights generally had to rely on internal production or otherwise transfer the project;
- after reform, the developer may retain authorization while contracting with a qualified manufacturer.

For a developer with weak internal manufacturing capability, internalization can require a high fixed/setup/readiness cost. Retained entrusted production avoids full vertical integration but still involves:

- external production cost;
- technology-transfer and validation cost;
- qualified-capacity payment;
- holder-side compliance and coordination burden;
- the institutional route friction.

The baseline should therefore state:

> MAH can replace a large, lumpy internalization requirement with a contract-based commercialization route. The model captures this through the relative route costs and manufacturing capabilities, without explicitly modeling the financing market.

The baseline must **not** claim:

> MAH relaxes financial constraints.

A permissible institutional-motivation statement is:

> Financing frictions may amplify the value of this organizational change when firms cannot freely fund large internalization commitments. That amplification is analyzed only as an extension unless separately validated in the data.

---

# 2. Why the explicit financing state is being removed from the baseline

Codex should preserve this logic in a short model-scope note.

## 2.1 The MAH mechanism survives without a financing constraint

The central mechanism already follows from:

\[
k_i\downarrow
\Rightarrow
F_I(m,k_i)\uparrow
\Rightarrow
W_i^I\downarrow
\Rightarrow
E\text{ is relatively more valuable}
\Rightarrow
\Omega_i\uparrow
\Rightarrow
x_i^*\uparrow.
\]

Thus \(\ell_i\) is not necessary for the organizational mechanism.

## 2.2 Explicit finance creates a separate theoretical burden

Keeping \(\ell_i\), \(J_I\), and \(J_E\) in the baseline would require the paper to explain:

- what exactly \(\ell_i\) measures;
- why a positive-NPV project cannot obtain external finance;
- whether the friction is limited pledgeability, collateral, asymmetric information, agency, or another mechanism;
- how \(J_I\) differs from \(F_I\);
- how \(J_E\) differs from \(F_E+p_mb(m)+\mu_E\);
- how financing capacity is empirically distinguished from manufacturing capability, size, age, ownership, and parent backing.

The current paper does not need to solve these questions to explain MAH.

## 2.3 The reality of financing frictions is retained as an extension

The financing mechanism is economically plausible, but:

\[
\text{plausible real-world amplification}
\neq
\text{necessary baseline primitive}.
\]

Do not delete the existing finance work. Move and rewrite it as an optional extension.

---

# 3. Revised baseline model

## 3.1 Developer heterogeneity

Use:

\[
\theta_i=(a_i,k_i)\sim H(a,k).
\]

Definitions:

- \(a_i>0\): predetermined project-advancement capability;
- \(k_i>0\): predetermined internal manufacturing capability/know-how.

Allow arbitrary correlation in \(H(a,k)\).

Remove \(\ell_i\) from:

- the developer state;
- timing;
- route choice;
- project value;
- CMO demand;
- observed outcomes;
- empirical mapping;
- all baseline propositions.

---

## 3.2 Project heterogeneity

Keep:

\[
(q,m)\sim F(q,m),
\]

where:

- \(q>0\) is the project-value shifter;
- \(m>0\) is the manufacturing requirement.

Keep the novelty decomposition

\[
F(q,m)=\sum_{g\in\{O,Inc\}}\rho_gF_g(q,m)
\]

only for empirical decomposition. Do not create \(x_{ig}\).

---

## 3.3 Institutional regime

Keep the unique policy channel:

\[
\tau_E(0)=+\infty,
\qquad
\tau_E(1)=\bar\tau_E<+\infty.
\]

The direct policy effect remains only:

\[
M\rightarrow\tau_E(M).
\]

Do not add a credit-supply channel.

---

## 3.4 Project advancement

Keep one common control:

\[
x_i\ge0,
\qquad
\lambda_i^{plan}=a_ix_i.
\]

Keep:

\[
\max_{x_i\ge0}
\left\{
\beta a_ix_i\Omega_i(M,p_m)
-
\frac{\kappa}{1+\nu}x_i^{1+\nu}
\right\},
\]

and:

\[
x_i^*(M,p_m)
=
\left[
\frac{\beta a_i\Omega_i(M,p_m)}{\kappa}
\right]^{1/\nu}.
\]

Do not introduce a financing constraint on \(x_i\).

Do not introduce separate research and development controls.

---

# 4. Replace the current internal-production feasibility treatment

This is the most important technical edit.

## 4.1 Remove the explicit liquidity screen

Delete from the baseline:

\[
J_I(m,k_i)\le\ell_i,
\qquad
J_E(m)\le\ell_i.
\]

Delete finance-adjusted values:

\[
\widetilde W_i^I,
\qquad
\widetilde W_i^E.
\]

Return to ordinary route values:

\[
W_i^I,
\qquad
W_i^E.
\]

---

## 4.2 Do not restore the old hard capability cutoff as the main baseline device

Do **not** return to a blanket convention such as:

\[
k_i<\underline k(m)
\Rightarrow
F_I(m,k_i)=+\infty.
\]

That convention incorrectly makes weak existing capability equivalent to permanent physical impossibility.

Instead assume, on the baseline domain:

\[
0<F_I(m,k_i)<+\infty
\quad\text{for }k_i>0,
\]

with:

\[
F_{I,m}(m,k_i)>0,
\qquad
F_{I,k}(m,k_i)<0.
\]

Interpret \(F_I(m,k_i)\) broadly as the project-level present value of:

- building, acquiring, upgrading, or adapting internal production capability;
- validation and production readiness;
- internal quality-system preparation;
- project-specific fixed organizational costs.

For very low \(k_i\), \(F_I\) may be very large.

A limiting condition such as

\[
\lim_{k\downarrow0}F_I(m,k)=+\infty
\]

may be stated in the appendix as an optional boundary condition, but do not use a discrete hard threshold in the main baseline.

Similarly retain:

\[
c_{I,m}>0,
\qquad
c_{I,k}<0.
\]

Thus weak manufacturing capability lowers the internal route value through both:

- higher variable manufacturing cost;
- higher setup/readiness cost.

---

# 5. Baseline route values after revision

Use:

\[
W_i^I(q,m)
=
s(q)R(q,c_I(m,k_i))
-
F_I(m,k_i).
\]

Use:

\[
W_i^E(q,m;M,p_m)
=
s(q)R(q,c_E(m))
-
F_E(m)
-
p_mb(m)
-
\mu_E
-
\tau_E(M).
\]

Keep:

\[
W^T(q,m)=T(q,m),
\qquad
W^A=0.
\]

Route choice:

\[
W_i(q,m;M,p_m)
=
\max
\left\{
W_i^I,
W_i^E,
W^T,
0
\right\},
\]

\[
r_i^*(q,m;M,p_m)
\in
\arg\max_{r\in\{I,E,T,A\}}W_i^r.
\]

No tildes should remain in the baseline.

No route-financeability screen should remain in the baseline.

No logit shock should be added.

---

# 6. Organizational sorting result

Restore a clean capability-based sorting proposition.

Define:

\[
\Delta_{IE}(k_i;q,m,M,p_m)
=
W_i^I(q,m)-W_i^E(q,m;M,p_m).
\]

Then:

\[
\frac{\partial\Delta_{IE}}{\partial k_i}
=
s(q)R_c(q,c_I)c_{I,k}
-
F_{I,k}
>0.
\]

Under continuity and endpoint crossing, define the unique conditional cutoff:

\[
\Delta_{IE}
\left(
k^*(q,m;p_m,M)
\right)=0.
\]

Conditional on \(I\) and \(E\) both dominating \(T\) and \(A\):

\[
k_i<k^*
\Rightarrow
r_i^*=E,
\]

\[
k_i>k^*
\Rightarrow
r_i^*=I.
\]

The economic interpretation should be:

> Developers with weaker existing manufacturing capability face higher internal variable and setup costs. Retained entrusted production is therefore relatively more valuable for them, although transfer or abandonment may still dominate both retained routes.

Do not refer to a financing corridor in this proposition.

---

# 7. Restore the non-finance MAH-relevant set

Define the best pre-MAH value:

\[
W_i^0(q,m)
=
\max
\left\{
W_i^I(q,m),
W^T(q,m),
0
\right\}.
\]

Define the post-MAH value at a fixed support price:

\[
W_i^1(q,m;p_m)
=
\max
\left\{
W_i^0(q,m),
W_i^E(q,m;1,p_m)
\right\}.
\]

Then:

\[
W_i^1-W_i^0
=
\left[
W_i^E-W_i^0
\right]_+.
\]

Define:

\[
\mathcal C_i(p_m)
=
\left\{
(q,m):
W_i^E(q,m;1,p_m)>W_i^0(q,m)
\right\}.
\]

A strict direct gain occurs only on \(\mathcal C_i(p_m)\).

Use this set in the expected-value and advancement propositions.

Delete the financing-adjusted set:

\[
\mathcal C_i(p_m,\ell_i).
\]

---

# 8. Expected project value and advancement

Use:

\[
\Omega_i(M,p_m)
=
\int
W_i(q,m;M,p_m)
\,dF(q,m).
\]

At a fixed \(p_m\):

\[
\Delta\Omega_i(p_m)
=
\int
\left[
W_i^E(q,m;1,p_m)-W_i^0(q,m)
\right]_+
dF(q,m).
\]

A strict advancement response occurs iff:

\[
\Delta\Omega_i(p_m)>0.
\]

Keep:

\[
\Delta x_i(p_m)
=
\left(\frac{\beta a_i}{\kappa}\right)^{1/\nu}
\left[
(\Omega_i^0+\Delta\Omega_i)^{1/\nu}
-
(\Omega_i^0)^{1/\nu}
\right].
\]

Retain the existing heterogeneity results that are formally valid:

- \(a_i\) scales a positive level response;
- weak \(k_i\) can make entrusted production more valuable;
- the formal monotonic result in \(k_i\) may continue to use \(\nu\ge1\), if required by the proof.

Remove all claims involving:

\[
\frac{\partial x_i^*}{\partial\ell_i},
\qquad
\Delta x_i(\ell_i),
\]

or financing-region non-monotonicity from the baseline.

---

# 9. CMO market after revision

Change all developer integrals back from:

\[
H(a,k,\ell)
\]

to:

\[
H(a,k).
\]

Use:

\[
\chi_i^E(p_m;M)
=
\int
b(m)
\mathbf 1
\left\{
r_i^*(q,m;M,p_m)=E
\right\}
dF(q,m).
\]

Study demand:

\[
D_m^{MAH}(p_m;M)
=
\int
a_ix_i^*(M,p_m)
\chi_i^E(p_m;M)
\,dH(a,k).
\]

Total demand:

\[
D_m(p_m;M)
=
D_m^B(p_m)
+
D_m^{MAH}(p_m;M).
\]

Supply and market clearing remain unchanged:

\[
S_m(p_m)
=
\int s_j^*(p_m,z)dH_C(z),
\]

\[
D_m(p_m^*;M)=S_m(p_m^*).
\]

Retain:

\[
p_m^*(1)\ge p_m^*(0),
\]

and scarcity attenuation:

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

Remove any statement that financing capacity shifts route demand in the baseline.

---

# 10. Main-text structure after revision

The main text should contain four grouped formal results.

## Proposition 1. Organizational sorting

- Define \(\Delta_{IE}\).
- State strict monotonicity in \(k_i\).
- State the conditional cutoff.
- Preserve the \(T/A\) caveat.

## Proposition 2. MAH-relevant project set

- Define \(W_i^0\), \(W_i^1\), and \(\mathcal C_i(p_m)\).
- State the positive-part identity.
- Emphasize zero-effect projects.

## Proposition 3. Project advancement and developer heterogeneity

- Keep the closed-form advancement solution.
- State strict response iff expected entrusted surplus is positive.
- State the valid roles of \(a_i\) and \(k_i\).
- Do not state a finance-capacity result.

## Proposition 4. CMO equilibrium and scarcity attenuation

- Preserve existence and uniqueness.
- Preserve the equilibrium price comparison.
- Preserve the attenuation inequalities.

Observed outcomes may remain a corollary or separate subsection.

---

# 11. Exact main-text edits

## 11.1 Abstract

Remove all baseline statements that:

- developers differ in predetermined financing capacity;
- internal and entrusted production require explicit liquidity commitments;
- MAH is especially valuable for firms that cannot finance internalization but can finance entrusted production;
- reform effects require the new route to be financeable.

Replace them with wording close to:

> Developers differ in project-advancement capability and internal manufacturing capability. Internal and entrusted production use distinct technologies and organizational costs. MAH makes retained entrusted manufacturing legally available while preserving holder responsibility. The route is especially valuable when weak internal manufacturing capability makes vertical integration costly. Reform effects are confined to project–developer pairs for which the new route improves on the best old option and can be attenuated by scarcity in qualified manufacturing services.

The abstract may include one carefully bounded sentence:

> Financing frictions may amplify this mechanism, but financing is not a baseline policy channel.

Do not make finance a keyword unless the extension becomes empirically central.

Recommended baseline keywords:

- MAH;
- pharmaceutical innovation;
- commercialization frictions;
- complementary assets;
- entrusted production;
- organizational choice.

---

## 11.2 Introduction

Keep the real-world interpretation that building proprietary compliant production can involve a large and front-loaded commitment.

But immediately state the abstraction:

> The baseline captures this internalization burden through route-specific setup and operating costs rather than modeling financial intermediation. A financing-friction extension is considered separately.

Retain the key distinction:

\[
MAH\nrightarrow
\text{demand, scientific productivity, or downstream success}.
\]

Also retain:

\[
MAH\nrightarrow
\text{credit supply}.
\]

However, “credit supply” should now be a boundary statement, not a baseline state variable.

---

## 11.3 Literature paragraph

Core baseline references should remain:

- Teece;
- Arora–Fosfuri–Gambardella;
- Gans–Stern;
- Grossman–Helpman;
- Bøler et al.;
- Ma.

Hall and Lerner should be moved to:

- the appendix financing extension; or
- a footnote explaining why financing may amplify internalization costs.

Do not present corporate-finance literature as a core baseline foundation.

---

## 11.4 Gu paragraph

Use a neutral boundary statement:

> Gu documents heterogeneous trial and patent responses by financial resources. Those findings motivate a financing-friction extension and empirical heterogeneity tests. The baseline here isolates a different and more primitive MAH margin: the availability and value of retained entrusted manufacturing relative to internal production, transfer, and delay.

Do not overstate novelty.

Do not say that the finance mechanism is included in the baseline.

---

## 11.5 Model environment

Replace:

\[
\theta_i=(a_i,k_i,\ell_i)\sim H(a,k,\ell)
\]

with:

\[
\theta_i=(a_i,k_i)\sim H(a,k).
\]

Delete all finance-capacity definitions and timing checks.

Timing should be:

1. \(M\) is observed and \(p_m^*\) is anticipated.
2. Developer chooses \(x_i\).
3. Project draws \((q,m)\).
4. Project chooses \(I/E/T/A\).
5. Downstream realization occurs.
6. CMO market consistency validates \(p_m^*\).

---

## 11.6 Commercialization technologies

Delete \(J_I\), \(J_E\), and the piecewise route values.

Expand the interpretation of \(F_I(m,k_i)\) so readers understand that weak capability makes internalization costly rather than literally impossible.

A suggested sentence:

> \(F_I(m,k_i)\) includes the project-specific fixed cost of building, acquiring, validating, or adapting internal production capability. It may be very large for a developer with little pre-existing manufacturing capability, but the baseline does not impose a separate financing screen.

For route \(E\), keep:

- \(F_E(m)\);
- \(p_mb(m)\);
- \(\mu_E\);
- \(\tau_E(M)\).

A suggested sentence:

> Entrusted production avoids the need to establish full proprietary manufacturing capability, but it still requires technology transfer, validation, contracted capacity, and holder-side quality oversight.

---

## 11.7 Empirical predictions section

Remove financing capacity as a baseline model object.

Delete baseline rows for:

- \(\ell_i\);
- \(J_I\);
- \(J_E\).

Restore the primary empirical predictions:

1. weaker pre-policy internal manufacturing capability predicts route \(E\);
2. MAH raises advancement only for the MAH-relevant project set;
3. CMO scarcity attenuates the response;
4. observed holder–manufacturer separation is a downstream route outcome.

A finance interaction may appear in a separate subsection titled:

> Extension-Based Heterogeneity: Financing Capacity

It must be labeled as secondary and conditional.

Do not call the triple interaction the model’s primary baseline prediction.

---

## 11.8 Conclusion

Remove the three financing regions from the main conclusion.

Restore the main conclusion:

> MAH creates a regulated retained-outsourcing route for developers that may have valuable projects but weak internal manufacturing capability. The resulting increase in expected commercialization value can raise project advancement, while CMO scarcity attenuates the gain.

A final extension sentence is allowed:

> Financing frictions can strengthen this mechanism when large internalization commitments are difficult to fund, but the baseline does not require a binding financing constraint.

---

# 12. Formal financing extension to preserve in the appendix

Move the current finance block into a section explicitly titled:

# Extension: Financing the Commercialization Organization  
**Not part of the baseline**

The extension may introduce:

\[
\ell_i>0,
\]

\[
J_I(m,k_i)>0,
\qquad
J_{I,m}>0,
\qquad
J_{I,k}<0,
\]

\[
J_E(m)>0,
\qquad
J_E'(m)>0.
\]

Interpret \(\ell_i\) as:

> internal liquidity plus external finance available under limited pledgeability before commercialization revenue is realized.

Interpret \(J_r\) as:

> the peak up-front liquidity commitment required by route \(r\), not an additional real cost.

Use finance-adjusted route values only inside the extension:

\[
\widetilde W_i^I
=
\begin{cases}
W_i^I,&J_I(m,k_i)\le\ell_i,\\
-\infty,&J_I(m,k_i)>\ell_i,
\end{cases}
\]

\[
\widetilde W_i^E
=
\begin{cases}
W_i^E,&J_E(m)\le\ell_i,\\
-\infty,&J_E(m)>\ell_i.
\end{cases}
\]

State the local condition:

\[
J_E(m)<J_I(m,k_i)
\]

for low-\(k_i\) developers.

Then derive the extension-only financing regions:

\[
\ell_i<J_E(m),
\]

\[
J_E(m)\le\ell_i<J_I(m,k_i),
\]

\[
\ell_i\ge J_I(m,k_i).
\]

Call the middle interval the financing corridor, but mark it clearly as an extension result.

Do not let extension notation enter:

- baseline equilibrium;
- baseline CMO demand;
- baseline propositions;
- baseline empirical mapping.

---

# 13. Extension nesting and accounting checks

The extension must nest the baseline.

If:

\[
\ell_i\ge
\max\{J_I(m,k_i),J_E(m)\}
\]

for all relevant developer-project pairs, then:

\[
\widetilde W_i^I=W_i^I,
\qquad
\widetilde W_i^E=W_i^E,
\]

and the extension collapses to the baseline.

Accounting rule:

- \(F_I\) and \(F_E\) are real present-value route costs;
- \(J_I\) and \(J_E\) are liquidity thresholds;
- do not subtract \(J_I\) or \(J_E\) again from route values.

If Codex changes \(J_r\) into a real cost, it must remove the overlapping component from \(F_r\). The preferred implementation is to keep \(J_r\) as liquidity requirements only.

---

# 14. Empirical strategy for the finance extension

Retain finance as a pre-specified heterogeneity test, not a baseline identifying restriction.

## 14.1 Candidate pre-policy proxies

Possible proxies include:

- registered or paid-in capital;
- cash and liquid assets;
- leverage or debt capacity;
- listed status;
- VC/PE backing;
- parent-company backing;
- prior external financing history.

Every proxy must predate reform exposure.

Do not use post-reform financing outcomes to define baseline capacity.

## 14.2 Required distinction

Finance must be separated empirically from:

- internal manufacturing capability;
- firm size;
- firm age;
- ownership;
- business-group affiliation;
- listed status;
- pre-policy innovation history.

## 14.3 Sequence of tests

Use this order:

1. Test whether weak internal manufacturing capability predicts post-MAH route \(E\).
2. Test whether route \(E\) is associated with project advancement or retained realization.
3. Add pre-policy financing heterogeneity.
4. Test whether financing remains informative after controlling for \(k_i\) and other firm characteristics.
5. Only then evaluate whether the formal finance extension should be promoted into the baseline.

## 14.4 Promotion criteria

Do not restore finance to the baseline unless the data show most of the following:

- finance proxies have an independent effect after controlling for \(k_i\);
- finance predicts holder–manufacturer separation, not only clinical trials;
- the effect is robust to size, age, ownership, and parent backing;
- the pattern is consistent with the extension’s non-monotonic financing corridor;
- the result is not merely a replication of Gu’s research-versus-development reallocation finding.

---

# 15. Red lines

Codex must not do any of the following:

1. Do not retain \(\ell_i\) in the baseline developer state.
2. Do not retain \(J_I\) or \(J_E\) in baseline route feasibility.
3. Do not retain the financing corridor as a main proposition.
4. Do not restore \(F_I=+\infty\) through a hard low-\(k\) cutoff as the main mechanism.
5. Do not add a banking sector.
6. Do not add endogenous debt or equity contracts.
7. Do not add VC bargaining.
8. Do not add \(x_i^R\) and \(x_i^D\).
9. Do not impose \(x_i^R+x_i^D\le B_i\).
10. Do not make patent applications a baseline outcome.
11. Do not add entry, exit, an invariant distribution, or a Bellman equation.
12. Do not add welfare.
13. Do not change MAH into a CMO supply shock.
14. Do not claim that all research-only firms are financially constrained.
15. Do not claim that entrusted production is always cheaper than internal production.

---

# 16. Search-and-audit checklist

Search the main text and baseline appendix for every occurrence of:

```text
\ell_i
\ell
J_I
J_E
\widetilde W
finance-adjusted
financeability
financing corridor
commercialization-stage financing capacity
H(a,k,\ell)
limited or intermediate financing
cannot finance full internalization
```

For each occurrence, choose one of three actions:

- delete from the baseline;
- rewrite as institutional motivation without a binding constraint;
- move to the inactive finance extension.

Do not perform blind global deletion. Preserve extension-only material in the appendix.

Then search for the old hard-feasibility language:

```text
k_i < \underline{k}(m)
F_I = +\infty
internal production is unavailable
```

Replace baseline uses with the high-cost interpretation described above.

---

# 17. Proposed replacement paragraph for the main model

Insert a paragraph close to the following before route values:

> A developer with little pre-existing manufacturing capability is not assumed to be permanently incapable of internal production. It can in principle build, acquire, validate, or adapt compliant capacity, but doing so is costly. The internal setup cost \(F_I(m,k_i)\) therefore rises with project manufacturing requirements and falls with the developer’s existing manufacturing capability. MAH creates a distinct retained route that avoids full internalization but still requires technology transfer, validation, qualified capacity, and holder-side oversight. The baseline compares these real organizational costs and abstracts from financial intermediation. An extension allows large up-front commitments to become infeasible under imperfect finance.

This paragraph is important. It preserves the realism that motivated the finance discussion without placing a capital-market model inside the baseline.

---

# 18. Proposed revised contribution language

The main contribution should be stated approximately as:

> The paper identifies a commercialization-organization channel of pharmaceutical innovation. By separating marketing-authorization ownership from physical manufacturing, MAH allows developers with weak internal manufacturing capability to retain commercialization rights while purchasing qualified production services. The model characterizes capability-based organizational sorting, the project–developer pairs for which the new route creates value, and the attenuation generated by scarcity in qualified manufacturing capacity. Financing frictions may amplify the mechanism but are not required for the baseline result.

Do not describe the contribution as a financial-constraint paper.

---

# 19. File workflow

Before editing, archive the current finance-baseline version.

Recommended structure:

```text
archive/
  finance_baseline_2026_09_03/
    mah_route_indicator_friction_model.tex
    mah_route_indicator_friction_model.pdf
    mah_route_indicator_friction_model_appendix.tex
    mah_route_indicator_friction_model_appendix.pdf
```

Work in:

```text
model_notes/
  baseline_recenter/
    00_decision_and_scope.md
    01_baseline_state_cleanup.md
    02_internal_cost_reinterpretation.md
    03_proposition_rebuild.md
    04_cmo_equilibrium_audit.md
    05_finance_extension_isolation.md
    06_empirical_promotion_criteria.md
```

Update both:

```text
mah_route_indicator_friction_model.tex
mah_route_indicator_friction_model_appendix.tex
```

---

# 20. Execution order

## Phase 1 — archive and notation cleanup

- Archive current finance-baseline files.
- Change \(H(a,k,\ell)\) back to \(H(a,k)\).
- Remove \(\ell_i\) from baseline timing and state definitions.
- Remove all baseline \(J_I,J_E\) notation.
- Restore ordinary \(W_i^I,W_i^E\).

Stop and compile.

## Phase 2 — internal-production reinterpretation

- Remove the hard low-\(k\) infeasibility convention.
- Make \(F_I(m,k_i)\) finite for \(k_i>0\).
- Add the high-cost / lumpy internalization interpretation.
- Recheck \(\Delta_{IE,k}>0\).

Stop and compile.

## Phase 3 — propositions

- Restore the non-finance organizational-sorting proposition.
- Restore \(\mathcal C_i(p_m)\).
- Restore the advancement proposition.
- Remove the baseline financing-corridor proposition.
- Preserve CMO scarcity attenuation.

Stop and compile.

## Phase 4 — CMO and observed outcomes

- Change all integrals to \(H(a,k)\).
- Recheck demand monotonicity and continuity.
- Recheck equilibrium existence and uniqueness.
- Recheck observed-outcome formulas and timing.

Stop and compile.

## Phase 5 — isolate the finance extension

- Move the existing \(\ell_i,J_I,J_E\) structure to an appendix extension.
- Add nesting and accounting checks.
- Add explicit “not the baseline” labels.
- Ensure no extension symbol appears in a baseline proposition or equilibrium definition.

Stop and compile.

## Phase 6 — empirical mapping and prose

- Remove finance objects from the baseline mapping table.
- Add an extension-based finance heterogeneity subsection.
- Rewrite abstract, introduction, Gu paragraph, and conclusion.
- Move Hall–Lerner to the extension discussion or a footnote.

Compile the complete paper and appendix.

---

# 21. Acceptance tests

The revision is acceptable only if all answers are “yes.”

## Baseline scope

- Does the baseline developer state contain only \((a_i,k_i)\)?
- Does MAH directly change only \(\tau_E(M)\)?
- Is there only one project-advancement control \(x_i\)?
- Are route choices still deterministic?
- Is the only market closure the qualified-manufacturing-capacity market?

## Internal production

- Can a low-\(k_i\) developer in principle internalize by paying a high cost?
- Is weak capability represented by high \(c_I\) and \(F_I\), not automatically by a hard prohibition?
- Does \(\Delta_{IE,k}>0\) still hold?

## Finance scope

- Are \(\ell_i,J_I,J_E\) absent from the baseline?
- Are they retained only in a labeled inactive extension?
- Does the extension nest the baseline when liquidity never binds?
- Is MAH never modeled as increasing financing supply?

## Empirical mapping

- Is holder–manufacturer separation again the first route outcome?
- Is manufacturing capability the primary baseline heterogeneity?
- Is financing clearly marked as a secondary extension-based test?
- Are patents still outside the baseline?

## Positioning

- Is the paper still about regulatory separation, complementary assets, and commercialization organization?
- Is the distinction from Gu based on the paper’s actual margin rather than only verbal reframing?
- Does the text avoid claiming that all firms without production facilities are financially constrained?

---

# 22. Required Codex deliverables

After implementation, return:

1. Updated main `.tex`.
2. Updated appendix `.tex`.
3. Compiled main PDF.
4. Compiled appendix PDF.
5. A concise change log listing:
   - all removed baseline finance objects;
   - all rewritten propositions;
   - where the financing extension was moved;
   - any equation-label changes;
   - any unresolved theoretical issue.
6. A notation audit confirming that no extension-only symbol appears in the baseline.
7. A one-page comparison:
   - old finance-baseline version;
   - revised organizational baseline;
   - finance extension.

Do not make further model expansions during this revision.
