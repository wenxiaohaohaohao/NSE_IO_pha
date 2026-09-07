# MAH Model Rebuild — Codex Execution Note

**Status:** Architecture locked; execution phase only  
**Purpose:** Rebuild the theoretical model from economic primitives while preserving the paper's narrow MAH mechanism and partial-equilibrium scope.  
**Primary audience:** Codex  
**Do not treat this file as a brainstorming document.** The economic architecture has already been decided. Codex's job is to derive, verify, document, and later integrate the model—not to redesign it.

---

## 0. Mission

Rebuild the paper's model so that the main theoretical chain is:

\[
\text{economic primitives}
\rightarrow
\text{operating profit}
\rightarrow
\text{commercialization organization}
\rightarrow
\text{project value}
\rightarrow
\text{ex ante R\&D}
\rightarrow
\text{CMO-market equilibrium}
\rightarrow
\text{comparative statics}.
\]

The rebuilt model must replace the current reduced-form chain

\[
G^I,G^E,G^T
\rightarrow
\Gamma
\rightarrow
x
\]

with a deeper but still disciplined partial-equilibrium model in which the core route values are derived from demand, manufacturing technology, organizational choice, and the MAH institutional primitive.

The model must remain focused on the paper's scientific question:

> When research capability and the manufacturing capability required to commercialize an original-drug project need not reside in the same firm, how does a regulatory institution that permits a developer to retain marketing authorization while contracting with a qualified manufacturer alter commercialization assignment and ex ante original-drug R&D incentives?

The economic mechanism is:

\[
\boxed{
MAH
\rightarrow
\text{organizational technology}
\rightarrow
\text{commercialization assignment}
\rightarrow
\text{expected project value}
\rightarrow
\text{R\&D}.
}
\]

The model is **not** a full pharmaceutical-industry GE model and must not become one.

---

# 1. Model Lineage

## 1.1 Mother organizational model

Use the **make-or-buy organizational logic of Grossman and Helpman (2002, QJE)** as the mother-model reference:

- final producer needs a specialized complementary input;
- it can obtain this capability internally or through a specialized outside supplier;
- internal and external organization have different costs/frictions;
- organizational form is endogenous.

Do **not** reproduce the complete Grossman–Helpman industry equilibrium.

The MAH model retains only the organizational core and rewrites it as:

\[
\text{internal manufacturing } I
\quad\text{vs.}\quad
\text{retained entrusted manufacturing } E.
\]

## 1.2 Supporting references, not additional baseline models

Use the following references only for specific theoretical roles:

- **Akcigit, Celik, and Greenwood (2016, Econometrica):**
  R&D value-gap logic; innovation incentives depend on the value of successful innovation relative to the no-innovation state.
- **Bøler, Moxnes, and Ulltveit-Moe (2015, AER):**
  external sourcing and R&D can be endogenous complements.
- **Ma (2026, JPE Macroeconomics):**
  innovation capability and production capability can be separated/mismatched across firms.
- **Serrano (2010, RAND):**
  ownership transfer / adoption-cost logic; only for the transfer-route extension.
- **Jungbauer et al. (2026, AEJ: Micro):**
  pharmaceutical organizational boundaries under incomplete contracting; note carefully that their outsourced object is R&D, not manufacturing.

Do not splice these papers into a hybrid multi-model system.

---

# 2. Absolute Red Lines

Codex must not violate the following restrictions.

1. Do **not** reintroduce original-drug versus generic-drug R&D as two innovation directions.
2. Do **not** restore A/B/C as permanent firm types.
3. Do **not** introduce a full multi-product firm state.
4. Do **not** introduce firm entry/exit into the baseline.
5. Do **not** introduce a Hopenhayn invariant firm distribution.
6. Do **not** introduce a representative household, capital accumulation, aggregate BGP, or full welfare model.
7. Do **not** let MAH directly increase research productivity \(a_i\).
8. Do **not** let MAH directly increase market size, demand, or project quality \(q\).
9. Do **not** let MAH directly increase the baseline clinical/regulatory success probability \(s(q)\).
10. Do **not** let MAH directly lower the equilibrium CMO price \(p_m^*\).
11. Do **not** interpret entrusted production as transfer of ownership/authorization.
12. Do **not** use logit/inclusive value as the theoretical baseline.
13. Do **not** reintroduce the current continuous implementation parameter \(\eta\) into the baseline.
14. Do **not** create new state variables merely because another reference paper contains them.
15. Do **not** modify the main manuscript until the derivation modules below pass their audit gates.
16. Do **not** claim that every primitive is separately identified by available data.
17. Do **not** use pseudo-code as a substitute for formal economics derivation.
18. Do **not** silently change notation from one phase to the next.
19. Do **not** write a proposition before checking that all objects used in it have already been formally defined.
20. Do **not** infer welfare conclusions from private-value or realized-output comparative statics.

---

# 3. Required Working Directory

Create a separate model-rebuild workspace. Do not overwrite the current manuscript.

Suggested structure:

```text
paper/
  manuscript/
    mah_route_indicator_friction_model.tex
    mah_route_indicator_friction_refs.bib

  model_rebuild/
    00_README_model_rebuild.md
    01_primitives_and_timing.tex
    02_demand_profit_derivation.tex
    03_internal_external_technologies.tex
    04_route_values_and_sorting.tex
    05_rd_problem.tex
    06_cmo_supply_demand_equilibrium.tex
    07_equilibrium_definition.tex
    08_comparative_statics.tex
    09_observed_outcomes.tex
    10_empirical_mapping.tex
    11_extensions_not_baseline.tex
    12_full_derivation_draft.tex
    13_main_text_model_candidate.tex
    14_appendix_model_candidate.tex

  model_notes/
    00_model_closure_status.md
    01_symbols_and_objects.md
    02_equation_dependency_map.md
    03_assumptions_and_scope.md
    04_proposition_checklist.md
    05_old_to_new_model_crosswalk.md
    06_open_issues_log.md
    07_consistency_audit.md

  reviews/
    ...
```

If the actual repository uses different names, preserve the existing repository structure but maintain the same logical separation.

---

# 4. Frozen Baseline Agents and Heterogeneity

## 4.1 Drug developers

There is a continuum of drug developers indexed by \(i\).

Each developer has only two baseline permanent characteristics:

\[
\boxed{
\theta_i=(a_i,k_i)
}
\]

where:

\[
a_i>0
\]

is **research capability / research productivity**, and

\[
k_i>0
\]

is **internal manufacturing capability**.

Economic interpretation:

- high \(a_i\), low \(k_i\): research-oriented developer;
- high \(a_i\), high \(k_i\): integrated innovative incumbent;
- low \(a_i\), high \(k_i\): production-capable but weakly research-oriented firm.

These are points in a continuous characteristic space, not permanent discrete firm types.

## 4.2 Qualified manufacturers / CMOs

There is a set of qualified manufacturing-service suppliers indexed by \(j\).

Each supplier has:

\[
z_j
\]

representing manufacturing-service productivity / capacity efficiency.

The baseline does not track whether a real-world CMO is simultaneously an innovative product firm. Treat its qualified manufacturing capacity as belonging to the manufacturing-service supply side.

---

# 5. Project Heterogeneity

A route-planning-stage original-drug project has characteristics:

\[
\boxed{
\omega=(q,m)\sim F(q,m)
}
\]

where:

- \(q>0\): project commercial/scientific value index;
- \(m>0\): manufacturing requirement / manufacturing complexity.

Roles must remain distinct:

\[
q
\rightarrow
\text{market payoff}
\]

and

\[
m
\rightarrow
\text{manufacturing difficulty / capability requirement}.
\]

The key mismatch is:

\[
\boxed{
(m,k_i)
}
\]

rather than a permanent categorical firm identity.

---

# 6. Phase 1 — Object and Timing Audit

## 6.1 Task

Before deriving any payoff, write a formal object-status table.

Every model object must be classified as exactly one of:

- primitive parameter;
- exogenous firm characteristic;
- exogenous project characteristic;
- control;
- endogenous firm-level object;
- endogenous route-level object;
- equilibrium price;
- aggregate/distributional primitive;
- derived observed outcome.

## 6.2 Timing to formalize

Use the following baseline timing.

### Stage 0: Institutional regime

The economy is under:

\[
M\in\{0,1\}.
\]

\(M=0\): pre-MAH organizational environment.

\(M=1\): MAH retained holder–producer separation is legally available.

### Stage 1: R&D

Developer \(i\) observes \((a_i,k_i)\) and chooses:

\[
x_i\geq0.
\]

Route-planning-stage projects arrive at intensity:

\[
\lambda_i^{plan}=a_ix_i.
\]

### Stage 2: Project characteristics

Each project draws:

\[
(q,m)\sim F(q,m).
\]

### Stage 3: Commercialization organization

Conditional on the project draw and equilibrium manufacturing-service price \(p_m\), the project chooses among:

\[
\{I,E,T,A\}
\]

where:

- \(I\): internal manufacturing;
- \(E\): retained entrusted manufacturing;
- \(T\): transfer/out-license/non-retained route;
- \(A\): abandonment/indefinite delay.

### Stage 4: Downstream realization

A route-independent downstream clinical/regulatory realization probability:

\[
s(q)\in[0,1]
\]

determines whether the retained project generates commercial value.

MAH does not directly shift \(s(q)\).

### Stage 5: Manufacturing-service market consistency

Aggregate entrusted-route demand must be consistent with the equilibrium CMO price:

\[
p_m^*.
\]

## 6.3 Deliverables

Create:

- `01_primitives_and_timing.tex`
- update `01_symbols_and_objects.md`
- update `02_equation_dependency_map.md`

## 6.4 Audit gate

Do not proceed unless:

- every symbol is classified;
- no symbol appears before definition;
- timing of R&D versus route choice is unambiguous;
- no MAH effect other than the institutional route wedge has entered.

---

# 7. Phase 2 — Demand and Operating Profit

## 7.1 Goal

Replace the current reduced-form market-return objects such as \(R_i^{event}\) and \(\bar R_i^E\) with a profit object derived from demand and marginal cost.

## 7.2 Baseline demand

Use a minimal constant-elasticity residual demand:

\[
y(p;q)=Aq\,p^{-\varepsilon},
\qquad
\varepsilon>1.
\]

Interpretation:

- \(A>0\): exogenous market-size shifter;
- \(q>0\): project quality/commercial-value shifter;
- \(\varepsilon>1\): demand elasticity.

MAH must not shift \(A,q,\varepsilon\).

## 7.3 Static pricing problem

