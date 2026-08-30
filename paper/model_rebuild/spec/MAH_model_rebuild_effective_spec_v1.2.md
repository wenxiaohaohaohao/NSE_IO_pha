# MAH Model Rebuild — Codex Execution Note



> **Effective specification version:** v1.2  
> **Precedence:** active user instruction > correction v1.2 > amendment v1.1 > this base note > legacy manuscript/model notes.  
> **Construction rule:** this file is a surgical derivative of the frozen base note. It is not a summary and does not replace the immutable source files in `spec/source/`.  
> **Source hashes:** base `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24`; v1.1 `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9`; v1.2 image `1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5`.  
> **Phase rule:** the formal state machine has Phase 1--18. `12_full_derivation_draft.tex` is assembled in Phase 15 and must be approved before Phase 16.

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
\text{ex ante original-drug innovation investment / project advancement}
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

> When research capability and the manufacturing capability required to commercialize an original-drug project need not reside in the same firm, how does a regulatory institution that permits a developer to retain marketing authorization while contracting with a qualified manufacturer alter commercialization assignment and ex ante original-drug project-advancement incentives?

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
\text{project advancement}.
}
\]


### Effective Precision on the Innovation Object (Amendment v1.1 + Correction v1.2)

The baseline control is canonically defined as

\[
\boxed{
x_i=\text{original-drug innovation investment / project-advancement intensity}.
}
\]

The term is deliberately broader than pure clinical-development effort: it covers investment that advances viable original-drug projects toward the commercialization-relevant route-planning stage. It is not generic upstream scientific research, basic-compound discovery, patent-generating effort, or patent applications themselves. Patent history may later proxy pre-existing capability \(a_i\), but patent applications are not the baseline endogenous outcome \(x_i\).

The project-value channel remains

\[
MAH\rightarrow \Omega_i\uparrow\rightarrow x_i^*\uparrow,
\]

under the proposition's stated conditions. It does not mechanically imply

\[
Patent\ Applications\uparrow.
\]

The phrase “original-drug” identifies the paper's non-generic innovative-drug domain. It must not be confused with the empirical novelty class \(g=O\), which is distinguished from \(g=\mathrm{Inc}\) within that domain.

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


- **Shi Gu (2024), “Production Outsourcing and Innovation: Evidence from China's Pharmaceutical Industry”:**
  empirical boundary and benchmark. The verified SSRN abstract reports increased clinical development among firms without production facilities, a patent-application decline among financially constrained firms concentrated in lower-value patents, and a stronger incremental-development response. The more detailed claims listed in the Phase 16/18 empirical checkpoint remain `UNVERIFIED` until the paper PDF is checked by page and table. Shi Gu is not an additional mother model, and its research-versus-development financial-constraint model must not enter the baseline.

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


21. Do **not** describe \(x_i\) as generic R&D effort if this wording could include upstream patent-generating research.
22. Do **not** claim that MAH must increase patent applications.
23. Do **not** claim that MAH must increase upstream scientific research.
24. Do **not** impose that MAH must increase breakthrough/original innovation.
25. Do **not** introduce separate controls \(x_i^R\) and \(x_i^D\), a binding financial constraint, or a research-versus-development resource-allocation block into the baseline without explicit approval.
26. Do **not** treat Shi Gu's negative patent result as a contradiction of the commercialization mechanism; patents are outside the baseline endogenous outcome unless an explicit research extension is activated.
27. Do **not** force the model to predict that original projects respond more strongly than incremental projects.
28. Do **not** redefine the paper as a financial-constraints paper.

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


## 5.1 Empirical novelty-class decomposition (not a new baseline state)

When empirical work distinguishes original/breakthrough-oriented and incremental/improved projects, use

\[
\boxed{g\in\{O,\mathrm{Inc}\}.}
\]

The label \(\mathrm{Inc}\) is used instead of \(I\) so that project class cannot be confused with internal route \(I\). The baseline retains one common control \(x_i\); no \(x_{ig}\) control is permitted without separate approval. Let

\[
\rho_g\geq0,\qquad \sum_g\rho_g=1,
\]

