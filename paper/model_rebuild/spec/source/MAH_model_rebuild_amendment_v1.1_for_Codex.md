# MAH Model Rebuild — Amendment v1.1 for Codex

**Purpose:** Update only the affected parts of `MAH_model_rebuild_execution_note_for_Codex.md` after incorporating the empirical boundary revealed by Shi Gu (2024), *Production Outsourcing and Innovation: Evidence from China’s Pharmaceutical Industry*.

**Instruction to Codex:** This is an amendment, not a replacement of the prior execution note. Apply only the changes below. All other architecture, red lines, phases, and file structure remain unchanged unless explicitly modified here.

---

## A. Add to Section 0 "Mission" — Precision on the Innovation Object

### INSERT after the main mechanism chain

The baseline control \(x_i\) must **not** be interpreted as generic R&D, upstream scientific research, or patent-generating effort.

Replace the broad interpretation

\[
x_i=\text{R\&D effort}
\]

with the narrower object

\[
\boxed{
x_i=\text{innovation-project advancement / development effort}
}
\]

or, when a shorter label is needed,

\[
\boxed{
x_i=\text{project-development intensity}.
}
\]

Its economic role is to increase the flow of viable original-drug projects that reach the route-planning / commercialization-relevant development stage:

\[
\boxed{
\lambda_i^{plan}=a_i x_i.
}
\]

The intended empirical counterparts are closer to:

- IND/application activity;
- initiation of early-stage clinical development;
- first-stage clinical trials;
- advancement of viable drug candidates toward commercialization;

and **not** raw patent applications.

The model therefore studies how MAH changes the value of **advancing viable drug projects toward commercialization**, not how it directly changes upstream scientific discovery.

---

## B. Add to Section 1.2 "Supporting References" — Empirical Boundary Reference

### INSERT

- **Shi Gu (2024), “Production Outsourcing and Innovation: Evidence from China’s Pharmaceutical Industry”:**
  empirical boundary and benchmark. The paper finds that allowing production outsourcing increases clinical development among firms without production facilities, particularly early-stage and incremental drug development, while patent applications decline among financially constrained firms and high-value patenting does not significantly decline. This evidence requires the present model to distinguish downstream project development/commercialization from upstream research. Shi Gu is **not** an additional mother model.

Do not import Shi Gu’s research-versus-development financial-constraint model into the baseline.

---

## C. Add New Red Lines to Section 2

### APPEND the following red lines

21. Do **not** describe \(x_i\) as generic R&D effort if this wording could include upstream patent-generating research.
22. Do **not** claim that MAH must increase patent applications.
23. Do **not** claim that MAH must increase upstream scientific research.
24. Do **not** impose that MAH must increase breakthrough/original innovation.
25. Do **not** introduce separate controls \(x_i^R\) and \(x_i^D\), a binding financial constraint, or a research-versus-development resource-allocation block into the baseline without explicit approval.
26. Do **not** treat Shi Gu’s negative patent result as a contradiction of the commercialization mechanism; patents are outside the baseline endogenous outcome unless an explicit research extension is activated.
27. Do **not** force the model to predict that original-drug projects respond more strongly than incremental projects.
28. Do **not** redefine the paper as a financial-constraints paper.

---

## D. Modify Section 5 "Project Heterogeneity"

### KEEP the baseline two-dimensional project draw

\[
\boxed{
\omega=(q,m)\sim F(q,m)
}
\]

with:

- \(q\): project commercial/scientific value index;
- \(m\): manufacturing requirement / complexity.

### ADD a type-specific empirical heterogeneity layer without adding a new baseline state

When the paper distinguishes **original** and **incremental** innovation, define an empirical project class

\[
g\in\{O,I\},
\]

where:

- \(O\): original/breakthrough-oriented project class;
- \(I\): incremental/improved project class.

Do **not** add \(g\) as a new decision state unless needed. Instead, allow the project primitives to have type-specific distributions:

\[
(q,m)\sim F_g(q,m),
\]

and, if required,

\[
s_g(q)
\]

for the downstream realization probability.

Thus type-specific expected project values are