Given marginal manufacturing cost \(c\):

\[
\max_{p\geq c}(p-c)y(p;q).
\]

Derive explicitly:

\[
p^*(c)
=
\frac{\varepsilon}{\varepsilon-1}c.
\]

Substitute back and derive:

\[
\boxed{
\pi(q,c)
=
Aq
\frac{(\varepsilon-1)^{\varepsilon-1}}
{\varepsilon^\varepsilon}
c^{1-\varepsilon}.
}
\]

Verify:

\[
\pi_q>0,
\qquad
\pi_c<0.
\]

## 7.4 Present value

If a successfully commercialized drug remains commercially active next period with probability \(\varphi\), and \(\beta\in(0,1)\), derive:

\[
\boxed{
R(q,c)
=
\frac{\pi(q,c)}
{1-\beta\varphi}.
}
\]

If a more parsimonious representation is mathematically cleaner, retain \(R(q,c)\) as the derived present-value function after showing this derivation once.

## 7.5 Deliverables

Create:

- `02_demand_profit_derivation.tex`
- corresponding notation entries
- explicit derivation of FOC, SOC, and comparative derivatives.

## 7.6 Audit gate

Do not proceed unless:

- \(R(q,c)\) is fully derived;
- no current reduced-form return object survives without an explicit crosswalk;
- all cost accounting is dimensionally consistent;
- no route-specific cost is counted twice.

---

# 8. Phase 3 — Manufacturing Technologies

## 8.1 Internal manufacturing

Define route-specific marginal manufacturing cost:

\[
c_I(m,k_i)
\]

with:

\[
c_{I,m}>0,
\qquad
c_{I,k}<0.
\]

Define an internal production-readiness/setup cost:

\[
F_I(m,k_i)
\]

with:

\[
F_{I,m}>0,
\qquad
F_{I,k}<0.
\]

Allow infeasibility through:

\[
F_I(m,k_i)=+\infty
\quad\text{if}\quad
k_i<\underline{k}(m).
\]

This replaces the current binary internal-feasibility indicator.

## 8.2 Entrusted manufacturing

Define:

\[
c_E(m)
\]

as the technological marginal manufacturing-cost kernel under qualified external production.

Define required qualified manufacturing-service capacity:

\[
b(m)>0,
\qquad
b'(m)>0.
\]

Define:

\[
F_E(m)
\]

as real route-specific technology-transfer / validation / production-readiness cost.

Define:

\[
\mu_E\geq0
\]

as the residual holder-side burden under entrusted manufacturing.

Do not reinterpret \(\mu_E\) as removed by MAH.

## 8.3 MAH institutional wedge

The baseline direct policy object is only:

\[
\boxed{
M\in\{0,1\}.
}
\]

Represent the institutional barrier through:

\[
\tau_E(M).
\]

Preferred theoretical baseline:

\[
\boxed{
\tau_E(0)=+\infty,
\qquad
\tau_E(1)=\bar\tau_E<\infty.
}
\]

Equivalent choice-set representation:

\[
\mathcal R_i(0)=\{I,T,A\},
\]

\[
\mathcal R_i(1)=\{I,E,T,A\}.
\]

Do not introduce a second baseline implementation parameter \(\eta\).

## 8.4 Deliverables

Create:

- `03_internal_external_technologies.tex`
- explicit table mapping old objects to new primitives.

## 8.5 Audit gate

Confirm:

- \(I\) and \(E\) are technologically and organizationally distinct;
- \(E\) retains authorization/holder responsibility;
- \(M\) changes only institutional feasibility/friction;
- CMO scarcity is not yet treated as exogenous policy relief.

---

# 9. Phase 4 — Route Values and Organizational Sorting

## 9.1 Internal route value

Derive:

\[
\boxed{
W_i^I(q,m)
=
s(q)R\!\left(q,c_I(m,k_i)\right)
-
F_I(m,k_i).
}
\]

## 9.2 Entrusted route value

Given manufacturing-service price \(p_m\):

\[
\boxed{
W_i^E(q,m;M,p_m)
=
s(q)R\!\left(q,c_E(m)\right)
-
F_E(m)
-
p_m b(m)
-
\mu_E
-
\tau_E(M).
}
\]

## 9.3 Transfer route

Retain as a noncore outside option:

\[
\boxed{
W^T(q,m)=T(q,m).
}
\]

Impose only the regularity assumptions needed for comparative statics.

Do not build a second endogenous transfer market in the baseline.

## 9.4 Abandonment

Normalize:

\[
\boxed{
W^A=0.
}
\]

## 9.5 Deterministic baseline route choice

Define:

\[
\boxed{
W_i(q,m;M,p_m)
=
\max
\left\{
W_i^I,
W_i^E,
W^T,
0
\right\}.
}
\]

and:

\[
r_i^*(q,m;M,p_m)
=
\arg\max_r W_i^r.
\]

Assume continuous project heterogeneity so that ties occur with measure zero.

**Do not use logit here.**

## 9.6 Organizational cutoff

Define:

\[
\Delta_{IE}(k_i)
=
W_i^I-W_i^E.
\]

Show explicitly:

\[
\frac{\partial \Delta_{IE}}{\partial k_i}>0.
\]

Under the required regularity conditions, derive a unique cutoff:

\[
\boxed{
k^*(q,m;p_m,M)
}
\]

such that:

\[
W^I(q,m,k^*)=W^E(q,m;p_m,M).
\]

Conditional on \(I/E\) dominating \(T/A\):

\[
k_i<k^*
\Rightarrow E,
\]

\[
k_i>k^*
\Rightarrow I.
\]

Derive:

\[
\frac{\partial k^*}{\partial \tau_E}<0,
\]

and:

\[
\frac{\partial k^*}{\partial p_m}<0.
\]

Interpret correctly:

- lower \(\tau_E\) expands the entrusted-production region;
- higher \(p_m\) contracts it.

## 9.7 Deliverables

Create:

- `04_route_values_and_sorting.tex`
- proposition draft for organizational sorting
- full implicit-function derivation.

## 9.8 Audit gate

Before proceeding, check:

- route comparison is not tautological;
- MAH may have zero effect on many projects;
- transfer and abandonment remain valid outside options;
- no route share is generated by logit.

---

# 10. Phase 5 — R&D Problem

## 10.1 R&D technology

Developer chooses:

\[
x_i\geq0.
\]

Project-arrival intensity:

\[
\boxed{
\lambda_i^{plan}=a_ix_i.
}
\]

R&D cost:

\[
\boxed{
C_R(x_i)
=
\frac{\kappa}{1+\nu}
x_i^{1+\nu},
\qquad
\kappa>0,\;\nu>0.
}
\]

Quadratic R&D cost is the special case \(\nu=1\).

## 10.2 Expected value of a route-planning-stage project

Define:

\[
\boxed{
\Omega_i(M,p_m)
=
E_{q,m}
\left[
W_i(q,m;M,p_m)
\right].
}
\]

This object replaces the theoretical-baseline log-sum inclusive value.

## 10.3 Ex ante R&D problem

Solve:

\[
\boxed{
\max_{x_i\geq0}
\left\{
\beta a_ix_i\Omega_i(M,p_m)
-
\frac{\kappa}{1+\nu}x_i^{1+\nu}
\right\}.
}
\]

Derive FOC:

\[
\boxed{
\kappa x_i^\nu
=
\beta a_i\Omega_i(M,p_m).
}
\]

Hence:

\[
\boxed{
x_i^*(M,p_m)
=
\left[
\frac{\beta a_i}{\kappa}
\Omega_i(M,p_m)
\right]^{1/\nu}.
}
\]

Check SOC and corner cases.

## 10.4 Akcigit-style value-gap foundation

In the appendix only, show the equivalent interpretation:

- no-project continuation value: \(B_i\);
- value after obtaining a route-planning-stage project: \(K_i=B_i+\Omega_i\).

Then:

\[
K_i-B_i=\Omega_i.
\]

Therefore the R&D FOC is interpretable as:

\[
C_R'(x_i)
=
\beta a_i(K_i-B_i).
\]

Do **not** introduce an artificial recursive Bellman with unnecessary states merely for appearance.

## 10.5 Deliverables

Create:

- `05_rd_problem.tex`
- full FOC/SOC derivation
- value-gap foundation subsection.

## 10.6 Audit gate

Confirm:

- R&D is ex ante;
- route choice is downstream;
- \(a_i\) scales project-generation productivity;
- \(k_i\) affects project value through manufacturing organization, not research technology;
- MAH affects R&D only through \(\Omega_i\).

---

# 11. Phase 6 — CMO Supply and Demand

## 11.1 CMO capacity problem

CMO \(j\) has efficiency \(z_j\) and chooses qualified capacity:

\[
s_j\geq0.
\]

Cost:

\[
\Psi(s_j;z_j)
\]

with:

\[
\Psi_s>0,
\qquad
\Psi_{ss}>0,
\qquad
\Psi_{sz}<0.
\]

Solve:

\[
\boxed{
\max_{s_j\geq0}
\left\{
p_ms_j-\Psi(s_j;z_j)
\right\}.
}
\]

FOC:

\[
p_m=\Psi_s(s_j;z_j).
\]

Derive:

\[
s_j=s(p_m,z_j),
\qquad
s_p>0.
\]

Aggregate supply:

\[
\boxed{
S_m(p_m)
=
\int s(p_m,z_j)dH_C(z_j).
}
\]

## 11.2 Entrusted-route demand

Each entrusted project with manufacturing requirement \(m\) uses:

\[
b(m)
\]

units of qualified capacity.

Developer \(i\)'s expected demand is:

\[
a_ix_i^*
\int
b(m)
\mathbf 1
\left\{
r_i^*(q,m;M,p_m)=E
\right\}
dF(q,m).
\]

Aggregate study-related demand:

\[
D_m^{MAH}(p_m;M)
=
\int
a_ix_i^*
\int
b(m)
\mathbf 1\{r_i^*=E\}
dF
\,dH(a,k).
\]

Retain exogenous background demand:

\[
D_m^B(p_m)
\]

so that the CMO market may exist before MAH.

Total demand:

\[
\boxed{
D_m(p_m;M)
=
D_m^B(p_m)
+
D_m^{MAH}(p_m;M).
}
\]

## 11.3 Market clearing

Define:

\[
\boxed{
D_m(p_m^*;M)
=
S_m(p_m^*).
}
\]

State sufficient regularity conditions for existence and uniqueness.

Do not close any other market.

## 11.4 Deliverables

Create:

- `06_cmo_supply_demand_equilibrium.tex`
- existence/uniqueness proof
- monotonicity audit.