be the exogenous class share and let \((q,m)\sim F_g(q,m)\) conditional on class. The aggregate project distribution and expected value decompose as

\[
F(q,m)=\sum_g\rho_gF_g(q,m),
\qquad
\Omega_i=\sum_g\rho_g\Omega_{ig},
\]

where

\[
\Omega_{ig}(M,p_m)=E_{(q,m)\sim F_g}
\left[W_i(q,m;M,p_m)\right].
\]

If required for observed outcomes, use an exogenous, MAH-invariant downstream probability \(s_g(q)\). The baseline imposes no ordering between \(\Delta\Omega_{iO}\) and \(\Delta\Omega_{i\mathrm{Inc}}\). Any ranking requires an explicit primitive restriction and proof.

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

### Stage 1: Original-drug project-development / advancement investment

Developer \(i\) observes \((a_i,k_i)\) and chooses:

\[
x_i\geq0.
\]

The intensity of viable projects reaching the route-planning / commercialization-relevant development stage is

\[
\lambda_i^{plan}=a_ix_i.
\]

The control \(x_i\) is original-drug innovation investment / project-advancement intensity. It is not limited to pure clinical-development effort and is not patent applications. Upstream scientific research, patent generation, and basic-compound discovery are outside baseline timing and may have occurred before the project enters the model. This timing is deliberate because MAH changes downstream manufacturing/commercialization options rather than scientific discovery technology.

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
- timing of project-advancement investment versus route choice is unambiguous;
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

# 10. Phase 5 — Project-Development / Advancement Problem

## 10.1 Project-advancement technology

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

Project-development / advancement cost:

\[
\boxed{
C_X(x_i)
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

## 10.3 Ex ante project-advancement problem

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

- continuation value before an additional viable development-stage project is advanced: \(B_i\);
- value after a project reaches the commercialization-relevant route-planning stage: \(K_i=B_i+\Omega_i\).

Then:

\[
K_i-B_i=\Omega_i.
\]

Therefore the project-advancement FOC is interpretable as:

\[
C_R'(x_i)
=
\beta a_i(K_i-B_i).
\]

This is an Akcigit-style downstream project-value foundation, not a claim that MAH directly raises scientific research productivity. Do **not** introduce an artificial recursive Bellman with unnecessary states merely for appearance.

## 10.5 Deliverables

Create:

- `05_rd_problem.tex`
- full FOC/SOC derivation
- value-gap foundation subsection.

## 10.6 Audit gate

Confirm:

- project-advancement investment is ex ante;
- route choice is downstream;
- \(a_i\) scales project-generation productivity;
- \(k_i\) affects project value through manufacturing organization, not research technology;
- MAH affects project advancement only through \(\Omega_i\).

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
- project advancement depends on \(p_m\) through route value;
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
2. optimal developer project advancement;
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

## Proposition 3 — Project-advancement response and firm heterogeneity

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



The proposition concerns the intensity with which research-capable developers advance viable projects toward commercialization. It does not establish that MAH increases patent applications, basic research, scientific discovery, or breakthrough novelty.
\]


## Corollary — Novelty Composition Is Theoretically Ambiguous

For \(g\in\{O,\mathrm{Inc}\}\), define

\[
\Omega_{ig}^0=E_{F_g}[W_i^0(q,m)],
\qquad
\Omega_{ig}^1=E_{F_g}[\max\{W_i^0(q,m),W_i^E(q,m;p_m)\}],
\]

so that

\[
\boxed{
\Delta\Omega_{ig}=E_{F_g}\left[(W_i^E-W_i^0)_+\right].
}
\]

There is no baseline ordering between \(\Delta\Omega_{iO}\) and \(\Delta\Omega_{i\mathrm{Inc}}\). A stronger response for either class must follow from explicit primitive differences in manufacturing complexity, commercialization costs, downstream success probabilities, outside options, or other project characteristics. The empirical ranking in Shi Gu (2024) must not be hard-coded into theory.

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

Then map to project advancement:

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



Interpret \(\Lambda_i^{plan}\) as arrival/advancement of viable projects to the commercialization-relevant development stage. It is not limited to pure clinical effort and is not patent generation. Potential data counterparts such as IND/application activity or early clinical milestones require a separate measurement audit.
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



For \(g\in\{O,\mathrm{Inc}\}\), the common-control type-specific retained outcome is

\[
\boxed{
Y_{ig}^{ret}
=
a_ix_i^*\rho_g
\int s_g(q)
\left[
\mathbf 1\{r_i^*=I\}
+
\mathbf 1\{r_i^*=E\}
\right]
dF_g(q,m).
}
\]

The baseline must allow \(\Delta Y_{iO}^{ret}=0<\Delta Y_{i\mathrm{Inc}}^{ret}\) and the reverse. No sign ranking is imposed ex ante, and no separate \(x_{ig}\) control is created.
\]