\[
\Omega_{ig}(M,p_m)
=
E_{(q,m)\sim F_g}
\left[
W_i(q,m;M,p_m)
\right].
\]

The baseline must remain **agnostic** about the ranking

\[
\Delta\Omega_{iO}
\quad\text{vs.}\quad
\Delta\Omega_{iI}.
\]

Do not assume either is larger.

Any ranking must come from additional primitive restrictions and must be proved rather than asserted.

---

## E. Modify Phase 1 Timing Language

### REPLACE Stage 1 label

Old:

> Stage 1: R&D

New:

> **Stage 1: Project-development / advancement investment**

Developer \(i\) observes \((a_i,k_i)\) and chooses

\[
x_i\ge 0.
\]

The intensity of viable projects reaching the route-planning / commercialization-relevant development stage is

\[
\lambda_i^{plan}=a_ix_i.
\]

### ADD timing clarification

Upstream scientific research, patent generation, and discovery of basic compounds are outside the baseline timing. They may have occurred before the project enters the model.

The model begins at the margin at which a developer decides how intensively to advance viable drug projects while anticipating future commercialization routes.

This timing is deliberate because MAH directly changes downstream manufacturing/commercialization options rather than scientific discovery technology.

---

## F. Modify Phase 5 — Rename the Entire Phase

### REPLACE

`Phase 5 — R&D Problem`

with

\[
\boxed{
\text{Phase 5 — Project-Development / Advancement Problem}
}
\]

### REPLACE subsection terminology throughout Phase 5

Old:

> R&D technology

New:

> **Project-advancement technology**

Old:

> R&D cost

New:

> **Project-development / advancement cost**

Retain the mathematical form

\[
C_X(x_i)
=
\frac{\kappa}{1+\nu}x_i^{1+\nu},
\qquad
\kappa>0,\;\nu>0.
\]

If the notation \(C_R\) is already embedded in working files, either:

1. replace it consistently with \(C_X\), or
2. retain \(C_R\) only if the text explicitly defines \(R\) as development-stage innovation investment rather than upstream research.

Preferred notation:

\[
\boxed{
C_X(x_i)
=
\frac{\kappa}{1+\nu}x_i^{1+\nu}.
}
\]

### REPLACE the optimization problem

\[
\boxed{
\max_{x_i\ge0}
\left\{
\beta a_i x_i\Omega_i(M,p_m)
-
\frac{\kappa}{1+\nu}x_i^{1+\nu}
\right\}.
}
\]

FOC remains:

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

### CHANGE the economic interpretation

The FOC must be described as:

> the marginal cost of advancing viable drug projects equals the marginal increase in route-planning-stage project arrival multiplied by the expected commercialization value of such a project.

Do not describe it as a prediction about patent-generating research effort.

---

## G. Modify the Akcigit-Style Value-Gap Foundation in Phase 5

### KEEP the value-gap logic, but change the interpretation

Let:

- \(B_i\): continuation value before an additional viable development-stage project is advanced;
- \(K_i=B_i+\Omega_i\): value after a project reaches the commercialization-relevant route-planning stage.

Then:

\[
K_i-B_i=\Omega_i.
\]

The FOC can be written as:

\[
C_X'(x_i)
=
\beta a_i(K_i-B_i).
\]

This is an Akcigit-style **downstream project-value foundation**, not a claim that MAH directly raises scientific research productivity.

---

## H. Modify Proposition 3

### RENAME

Old:

> Proposition 3 — R&D response and heterogeneity

New:

> **Proposition 3 — Project-advancement response and firm heterogeneity**

### KEEP the mathematical core

\[
x_i^*
=
\left(
\frac{\beta a_i\Omega_i}{\kappa}
\right)^{1/\nu}.
\]

Show:

\[
\Delta x_i>0
\iff
\Delta\Omega_i>0.
\]

Continue to derive the high-\(a_i\), low/intermediate-\(k_i\) response under the stated regularity conditions.

### CHANGE interpretation

The proposition establishes that MAH can increase the intensity with which research-capable developers advance viable projects toward commercialization.

It does **not** establish that MAH increases:

- patent applications;
- basic research;
- scientific discovery;
- breakthrough novelty.

---

## I. Add a New Corollary after Proposition 3