## 11.5 Audit gate

Verify carefully that:

- route choice depends on \(p_m\);
- R&D depends on \(p_m\) through route value;
- demand therefore includes both intensive R&D response and route-selection response;
- supply is upward sloping from an explicit CMO optimization problem;
- no circularity is left unresolved.

---

# 12. Phase 7 — Equilibrium Definition

Define a baseline MAH partial equilibrium as:

\[
\boxed{
\left\{
p_m^*,
x_i^*,
r_i^*(q,m),
s_j^*
\right\}.
}
\]

Given:

\[
M,
\quad
H(a,k),
\quad
F(q,m),
\quad
H_C(z),
\]

and exogenous market primitives, the equilibrium must satisfy:

1. optimal commercialization route choice;
2. optimal developer R&D;
3. optimal CMO capacity;
4. manufacturing-service market clearing.

Nothing else.

Create:

- `07_equilibrium_definition.tex`

Audit specifically that no entry, firm distribution, labor market, capital market, or product-market aggregate clearing condition has slipped in.

---

# 13. Phase 8 — Required Propositions

Codex must organize the theory around the following propositions only, unless an additional lemma is mathematically necessary.

## Proposition 1 — Organizational sorting

Show the internal-versus-entrusted cutoff in \(k_i\).

Main economic content:

\[
k_i\uparrow
\Rightarrow
I\text{ becomes more attractive relative to }E.
\]

## Proposition 2 — MAH-relevant project set

Define pre-MAH value:

\[
W_i^0(q,m)
=
\max
\{W_i^I,W^T,0\}.
\]

Post-MAH value at a given support price:

\[
W_i^1(q,m;p_m)
=
\max
\{W_i^0,W_i^E\}.
\]

Then:

\[
\boxed{
W_i^1-W_i^0
=
\left[
W_i^E-W_i^0
\right]_+.
}
\]

Define:

\[
\boxed{
\mathcal C_i(p_m)
=
\left\{
(q,m):
W_i^E(q,m;p_m)>W_i^0(q,m)
\right\}.
}
\]

Only this set receives a direct project-value gain.

## Proposition 3 — R&D response and heterogeneity

Define:

\[
\Delta\Omega_i
=
E_{q,m}
\left[
\left(
W_i^E-W_i^0
\right)_+
\right].
\]

Show:

\[
\Delta x_i>0
\iff
\Delta\Omega_i>0.
\]

Using:

\[
x_i^*
=
\left(
\frac{\beta a_i\Omega_i}{\kappa}
\right)^{1/\nu},
\]

show that the level response scales with research capability:

\[
a_i\uparrow
\Rightarrow
|\Delta x_i|\uparrow
\]

under the maintained structure.

Then derive sufficient conditions under which:

\[
k_i\uparrow
\Rightarrow
\Delta x_i\downarrow.
\]

Do not assert this without proving the required regularity conditions.

The intended empirical implication is:

\[
\boxed{
\text{response strongest for high-}a_i
\text{ and low/intermediate-}k_i.
}
\]

## Proposition 4 — CMO equilibrium existence and uniqueness

Provide sufficient conditions under which:

\[
\exists!\;p_m^*(M).
\]

## Proposition 5 — CMO scarcity attenuation

Let:

\[
p_m^0
\]

be the pre-reform/background-market equilibrium price.

If reform activates positive entrusted-route demand, establish conditions for:

\[
p_m^1\geq p_m^0.
\]

Since:

\[
\frac{\partial W_E}{\partial p_m}
=
-b(m)<0,
\]

define the fixed-price/direct effect:

\[
\Delta\Omega_i^{dir}
=
E
\left[
\left(
W_E(p_m^0)-W_i^0
\right)_+
\right].
\]

Define the equilibrium effect:

\[
\Delta\Omega_i^{eq}
=
E
\left[
\left(
W_E(p_m^1)-W_i^0
\right)_+
\right].
\]

Prove:

\[
\boxed{
0
\leq
\Delta\Omega_i^{eq}
\leq
\Delta\Omega_i^{dir}.
}
\]

Then map to R&D:

\[
\boxed{
0
\leq
\Delta x_i^{eq}
\leq
\Delta x_i^{dir}.
}
\]

**Important interpretation:** in the binary route-addition baseline, CMO scarcity attenuates the reform's private-value gain; it does not make the old choice set worse because \(I,T,A\) remain available.

## Proposition 6 — Observed outcomes

Planning-stage project arrival:

\[
\boxed{
\Lambda_i^{plan}=a_ix_i^*.
}
\]

Observed retained original-drug outcome:

\[
\boxed{
Y_i^{ret}
=
a_ix_i^*
\int
s(q)
\left[
\mathbf 1\{r_i^*=I\}
+
\mathbf 1\{r_i^*=E\}
\right]
dF(q,m).
}
\]

Observed entrusted retained outcome:

\[
\boxed{
Y_i^E
=
a_ix_i^*
\int
s(q)
\mathbf 1\{r_i^*=E\}
dF(q,m).
}
\]

Decompose changes into:

1. R&D/project-arrival response;
2. commercialization reassignment toward \(E\).

Do not add a direct MAH-induced realization-probability channel in the baseline.

---

# 14. Phase 9 — Observed Outcomes and Data Boundary

Create `09_observed_outcomes.tex`.