Decompose changes into:

1. project-advancement/project-arrival response;
2. commercialization reassignment toward \(E\).

Do not add a direct MAH-induced realization-probability channel in the baseline.

---

# 14. Phase 9 — Observed Outcomes and Data Boundary

Create `09_observed_outcomes.tex`.



The empirical outcome hierarchy is

\[
\boxed{
\text{upstream research}
\neq
\text{project advancement}
\neq
\text{commercialization organization}
\neq
\text{realized product}.
}
\]

Patent applications are an upstream-research proxy and are outside the baseline endogenous outcome. IND/application or early-clinical activity may proxy project advancement after a measurement audit. Product-level holder--manufacturer separation may proxy route \(E\) only when identities, product, and timing are aligned. Approval or launch data are realized-product outcomes. A patent decline alone does not falsify the commercialization mechanism.

The model must preserve the distinction between:

\[
\text{original-drug innovation investment / project advancement}
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

| Model object | Economic meaning | Preferred empirical proxy/moment | Boundary |
|---|---|---|---|
| \(a_i\) | pre-existing capability to generate/advance viable projects | pre-policy clinical-development history, innovative-drug pipeline, scientific labor; patent history may proxy capability | patent history is not \(x_i\) |
| \(x_i\) | original-drug innovation investment / project-advancement intensity | not directly observed; candidate development-stage activity requires validation | not pure clinical effort and not patent applications |
| \(a_ix_i\) | viable projects reaching route-planning stage | IND/application-side activity or early clinical milestones when available | not approval/launch |
| \(k_i\) | internal manufacturing capability | pre-reform, project-compatible capacity evidence | licences/GMP scope alone need not equal realized capacity |
| \(q\) | project commercial/scientific value | therapeutic/market-size/target-value proxies | MAH-invariant primitive |
| \(m\) | manufacturing complexity | modality, dosage form, biologic/sterile/technical class | project-level requirement |
| \(r^*=E\) | retained holder–producer separation | product-level holder different from manufacturer | requires aligned identities, product and date |
| \(Y_i^{ret}\) | realized retained innovative product | approval/launch/marketing-licence outcome | downstream realization |
| \(g\in\{O,\mathrm{Inc}\}\) | empirical novelty class | verified regulatory classification | classifier, not control/state |
| patent applications | upstream-research proxy | patent records | outside baseline endogenous outcome |
| \(p_m^*\) / scarcity | qualified manufacturing-service scarcity | price if available; otherwise audited capacity/density proxies | proxy does not separately identify price |
| \(T(q,m)\) | transfer outside option | future transfer/license moments if available | not endogenized in baseline |



The theoretical anticipation channel and the realized sequence must be kept separate:

\[
MAH
\rightarrow
\text{anticipated availability/value of }E
\rightarrow
\Omega_i
\rightarrow
x_i,
\]

\[
x_i
\rightarrow
\text{planning-stage projects}
\rightarrow
r_i^*
\rightarrow
\text{observed holder--producer separation}
\rightarrow
\text{realized products}.
\]

Empirical tests may examine both sequences, but observed holder--producer separation must not be represented as an event that occurs before the ex ante choice of \(x_i\). Patent responses are informative but secondary to the baseline model.

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


## 16.6 Research-versus-Development Allocation Extension

An optional extension may distinguish upstream research \(x_i^R\) from development \(x_i^D\), possibly under a resource constraint, to study the empirical combination \(x_i^D\uparrow\) and \(x_i^R\downarrow\). This block is explicitly outside the baseline. It may not be implemented without separate approval because it adds dimensionality, shifts the research question toward financial constraints, and overlaps with Shi Gu (2024). The baseline contribution remains commercialization organization, retained authorization, manufacturing-capability matching, and CMO scarcity.

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


| \(x_i\) described as generic R&D effort | reinterpret as original-drug innovation investment / project-advancement intensity |
| \(a_ix_i\) described as generic innovation arrival | viable projects reaching the commercialization-relevant route-planning stage |
| patent applications as direct outcome of \(x_i\) | remove from baseline mapping |
| “MAH increases original innovation” | delete as a theoretical implication; treat novelty response as empirical heterogeneity |
| original vs incremental innovation | use \(\rho_g,F_g(q,m)\) with \(g\in\{O,\mathrm{Inc}\}\), not a new control/state |

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
project-development / advancement intensity x_i*

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



Empirical novelty decomposition:

```text
g ∈ {O, Inc}, rho_g, F_g(q,m), possibly s_g(q)
    ↓
type-specific reform gain Delta Omega_ig
    ↓
NO ex-ante sign ranking between O and Inc
```

Explicit exclusion:

```text
upstream patent-generating research
    ↛ not modeled as x_i in baseline
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

## C. Project-advancement assumptions

\[
a_i>0,\quad \kappa>0,\quad\nu>0.
\]

## D. CMO-market regularity

State only assumptions actually needed for existence/uniqueness.



No assumption may be imposed solely to guarantee \(\Delta\Omega_{iO}>0\), \(\Delta\Omega_{iO}>\Delta\Omega_{i\mathrm{Inc}}\), or an increase in patent applications. Any sufficient condition for a class ranking must be labeled as an extension, state the exact primitive restriction, and defend it economically.

Every proposition must list exactly which assumptions it uses.

Do not place desired comparative-static signs directly into assumptions unless economically primitive and independently defensible.

---

# 20. Phase 15 — Comparative-Static Proof Standards

Create `08_comparative_statics.tex`.

After all Phase 1--15 modules pass their own audits, assemble and compile `12_full_derivation_draft.tex`. Approval of that full draft is the entry condition for Phase 16.

For each result:

1. state the object being differentiated;
2. state what is held fixed;
3. distinguish fixed-\(p_m\) from equilibrium-\(p_m^*\) effects;
4. show the algebra;
5. state sufficient sign conditions;
6. provide the economic interpretation;
7. identify the empirical prediction;
8. identify any case where the effect can be zero.



Before interpreting any result, state whether it concerns upstream research, project advancement, commercialization-route choice, or realized product output. No proposition may use the generic word “innovation” when the mathematical object is more specific.

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



In Sections 3.1 and 3.3, use “original-drug innovation investment / project-advancement intensity” rather than generic “R&D effort,” unless the narrower meaning is explicitly defined. The appendix must include a short subsection, “Research versus Development: Boundary of the Baseline,” explaining that MAH changes downstream commercialization options, that \(x_i\) is broader than pure clinical effort but excludes patent-generating upstream research, and that Shi Gu (2024) shows these margins can differ.

## 21.1 Main-text model should be restrained

Suggested structure:

### 3.1 Environment and timing
- \(a_i,k_i\);
- project draw \((q,m)\);
- binary \(M\);
- project-advancement investment before route choice.

### 3.2 Commercialization technologies
- derived \(R(q,c)\);
- \(W_I\);
- \(W_E\);
- \(W_T\);
- \(W_A=0\).

### 3.3 Organization and project advancement
- deterministic route choice;
- \(\Omega_i\);
- project-advancement FOC.

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
- project-advancement FOC/SOC;
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


11. Is \(x_i\) ever described as patent-generating/upstream research or reduced to pure clinical-development effort?
12. Does any theoretical statement claim MAH must increase patent applications?
13. Does any statement claim MAH must increase original/breakthrough innovation?
14. Are original and incremental effects agnostic unless extra assumptions are stated?
15. Is Shi Gu's research-versus-development mechanism imported into baseline without approval?
16. Is “innovation” used too broadly where project advancement, route choice, or realized product is the actual object?

Any violation of questions 11--16 is a P0 terminology/mechanism error.

No integration into the manuscript until this audit returns no P0 errors.

---


## Shi Gu Empirical Boundary Checkpoint (required before Phase 16 claims and Phase 18 integration)

Create `model_notes/08_shigu_empirical_boundary_check.md`. Record source version, retrieval date, page/table location, and verdict for each detailed claim concerning: production-facility heterogeneity; first-stage trials; patent declines and financial constraints; high-value/granted/core patent outcomes; original versus incremental chemical drugs; original biological drugs; and pure-researcher transitions.

The SSRN abstract currently verifies only the core research/development boundary. Detailed items remain `UNVERIFIED` until checked in the formal paper PDF. `UNVERIFIED` does not block Phase 1--15 derivations, but it blocks Phase 16 empirical-boundary prose and Phase 18 manuscript integration. For every verified fact, state whether it is predicted by baseline, outside baseline, a heterogeneity test, or an extension motivation.

# 23. Phase 18 — Manuscript Integration



During integration: remove statements equating project-value gains with a generic rise in all R&D; distinguish research, project advancement, commercialization, and realized product outcomes; do not claim a positive original/breakthrough effect before the empirical section establishes it; treat original-versus-incremental heterogeneity as an empirical question; and position Shi Gu (2024) as related evidence without importing its financial-constraint mechanism into baseline.

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
| 5 Project advancement | NOT STARTED | 05_rd_problem.tex | — | No |
| 6 CMO equilibrium | NOT STARTED | 06_cmo_supply_demand_equilibrium.tex | — | No |
| 7 Equilibrium definition | NOT STARTED | 07_equilibrium_definition.tex | — | No |
| 8 Six propositions + corollary | NOT STARTED | proposition checklist/modules | — | No |
| 9 Outcomes/data boundary | NOT STARTED | 09_observed_outcomes.tex | — | No |
| 10 Empirical mapping | NOT STARTED | 10_empirical_mapping.tex | — | No |
| 11 Extensions | NOT STARTED | 11_extensions_not_baseline.tex | — | No |
| 12 Old-to-new crosswalk | NOT STARTED | 05_old_to_new_model_crosswalk.md | — | No |
| 13 Equation dependency map | NOT STARTED | 02_equation_dependency_map.md | — | No |
| 14 Assumption discipline | NOT STARTED | 03_assumptions_and_scope.md | — | No |
| 15 Comparative statics/full draft | NOT STARTED | 08_comparative_statics.tex; 12_full_derivation_draft.tex | — | No |
| 16 Main/appendix candidates | NOT STARTED | 13/14 tex | — | No |
| 17 Consistency audit | NOT STARTED | 07_consistency_audit.md | — | No |
| 18 Manuscript integration | BLOCKED | manuscript and final build | — | No |

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

> MAH expands the set of organizational technologies available to developers whose projects require manufacturing capabilities they do not efficiently possess internally. The resulting value gain is concentrated among project–firm pairs for which retained entrusted production dominates both internal production and non-retained transfer. Because ex ante project-advancement investment is chosen before project characteristics are realized, the expected measure and surplus of these newly commercializable project draws raises the marginal return to project advancement. The effect is stronger for developers with greater research productivity and weaker internal manufacturing capability, while endogenous scarcity in qualified manufacturing capacity attenuates the gain.

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


# 29A. Amendment v1.1/v1.2 Application Checkpoint

Before Phase 1, produce an amendment status report covering sections modified, new red lines, terminology, Phase 5, propositions, empirical mapping, extension boundary, conflicts with completed work, files requiring later revision, and P0 issues. The checkpoint must be marked `READY FOR APPROVAL` and must pause. Only explicit user approval permits the specification commit/push and entry into Phase 1.

If any already-completed rebuild work used \(x_i\) as generic upstream R&D, pure clinical effort, or a source of mandatory positive original-innovation effects, revise and re-audit that work before continuing. In the current locked checkout, the new rebuild has not yet started.

# 30. Definition of Success

The rebuild is successful only if the final model allows the paper to say, truthfully and transparently:

1. MAH changes one clearly defined institutional primitive.
2. Internal and entrusted manufacturing values are derived from explicit technologies and commercial profits.
3. Organizational route choice is endogenous.
4. The model identifies how MAH changes the expected value of advancing viable projects toward commercialization rather than mechanically increasing all upstream R&D.
5. The reform may have zero effect for many project–firm pairs and may affect original and incremental projects differently.
6. The strongest baseline firm-level response is derived for research-capable but manufacturing-constrained developers, while the original-versus-incremental ranking remains agnostic absent additional primitive restrictions.
7. CMO scarcity is an equilibrium attenuation mechanism.
8. The model remains partial equilibrium and aligned with feasible empirical identification.
9. The theoretical baseline does not rely on logit option-value tautology.
10. All central comparative statics follow from a small set of interpretable economic primitives.


11. The baseline is consistent with clinical development rising while patent applications do not.
12. The model need not explain patent reallocation unless the explicit research-versus-development extension is activated.
13. The empirical contribution remains commercialization organization, retained holder–producer separation, manufacturing mismatch, and CMO scarcity rather than a reproduction of Shi Gu's mechanism.

That is the target model.

---

## Effective-Spec Construction Record

- Frozen base SHA256: `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24`
- Frozen amendment v1.1 SHA256: `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9`
- Frozen correction v1.2 transcription SHA256: `06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E`
- Applied operations: 55
  - `GOV-HEADER`
  - `AMD11-A+AMD12-01`
  - `AMD11-A-MISSION-CHAIN`
  - `AMD11-A-RQ`
  - `AMD11-A-MECHANISM-END`
  - `AMD11-B`
  - `AMD11-C`
  - `AMD11-D`
  - `AMD11-E`
  - `AMD11-E-GATE`
  - `AMD11-F-TITLE`
  - `AMD11-F-SUBTITLE`
  - `AMD11-F-COST-LABEL`
  - `AMD11-F-CX`
  - `AMD11-F-PROBLEM`
  - `AMD11-G-FOC-LABEL`
  - `AMD11-G-VALUE-GAP`
  - `AMD11-G-INTERPRETATION`
  - `AMD11-F-GATE-1`
  - `AMD11-F-GATE-2`
  - `AMD11-H-TITLE`
  - `AMD11-H-INTERPRETATION`
  - `AMD11-I`
  - `AMD11-J-PLANNING`
  - `AMD11-J-TYPE-OUTCOMES`
  - `AMD11-J-DECOMP`
  - `AMD11-K`
  - `AMD11-K-HIERARCHY`
  - `AMD11-L-TABLE`
  - `AMD11-L-CHAIN`
  - `AMD11-M`
  - `AMD11-N`
  - `AMD11-O-LABEL`
  - `AMD11-O-BRANCHES`
  - `AMD11-P`
  - `AMD11-P-TITLE`
  - `AMD11-Q`
  - `GOV-FULL-DRAFT-PHASE15`
  - `AMD11-R`
  - `AMD11-R-TIMING`
  - `AMD11-R-SUBSECTION`
  - `AMD11-R-FOC`
  - `AMD11-S`
  - `AMD11-U`
  - `AMD11-T`
  - `GOV-18-PHASE-STATUS`
  - `AMD11-W`
  - `AMD11-V-REPLACE`
  - `AMD11-V-ADD`
  - `TERM:- R&D depends on \(p_m\) through`
  - `TERM:2. optimal developer R&D;`
  - `TERM:Then map to R&D:`
  - `TERM:- R&D FOC/SOC;`
  - `TERM:Because ex ante R&D is chosen be`
  - `TERM:raises the marginal return to R&`