### NEW: Corollary — Novelty Composition Is Theoretically Ambiguous

For project class \(g\in\{O,I\}\), define:

\[
\Omega_{ig}^0
=
E_{F_g}
\left[
W_i^0(q,m)
\right],
\]

and

\[
\Omega_{ig}^1
=
E_{F_g}
\left[
\max\{W_i^0(q,m),W_i^E(q,m;p_m)\}
\right].
\]

Then:

\[
\boxed{
\Delta\Omega_{ig}
=
E_{F_g}
\left[
\left(
W_i^E-W_i^0
\right)_+
\right].
}
\]

The baseline imposes no ordering between:

\[
\Delta\Omega_{iO}
\quad\text{and}\quad
\Delta\Omega_{iI}.
\]

Therefore the model does not mechanically imply that MAH has a larger effect on original innovation than on incremental innovation.

Any result such as

\[
\Delta\Omega_{iI}
>
\Delta\Omega_{iO}
\]

must be obtained from explicit differences in:

- manufacturing complexity distributions;
- commercialization costs;
- downstream success probabilities;
- outside options;
- or other primitive project characteristics.

**Do not hard-code the empirical ranking found by Shi Gu into the theory.**

The empirical ranking is an object to be tested.

---

## J. Modify Proposition 6 — Observed Outcomes

### REPLACE the interpretation of planning-stage arrival

\[
\boxed{
\Lambda_i^{plan}=a_ix_i^*
}
\]

must be interpreted as:

> arrival/advancement of viable projects to the commercialization-relevant development stage.

Potential empirical counterparts include:

- IND submissions/acceptances;
- initial-stage clinical trials;
- initiation of drug development.

### KEEP retained realized outcome

\[
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
\]

### ADD type-specific observed outcomes

For \(g\in\{O,I\}\):

\[
\boxed{
Y_{ig}^{ret}
=
a_ix_{ig}^*
\int
s_g(q)
\left[
\mathbf 1\{r_i^*=I\}
+
\mathbf 1\{r_i^*=E\}
\right]
dF_g(q,m).
}
\]

If a common \(x_i\) is maintained across project classes, define the type-specific outcome using the appropriate project-arrival share rather than creating a separate control without approval.

The model must allow:

\[
\Delta Y_{iO}^{ret}=0
\]

while:

\[
\Delta Y_{iI}^{ret}>0,
\]

and vice versa.

No sign ranking is imposed ex ante.

---

## K. Modify Phase 9 — Observed Outcomes and Data Boundary

### ADD the following distinction

The empirical outcome hierarchy must be:

\[
\boxed{
\text{upstream research}
\neq
\text{project development}
\neq
\text{commercialization organization}
\neq
\text{realized product}.
}
\]

Map them as:

\[
\text{patent applications}
\rightarrow
\text{upstream research proxy},
\]

\[
\text{IND / early clinical trials}
\rightarrow
\text{project-development / advancement proxy},
\]

\[
\text{holder}\neq\text{manufacturer}
\rightarrow
E\text{-route organization proxy},
\]

\[
\text{approval / launch}
\rightarrow
\text{realized product outcome}.
\]

The baseline model directly predicts the middle three objects more naturally than upstream patenting.

A decline in patent applications is not, by itself, a falsification of the MAH commercialization mechanism.

---

## L. Modify Phase 10 — Empirical Mapping Table

### REPLACE relevant rows with

| Model object | Economic meaning | Preferred empirical proxy/moment |
|---|---|---|
| \(a_i\) | pre-existing capability to generate/advance viable drug projects | pre-policy clinical-development history, original-drug pipeline, R&D capability, scientific labor; patent history may be used as a capability proxy but not as \(x_i\) itself |
| \(x_i\) | project-development / advancement intensity | not directly observed; proxied by development-stage activity |
| \(a_ix_i\) | arrival/advancement of viable projects to route-planning stage | IND/application-side activity, first-stage clinical trials |
| patent applications | upstream research proxy | **outside baseline endogenous outcome**; may be used in an extension |
| \(k_i\) | internal manufacturing capability | pre-reform GMP/production-line capacity, ideally project-specific |
| \(r^*=E\) | retained holder–producer separation | holder/MAH different from manufacturer |
| \(Y_i^{ret}\) | realized retained innovative product | approval/launch/marketing-license outcome |
| \(g\in\{O,I\}\) | empirical novelty class | NMPA original vs incremental classification |
| \(p_m^*\) / scarcity | qualified manufacturing-service scarcity | pre-policy compatible GMP capacity / CMO density / capacity proxy |