The model must preserve the distinction between:

\[
\text{R\&D effort}
\]

\[
\text{route-planning-stage project arrival}
\]

\[
\text{commercialization route}
\]

and

\[
\text{observed approval/launch/retained product}.
\]

Approval-side data generally do **not** directly identify:

- \(x_i\);
- \(a_i\);
- \(s(q)\);
- \(\tau_E\);
- \(\mu_E\);
- \(p_m\);

separately.

The empirical section may discipline composite objects.

Primitive-complete theory does **not** imply primitive-by-primitive empirical identification.

---

# 15. Phase 10 — Empirical Mapping Interface

Create `10_empirical_mapping.tex`.

Use the following provisional mapping:

| Model object | Economic meaning | Potential empirical proxy/moment |
|---|---|---|
| \(a_i\) | research capability | pre-reform original-drug activity, R&D, patents, scientific labor |
| \(k_i\) | internal manufacturing capability | pre-reform production licenses/capacity/assets |
| \(q\) | project commercial/scientific value | therapeutic/market-size/target-value proxies |
| \(m\) | manufacturing complexity | modality, dosage form, biologic/sterile/technical class |
| \(r^*=E\) | retained holder–producer separation | holder different from manufacturer |
| \(a_ix_i\) | route-planning project arrival | IND/application-side outcomes when available |
| \(Y_i^{ret}\) | realized retained original drug | approval/launch outcome |
| \(p_m^*\) | qualified manufacturing scarcity | price if available; otherwise capacity/density proxies |
| \(T(q,m)\) | transfer outside option | future transfer/license moments if available |

Do not hard-code unavailable data.

Leave interfaces where future data can be inserted.

---

# 16. Phase 11 — Explicit Extensions, Not Baseline

Create `11_extensions_not_baseline.tex`.

The following belong here only.

## 16.1 Smooth route choice

If quantitative implementation later requires route shares, introduce:

\[
W_{ir}+\epsilon_{ir}
\]

with Type-I EV shocks.

Then derive logit probabilities.

The deterministic model remains the theoretical baseline.

## 16.2 Route-specific implementation probability

If later data justify it, introduce:

\[
\chi^I,\chi^E
\]

as an extension.

Do not allow MAH to automatically increase \(\chi^E\) without separate institutional and empirical justification.

## 16.3 Transfer-market microfoundation

A Serrano-style transfer/adoption-cost or bargaining block may later microfound:

\[
T(q,m).
\]

Do not endogenize it now.

## 16.4 Dynamic firm evolution

A true recursive Bellman may be added only if a future research question requires a genuine state transition such as:

- accumulated manufacturing capability;
- persistent product portfolio;
- firm entry/exit;
- endogenous transition from research-oriented developer to integrated incumbent.

No fake Bellman foundation.

## 16.5 Multi-CMO / matching structure

A richer matching/search model can be considered only if the data contain identifiable match-level information.

---

# 17. Phase 12 — Old-to-New Model Crosswalk

Create `05_old_to_new_model_crosswalk.md`.

Minimum required mapping:

| Current object | New treatment |
|---|---|
| \(R_i^{event}\) | delete; derive from \(y(p;q)\rightarrow\pi(q,c)\rightarrow R(q,c)\) |
| \(\bar R_i^E\) | delete; derive through external manufacturing cost |
| arbitrary \(v\) | remove from baseline; optional value-gap interpretation only |
| \(C^I(k_i)\) | replace with \(c_I(m,k_i)\) and \(F_I(m,k_i)\) |
| \(h_i^I\) | delete; feasibility comes from internal technology/cost |
| \(q_i^E\) | delete from baseline; project/manufacturer feasibility handled structurally |
| \(\mu_i^E\) | retain conceptually as holder-side burden; simplify notation if possible |
| \(M\) | retain as binary MAH regime |
| \(\eta\) | remove from baseline |
| \(\zeta_i^E(M,p_m)\) | remove from baseline |
| logit \(P_i(r)\) | move to quantitative extension |
| inclusive value \(\Gamma_i\) | remove from theoretical baseline |
| \(\Delta\Gamma^{set}>0\) proposition | delete |
| quadratic R&D cost | generalize to \(\kappa x^{1+\nu}/(1+\nu)\) |
| \(x_i^*=\beta a_i\Gamma_i/\kappa\) | replace with \([(\beta a_i/\kappa)\Omega_i]^{1/\nu}\) |
| CMO market | retain, but microfound both supply and demand |
| planning vs observed outcomes | retain |
| transfer route | retain as noncore outside option |
| entry module | exclude from baseline |

For every removed object, identify all equations, propositions, paragraphs, calibration claims, and appendix references that depend on it.

---

# 18. Phase 13 — Equation Dependency Map

Create/update `02_equation_dependency_map.md`.

The dependency order must be:

```text
A, q, epsilon
    ↓
demand y(p;q)
    ↓
optimal price p*(c)
    ↓
operating profit pi(q,c)
    ↓
PV R(q,c)

m, k_i
    ↓
c_I(m,k_i), F_I(m,k_i)
    ↓
W_I

m, CMO technology, p_m
    ↓
c_E(m), b(m), F_E(m), mu_E, tau_E(M)
    ↓
W_E

T(q,m)
    ↓
W_T

W_I, W_E, W_T, 0
    ↓
route choice r*
    ↓
project value W=max{...}
    ↓
Omega_i=E[W]
    ↓
R&D x_i*

CMO cost Psi(s;z)
    ↓
CMO supply S_m(p_m)

x_i*, r*, b(m)
    ↓
CMO demand D_m(p_m;M)

D_m = S_m
    ↓
p_m*
    ↺ feedback to W_E, r*, Omega_i, x_i*
```