### ADD

The main empirical mechanism chain should preferentially test:

\[
MAH
\rightarrow
\text{holder--producer separation}
\rightarrow
\text{project development}
\rightarrow
\text{realized retained products}.
\]

Patent responses are informative but secondary to the baseline model.

---

## M. Modify Phase 11 — Extensions Not Baseline

### ADD a new subsection

## 11.X Research-versus-Development Allocation Extension

Shi Gu (2024) documents that financially constrained firms may increase clinical development while reducing patent applications after production outsourcing becomes available.

A richer extension could introduce:

\[
x_i^R
=
\text{upstream research effort},
\]

\[
x_i^D
=
\text{development effort},
\]

possibly under a resource constraint:

\[
C_R(x_i^R)+C_D(x_i^D)\leq B_i.
\]

Such a model could generate:

\[
x_i^D\uparrow,
\qquad
x_i^R\downarrow
\]

when MAH raises the marginal return to development more than the marginal return to research.

**This extension is explicitly not part of the baseline.**

Do not implement it unless later approved, because:

1. it materially increases dimensionality;
2. it shifts the paper toward a research-versus-development allocation question;
3. that mechanism is already central in Shi Gu (2024);
4. the present paper’s intended distinctive contribution is commercialization organization, retained authorization, and manufacturing-capability matching.

---

## N. Modify Phase 12 — Old-to-New Model Crosswalk

### ADD/CHANGE the following row

| Current/previous object | Updated treatment |
|---|---|
| \(x_i\) described as generic R&D effort | **rename/reinterpret as project-development / advancement intensity** |
| \(a_ix_i\) described as generic innovation arrival | **interpret as viable projects reaching commercialization-relevant development / route-planning stage** |
| patent applications as direct outcome of \(x_i\) | **remove this mapping from baseline** |
| “MAH increases original innovation” | **delete as a theoretical implication; treat original vs incremental response as empirical/type-specific heterogeneity** |
| original vs incremental innovation | **introduce through type-specific distributions \(F_g(q,m)\), not a new baseline control/state** |

---

## O. Modify Phase 13 — Equation Dependency Map

### REPLACE the label

Old:

```text
Omega_i
    ↓
R&D x_i*
```

New:

```text
Omega_i
    ↓
project-development / advancement intensity x_i*
```

### ADD a side branch

```text
empirical novelty class g ∈ {O, I}
    ↓
type-specific primitive distributions F_g(q,m), possibly s_g(q)
    ↓
type-specific reform gain ΔOmega_ig
    ↓
NO ex-ante sign ranking between original and incremental effects
```

### ADD an explicit exclusion branch

```text
upstream patent-generating research
    ↛ not modeled as x_i in baseline
```

---

## P. Modify Phase 14 — Assumption Discipline

### ADD

No assumption may be imposed solely to guarantee:

\[
\Delta\Omega_{iO}>0,
\]

or:

\[
\Delta\Omega_{iO}>\Delta\Omega_{iI}.
\]

If a sufficient condition for stronger incremental effects is explored, it must be labeled an **extension**, and the exact primitive restriction must be stated and economically defended.

Similarly, no assumption may be imposed solely to force patent applications to rise after MAH.

---

## Q. Modify Phase 15 — Comparative-Static Proof Standards

### ADD the following required question for every innovation result

Before interpreting a comparative static, state explicitly:

> Does this result concern upstream research, development-stage project advancement, commercialization-route choice, or realized product output?

No proposition may use the generic word “innovation” where the mathematical object is more specific.

---

## R. Modify Phase 16 — Main Text / Appendix Split

### MAIN TEXT terminology change

In Section 3.1 and 3.3, use:

> project-development effort / project-advancement intensity

instead of generic:

> R&D effort

unless the surrounding text explicitly defines the narrower meaning.

### APPENDIX addition

Add a short subsection:

> **Research versus Development: Boundary of the Baseline**

Explain that MAH directly changes downstream commercialization options. The baseline therefore models the advancement of viable drug projects and does not model upstream patent-generating research. Cite Shi Gu (2024) as evidence that these margins can respond differently.

---

## S. Modify Phase 17 — Consistency Audit

### ADD audit questions

11. Is \(x_i\) ever described as patent-generating or upstream research effort?
12. Does any theoretical statement claim MAH must increase patent applications?
13. Does any statement claim MAH must increase original/breakthrough innovation?
14. Are original and incremental effects treated as theoretically ambiguous unless extra assumptions are stated?
15. Is Shi Gu’s research-versus-development mechanism being imported into the baseline without approval?
16. Is “innovation” used too broadly where “project development,” “route choice,” or “realized product” is the actual object?

Any violation is a P0 terminology/mechanism error.

---

## T. Modify Phase 18 — Manuscript Integration Rules

### ADD

When integrating the rebuilt model into the manuscript:

1. remove old statements equating MAH-induced project-value gains with a generic rise in all R&D;
2. distinguish clearly between research, development, commercialization, and realized innovation;
3. do not claim a positive effect on original innovation before the empirical section establishes it;
4. present original-versus-incremental heterogeneity as an empirical question informed by type-specific project primitives;
5. position Shi Gu (2024) as closely related evidence on short-run research/development allocation, while distinguishing the present paper by its focus on retained authorization, holder–manufacturer assignment, project-specific manufacturing mismatch, and CMO scarcity.

---

# U. Add a New Empirical Checkpoint Before Final Manuscript Integration

Before the final theoretical claims are frozen, create a short note:

`model_notes/08_shigu_empirical_boundary_check.md`

It must record the following empirical facts from Shi Gu (2024):

- production outsourcing increases clinical trials among firms without production facilities;
- the increase is concentrated in first-stage trials;
- patent applications decline on average for affected firms, especially financially constrained firms;
- high-value/granted/core patent outcomes do not significantly decline;
- incremental chemical drug development responds more strongly than original chemical drug development;
- original biological drug development shows a smaller positive response;
- pure researchers are more likely to transition into developers.

Then answer:

1. Which of these facts are directly predicted by the present baseline?
2. Which are outside the baseline?
3. Which motivate heterogeneity tests?
4. Which would require an extension?
5. Does any current manuscript sentence contradict these empirical boundaries?

This note is an audit device, not a requirement to reproduce Shi Gu’s empirical design.

---

# V. Updated Definition of Success

### REPLACE items 4–6 in the previous Definition of Success with

4. The model identifies how MAH changes the expected value of **advancing viable projects toward commercialization**, rather than claiming a mechanical increase in all upstream R&D.
5. The reform may have zero effect for many project–firm pairs and may affect original and incremental projects differently.
6. The strongest baseline firm-level response is derived for research-capable but manufacturing-constrained developers, while the relative response of original versus incremental innovation remains theoretically agnostic absent additional primitive restrictions.

### ADD

11. The baseline is consistent with the possibility that clinical development rises while patent applications do not.
12. The model does not need to explain Shi Gu’s patent reallocation result unless the explicit research-versus-development extension is activated.
13. The empirical contribution should focus on commercialization organization—especially retained holder–producer separation, project-specific manufacturing mismatch, and CMO capacity/scarcity—rather than reproducing Shi Gu’s research-versus-development mechanism.

---

# W. Immediate Codex Action

Apply this amendment to the existing execution note **before continuing the model rebuild**.

After updating the note, report only:

```text
AMENDMENT v1.1 STATUS

Sections modified:
New red lines added:
Terminology replacements:
Changes to Phase 5:
Changes to propositions:
Changes to empirical mapping:
New extension boundary:
Potential conflict with work already completed:
Files that must be revised:
P0 issues requiring approval:
```

Do not advance to a new derivation phase in the same run if already-completed work uses \(x_i\) as generic upstream R&D or derives a mandatory positive original-innovation response. First revise those files and run a consistency audit.