The feedback loop must be explicitly acknowledged and solved as an equilibrium fixed point.

---

# 19. Phase 14 — Assumption Discipline

Create `03_assumptions_and_scope.md`.

Separate assumptions into four blocks.

## A. Demand and commercial-return assumptions

Examples:

- \(A>0\);
- \(\varepsilon>1\);
- \(\beta\in(0,1)\);
- \(\varphi\in[0,1)\).

## B. Manufacturing technology assumptions

Examples:

\[
c_{I,m}>0,\quad c_{I,k}<0,
\]

\[
F_{I,m}>0,\quad F_{I,k}<0,
\]

\[
b'(m)>0.
\]

## C. R&D assumptions

\[
a_i>0,\quad \kappa>0,\quad\nu>0.
\]

## D. CMO-market regularity

State only assumptions actually needed for existence/uniqueness.

Every proposition must list exactly which assumptions it uses.

Do not place desired comparative-static signs directly into assumptions unless economically primitive and independently defensible.

---

# 20. Phase 15 — Comparative-Static Proof Standards

Create `08_comparative_statics.tex`.

For each result:

1. state the object being differentiated;
2. state what is held fixed;
3. distinguish fixed-\(p_m\) from equilibrium-\(p_m^*\) effects;
4. show the algebra;
5. state sufficient sign conditions;
6. provide the economic interpretation;
7. identify the empirical prediction;
8. identify any case where the effect can be zero.

Do not write:

\[
MAH\Rightarrow innovation\uparrow
\]

without showing the intermediate project-value channel.

For the binary policy \(M\), use finite comparisons rather than taking meaningless derivatives with respect to a binary variable.

---

# 21. Phase 16 — Main Text / Appendix Split

Only after Phases 1–15 pass audits, produce:

- `13_main_text_model_candidate.tex`
- `14_appendix_model_candidate.tex`

## 21.1 Main-text model should be restrained

Suggested structure:

### 3.1 Environment and timing
- \(a_i,k_i\);
- project draw \((q,m)\);
- binary \(M\);
- R&D before route choice.

### 3.2 Commercialization technologies
- derived \(R(q,c)\);
- \(W_I\);
- \(W_E\);
- \(W_T\);
- \(W_A=0\).

### 3.3 Organization and R&D
- deterministic route choice;
- \(\Omega_i\);
- R&D FOC.

### 3.4 Qualified manufacturing-service equilibrium
- CMO supply;
- demand;
- market clearing.

### 3.5 Main predictions
Only the economically important propositions.

## 21.2 Appendix must contain full density

Include:

- demand derivation;
- pricing FOC/SOC;
- profit derivation;
- route payoff accounting;
- cutoff proof;
- R&D FOC/SOC;
- CMO capacity FOC;
- existence/uniqueness proof;
- comparative-static proofs;
- observed-outcome derivations;
- value-gap foundation;
- quantitative logit extension;
- optional transfer extension.

Target density: a first-year economics PhD student should be able to reproduce the derivations.

---

# 22. Phase 17 — Consistency Audit Before Manuscript Integration

Create `07_consistency_audit.md`.

Audit every occurrence of:

- \(M\);
- \(\tau_E\);
- \(p_m\);
- \(a_i\);
- \(k_i\);
- \(q\);
- \(m\);
- \(s(q)\);
- \(W_I,W_E,W_T\);
- \(\Omega_i\);
- \(x_i\).

Questions to answer:

1. Is the object defined once and used consistently?
2. Is it primitive or endogenous?
3. Can MAH shift it directly?
4. Does the text ever give it a second economic interpretation?
5. Does empirical mapping overclaim identification?
6. Does the proposition use equilibrium or fixed-price values consistently?
7. Is a planning-stage object ever confused with an observed approval?
8. Is a retained route ever confused with ownership transfer?
9. Is CMO price treated as endogenous everywhere?
10. Does any old logit/inclusive-value language remain in the theoretical baseline?

No integration into the manuscript until this audit returns no P0 errors.

---

# 23. Phase 18 — Manuscript Integration

Only after explicit approval of the derivation draft:

1. back up the current manuscript;
2. replace only the Model and directly dependent theoretical sections;
3. update Introduction wording where it describes the old mechanism;
4. update empirical-mapping language where it references obsolete objects;
5. update references;
6. update appendix cross-references;
7. compile;
8. run equation-number and label audit;
9. run notation audit;
10. prepare a diff summary.

Do not rewrite unrelated institutional or empirical sections.

---

# 24. Required Status File

Maintain `00_model_closure_status.md`.

Use a table like:

| Phase | Status | Main output | P0 issue | Approved to continue? |
|---|---|---|---|---|
| 1 Objects/timing | NOT STARTED | 01_primitives_and_timing.tex | — | No |
| 2 Demand/profit | NOT STARTED | 02_demand_profit_derivation.tex | — | No |
| 3 Technologies | NOT STARTED | 03_internal_external_technologies.tex | — | No |
| 4 Routes/sorting | NOT STARTED | 04_route_values_and_sorting.tex | — | No |
| 5 R&D | NOT STARTED | 05_rd_problem.tex | — | No |
| 6 CMO equilibrium | NOT STARTED | 06_cmo_supply_demand_equilibrium.tex | — | No |
| 7 Equilibrium definition | NOT STARTED | 07_equilibrium_definition.tex | — | No |
| 8 Comparative statics | NOT STARTED | 08_comparative_statics.tex | — | No |
| 9 Outcomes | NOT STARTED | 09_observed_outcomes.tex | — | No |
| 10 Empirical mapping | NOT STARTED | 10_empirical_mapping.tex | — | No |
| 11 Extensions | NOT STARTED | 11_extensions_not_baseline.tex | — | No |
| 12 Crosswalk/audit | NOT STARTED | notes files | — | No |
| 13 Full derivation draft | NOT STARTED | 12_full_derivation_draft.tex | — | No |
| 14 Main/appendix candidate | NOT STARTED | 13/14 tex | — | No |
| 15 Integration | BLOCKED | manuscript | — | No |

Update after every completed phase.

---

# 25. Required Open-Issues Log

Maintain `06_open_issues_log.md`.

Each issue must have:

```text
ID:
Phase:
Equation/object:
Issue:
Why it matters economically:
Why it matters mathematically:
Candidate resolutions:
Preferred resolution:
Does this alter the locked architecture? YES/NO
Approval required before change? YES/NO
```

If a proposed resolution changes any red-line item, stop. Do not implement without approval.

---

# 26. Proof and Algebra QA

For every FOC or derivative:

- independently re-derive it once;
- check dimensions;
- check limiting cases;
- check the economic sign.

Required limiting-case checks include:

### Internal capability

\[
k_i\rightarrow\infty
\]

should weakly favor internal manufacturing.

### Prohibitive internal capability

If:

\[
k_i<\underline k(m)
\]

then internal manufacturing must be infeasible.

### Pre-MAH

\[
M=0
\]

must remove \(E\) from the effective route set.

### Infinite CMO price

As:

\[
p_m\rightarrow\infty,
\]

\(E\) should cease to be optimal, without reducing the value of the old route set.

### Zero entrusted-route advantage

If:

\[
W_E\leq W_i^0
\quad \forall(q,m),
\]

then:

\[
\Delta\Omega_i=0,
\qquad
\Delta x_i=0.
\]

### No CMO scarcity

With perfectly elastic CMO supply at \(\bar p_m\), equilibrium attenuation disappears.

### Quadratic R&D

For:

\[
\nu=1,
\]

verify:

\[
x_i^*
=
\frac{\beta a_i}{\kappa}\Omega_i.
\]

These checks are mandatory.

---

# 27. Economic Interpretation QA

Every mathematical result must have a one-paragraph economic interpretation, but avoid tautological language.

Bad:

> Lower external friction raises external value, which raises innovation.

Required:

> MAH expands the set of organizational technologies available to developers whose projects require manufacturing capabilities they do not efficiently possess internally. The resulting value gain is concentrated among project–firm pairs for which retained entrusted production dominates both internal production and non-retained transfer. Because ex ante R&D is chosen before project characteristics are realized, the expected measure and surplus of these newly commercializable project draws raises the marginal return to R&D. The effect is stronger for developers with greater research productivity and weaker internal manufacturing capability, while endogenous scarcity in qualified manufacturing capacity attenuates the gain.

---

# 28. What Codex Is Explicitly Not Asked to Do Yet

Do not:

- estimate the model;
- calibrate parameters;
- choose empirical proxies;
- run counterfactuals;
- add welfare;
- add firm entry;
- add product portfolio dynamics;
- write the final Introduction;
- rewrite the entire paper;
- produce a final JDE submission draft.

The immediate objective is a **formally correct, economically disciplined derivation stack**.

---

# 29. First Execution Command

Start only with **Phase 1**.

The first work session should:

1. create the model-rebuild workspace;
2. create `00_model_closure_status.md`;
3. create `01_symbols_and_objects.md`;
4. create `02_equation_dependency_map.md`;
5. create `03_assumptions_and_scope.md`;
6. draft `01_primitives_and_timing.tex`;
7. produce a short Phase-1 audit.

Do **not** start Phase 2 in the same run unless Phase 1 has no unresolved P0 issue.

At the end, report:

```text
PHASE 1 STATUS:
Files created/modified:
Locked objects reproduced correctly:
Potential inconsistencies with current manuscript:
P0 issues:
P1 issues:
Recommended next action:
```

---

# 30. Definition of Success

The rebuild is successful only if the final model allows the paper to say, truthfully and transparently:

1. MAH changes one clearly defined institutional primitive.
2. Internal and entrusted manufacturing values are derived from explicit technologies and commercial profits.
3. Organizational route choice is endogenous.
4. R&D incentives depend on the endogenous expected value of future commercialization opportunities.
5. The reform affects only a subset of project–firm pairs rather than mechanically raising all values.
6. The strongest response is derived for research-capable but manufacturing-constrained developers.
7. CMO scarcity is an equilibrium attenuation mechanism.
8. The model remains partial equilibrium and aligned with feasible empirical identification.
9. The theoretical baseline does not rely on logit option-value tautology.
10. All central comparative statics follow from a small set of interpretable economic primitives.

That is the target model.
