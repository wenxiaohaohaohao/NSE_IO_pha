# Execution Plan for Codex / Claude
## Goal
Starting from the **current MAH model version** in `MAH_Policy.pdf` / `MAH_policy_0406.txt`, produce a **complete mathematical derivation package** for the paper’s main dynamic industry model.

The objective is **not** to redesign the model. The objective is to take the **existing benchmark model** and turn it into a mathematically complete and well-structured theory section plus technical appendix.

---

## Core instruction
You must **freeze the current benchmark model** and derive it carefully.

Do **not**:
- replace the benchmark with a different model,
- add a government optimal policy problem,
- turn the model into a full DSGE,
- introduce a full acquisition/search/bargaining layer,
- replace the reduced-form commercialization block with a top-level implementation-intensity choice,
- rewrite the model into a different state space unless explicitly instructed.

You must work with the **current paper version** in which:
- there are three active firm types: `A`, `B`, `C`;
- there are two medicine categories: generic `G` and original `O`;
- the policy regime is `M in {0,1}`;
- `MAH` enters through reduced-form channels:
  - commercialization friction `tau_M(M)`,
  - switching costs `kappa_{sj}(M)`;
- type-`B` commercialization is summarized by a bounded reduced-form success rate `lambda_B(z, p_m, M)`;
- organizational form is a dynamic control in the Bellman system;
- equilibrium includes entry, exit, contract-manufacturing market clearing, labor market clearing, and stationary distributions.

---

## Source-of-truth files
Use these as the frozen benchmark:
1. `MAH_Policy.pdf`
2. `MAH_policy_0406.txt`

Treat them as the primary model definition.

If you need conceptual support, use these only as secondary references:
- `mah_nse_weak_integrated_model_zh.md`
- `model_borrowing_from_frs.md`
- `tool_choice_and_skills_for_mah_model_zh.md`
- `hopenhaynhandoutF16.pdf`

But do not let these secondary notes overwrite the benchmark model in `MAH_Policy.pdf`.

---

## What the final package must contain
The final deliverable must be a **complete mathematical theory package** containing three layers:

### Layer 1. Main text model section
A polished theory section suitable for the paper body, including:
1. environment,
2. notation,
3. static operating payoffs,
4. Bellman system,
5. transition matrix,
6. entry block,
7. market clearing,
8. stationary equilibrium definition,
9. innovation objects,
10. key comparative-statics propositions.

### Layer 2. Mathematical appendix
A formal appendix that provides:
1. assumptions,
2. lemmas for static optimization,
3. Bellman operator and contraction argument,
4. existence and uniqueness of value functions,
5. measurable policy correspondence / choice regions,
6. well-defined transition matrix,
7. existence of invariant measures / stationary distributions,
8. stationary equilibrium existence theorem,
9. proof sketches or full proofs for the main propositions.

### Layer 3. Numerical-solution appendix
A short but complete algorithmic appendix explaining:
1. discretization of `z`,
2. static policy computation,
3. value function iteration,
4. organizational policy recovery,
5. stationary measure iteration,
6. price updates for `w` and `p_m`,
7. stopping criteria,
8. mapping from model objects to moments for estimation / calibration.

---

## Non-negotiable modeling boundaries
The benchmark model must preserve all of the following:

### A. Types and state space
- Active firm types: `A`, `B`, `C`
- One-dimensional firm capability state: `z in Z`
- Discrete regime: `M in {0,1}`
- No extra latent state dimension unless absolutely necessary for a purely technical proof

### B. Type-A block
- `A` is integrated
- `A` chooses original-drug idea-generation intensity `x_A`
- Current payoff follows the benchmark structure in the paper

### C. Type-B block
- `B` is research-specialized
- `B` chooses original-drug idea-generation intensity `x_B`
- The one-idea commercialization value is:
  `H_B(z; p_m, M) = lambda_B(z, p_m, M) * (R_B(z) - p_m) - tau_M(M)`
- `lambda_B` remains a reduced-form commercialization-success rate
- Do **not** replace `lambda_B` with a fully explicit implementation-intensity control in the benchmark derivation

### D. Type-C block
- `C` provides qualified contract manufacturing
- `C` chooses `m`
- `C` does not originate new original-drug ideas in the benchmark

### E. Dynamic control
- Organizational form is chosen at the beginning of the period
- Choice-specific value:
  `W_{sj}(z;M) = Pi_j(z; w, p_m, M) - kappa_{sj}(M) + beta * E[V_j(z';M) | z, j]`
- Bellman equations must preserve the benchmark structure:
  `V_A = max{W_AA, W_AB, W_AC, 0}`, etc.

### F. Equilibrium closure
Must include:
- contract-manufacturing market clearing,
- labor market clearing,
- entrant values and free-entry conditions,
- invariant stationary measures,
- stationary equilibrium definition.

---

## High-level derivation logic
You must derive the model in the following order.

# Phase 1. Freeze primitives and notation
## Task 1.1
Create a clean “Primitives and Objects” subsection that lists:
- time,
- firm types,
- medicine categories,
- state variable `z`,
- prices `w, p_m`,
- transition kernels `Q_j`,
- entrant distribution `G`,
- policy regime `M`,
- switching costs `kappa_{sj}(M)`,
- commercialization friction `tau_M(M)`,
- commercialization success rate `lambda_B(z,p_m,M)`.

## Task 1.2
State the minimum regularity assumptions required later:
- compactness of `Z`,
- boundedness and continuity of flow payoffs,
- weak continuity of `Q_j`,
- convexity assumptions on innovation and manufacturing costs,
- discount factor `beta in (0,1)`.

### Deliverable
A standalone subsection called:
`Primitives, State Space, and Regularity Conditions`

# Phase 2. Derive static operating problems
This phase must produce the static policies and optimized flow payoffs used inside the Bellman equations.

## Task 2.1. Type-A static problem
Start from the benchmark payoff:
- generic profit,
- incumbent original-drug profit,
- fixed cost,
- innovation value,
- convex innovation cost.

Derive:
1. the optimization problem over `x_A`,
2. the first-order condition,
3. the optimal `x_A^*(z)`,
4. the optimized payoff `Pi_A(z; w, M)`.

Also state sufficient conditions for:
- existence,
- uniqueness,
- continuity of `x_A^*`,
- continuity and boundedness of `Pi_A`.

## Task 2.2. Type-B static problem
Start from:
`H_B(z; p_m, M) = lambda_B(z,p_m,M)(R_B(z)-p_m) - tau_M(M)`

Then derive:
1. the static optimization problem over `x_B`,
2. the role of `[H_B]_+`,
3. the first-order condition when `H_B > 0`,
4. the optimal `x_B^*(z; p_m, M)`,
5. the optimized payoff `Pi_B(z; p_m, M)`.

State the exact conditions under which:
- `x_B^* = 0`,
- `Pi_B` is well-defined,
- `Pi_B` is continuous and bounded.

## Task 2.3. Type-C static problem
Start from:
`max_{m >= 0} { p_m m - c(m,z;w) }`

Derive:
1. the FOC,
2. sufficient conditions for a unique `m^*(z; p_m, w)`,
3. the optimized payoff `Pi_C(z; p_m, w, M)`.

State assumptions on `c(m,z;w)`:
- continuity,
- strict convexity in `m`,
- growth/coercivity sufficient to prevent unbounded choice,
- monotonicity in `z` if needed.

### Deliverable
A self-contained section:
`Static Operating Payoffs and Optimal Controls`
with all steps shown.

# Phase 3. Build the dynamic problem
This is the mathematical core.

## Task 3.1
Define the choice-specific value functions:
`W_{sj}(z;M)`

for all `s,j in {A,B,C}` and `exit`.

## Task 3.2
Define the Bellman operator on the space of bounded continuous functions.

## Task 3.3
Write the Bellman equations for `V_A`, `V_B`, `V_C`.

## Task 3.4
Prove or give a rigorous proof sketch that:
- the Bellman operator maps bounded continuous functions into bounded continuous functions;
- the operator is a contraction under sup norm;
- the value functions exist and are unique.

## Task 3.5
State the existence of optimal organizational policy rules:
`g_A(z;M), g_B(z;M), g_C(z;M)`.

### Deliverable
A section:
`Dynamic Organizational Choice and Value Functions`
plus an appendix subsection:
`Bellman Operator, Contraction, and Existence of Value Functions`

# Phase 4. Derive choice regions and the transition matrix
## Task 4.1
Define the choice regions:
`Z_{sj}(M) = { z in Z : j solves the Bellman problem for type-s firm }`

## Task 4.2
Show that these sets are measurable.

## Task 4.3
Given stationary measures `mu_s`, define:
`P_{sj}(M) = mu_s(Z_{sj}(M)) / mu_s(Z)`

## Task 4.4
Show:
- `P_{sj}(M)` is well-defined,
- each row sums to one,
- `P(M)` is the theoretical counterpart of the empirical transition matrix.

### Deliverable
A section:
`Choice Regions and the Incumbent Transition Matrix`

# Phase 5. Entry block
## Task 5.1
Define entrant values:
`Vbar_E^A`, `Vbar_E^B`, `Vbar_E^C`

## Task 5.2
Write the free-entry complementarity conditions.

## Task 5.3
Define entrant masses:
`n_E^A(M), n_E^B(M), n_E^C(M)`

## Task 5.4
Define the entrant-composition vector:
`e(M)`.

## Task 5.5
Explain why entrant composition is conceptually distinct from incumbent reorganization.

### Deliverable
A section:
`Entry and Free Entry Conditions`

# Phase 6. Market clearing
## Task 6.1. Qualified contract-manufacturing market
Define:
- demand `D_m(p_m, M)`,
- supply `S_m(p_m, w)`,
- market-clearing condition `D_m = S_m`.

Then derive the monotonicity and continuity conditions needed for equilibrium existence:
- demand weakly decreasing in `p_m`,
- supply weakly increasing in `p_m`,
- continuity.

## Task 6.2. Labor market
Define aggregate labor demand using type-specific labor demand objects and entrant setup labor.

State the labor-market-clearing condition:
`LD(M) = Lbar`

State sufficient continuity/monotonicity conditions for existence of an equilibrium wage.

### Deliverable
A section:
`Market Clearing`

# Phase 7. Stationary distribution
## Task 7.1
Define the law of motion for next-period type-j measures:
`mu'_j(B)`

## Task 7.2
Explain that this defines a measure-valued mapping conditional on policies, entrant masses, and prices.

## Task 7.3
State sufficient conditions for existence of invariant measures / stationary distributions.

## Task 7.4
Impose stationarity:
`mu'_j = mu_j`

### Deliverable
A section:
`Stationary Distributions`
plus appendix subsection:
`Invariant Measures and Stationarity`

# Phase 8. Stationary competitive equilibrium
## Task 8.1
Combine all previous objects into a formal equilibrium definition.

The definition must include:
- value functions,
- operating policies,
- organizational policy rules,
- stationary measures,
- entrant masses,
- prices.

## Task 8.2
State an equilibrium existence theorem under the regularity assumptions.

A full proof is optional if too long, but at minimum give a mathematically coherent proof sketch:
- Bellman fixed point,
- optimal policies,
- measure mapping,
- market-clearing fixed point,
- stationary consistency.

### Deliverable
A section:
`Definition and Existence of Stationary Competitive Equilibrium`

# Phase 9. Innovation objects
## Task 9.1
Define the number of new original-drug products:
`N(M)`

## Task 9.2
Define the original-drug share:
`S^O(M)`

## Task 9.3
Explain carefully why:
- `N(M)` is the innovation quantity object,
- `S^O(M)` is the innovation structure object.

### Deliverable
A section:
`Innovation Quantity and Innovation Structure`

# Phase 10. Producer-side outcomes and surplus
## Task 10.1
Define average type-C payoff `bar Pi_C(M)`.

## Task 10.2
Define the pharmaceutical-industry surplus object `S(M)`.

## Task 10.3
State clearly that this is not a whole-economy welfare object.

## Task 10.4
Give the exact interpretation:
- innovation gains,
- reallocation gains,
- switching/reorganization costs,
- producer-side ambiguity.

### Deliverable
A section:
`Producer-Side Outcomes and Industry Surplus`

# Phase 11. Comparative statics and propositions
You must derive the benchmark propositions in a mathematically structured way.

## Proposition group A. Type-B value channel
Show that if:
- `tau_M(1) < tau_M(0)`,
- `lambda_B(z,p_m,1) >= lambda_B(z,p_m,0)` with strict inequality on a nondegenerate subset,

then:
- `H_B` rises weakly,
- `x_B^*` rises weakly,
- `Pi_B` rises weakly,
- `V_B` rises weakly.

## Proposition group B. Innovation outcomes
Under suitable elasticity conditions in the contract-manufacturing market, show that:
- `N(M)` rises weakly,
- `S^O(M)` rises weakly under the stated dominance condition.

## Proposition group C. Reorganization margins
If selected switching costs fall under MAH, show that the corresponding choice regions expand weakly, implying shifts in `P(M)`.

## Proposition group D. Producer-side ambiguity
Show why higher innovation does not mechanically imply higher type-C profits or higher industry surplus.

### Deliverable
A section:
`Comparative Statics`
plus a proof appendix:
`Proofs of Main Propositions`

# Phase 12. Numerical solution roadmap
This is not estimation yet. This is the solution logic needed for replication.

## Task 12.1
Describe how to discretize `z`.

## Task 12.2
Describe the nested fixed-point logic:

### Inner block
Given `(w, p_m, M)`:
1. solve static policies,
2. solve Bellman equations,
3. recover organizational policies.

### Middle block
Given policies and entrant masses:
4. iterate on stationary measures.

### Outer block
5. compute excess demand in the contract-manufacturing market and labor market,
6. update `(w, p_m)`,
7. update entrant masses if needed under free entry,
8. iterate to convergence.

## Task 12.3
Specify convergence criteria.

### Deliverable
A section:
`Numerical Solution Algorithm`

---

## Writing standards
All derivations must satisfy the following standards:

### 1. No skipped logical jumps
Every formula that appears in the final appendix must be either:
- derived explicitly,
- or stated as following from a clearly named standard theorem.

### 2. Benchmark notation must remain stable
Do not rename the core objects unless strictly necessary.
Keep:
- `V_A, V_B, V_C`,
- `Pi_A, Pi_B, Pi_C`,
- `x_A, x_B, m`,
- `lambda_B`,
- `tau_M`,
- `kappa_{sj}`,
- `P(M)`,
- `e(M)`,
- `N(M)`,
- `S^O(M)`.

### 3. Separate benchmark from optional extensions
Whenever you are tempted to add:
- financing support `phi_B`,
- development-stage heterogeneity `xi`,
- explicit implementation choice,
- logit shocks,
- government optimal policy,
put it in a separate clearly labeled subsection:
`Optional Extension`
and keep it out of the main benchmark derivation.

### 4. Be explicit about identification boundary
Do not say the model directly estimates primitive commercialization probability from outcome data alone.
Always preserve the benchmark identification boundary.

---

## Required output format
Produce the final output in this order:

### File 1. `mah_model_main_theory.tex`
A clean LaTeX model section for the main paper.

### File 2. `mah_model_math_appendix.tex`
A LaTeX appendix with assumptions, lemmas, theorem statements, and proofs/proof sketches.

### File 3. `mah_model_solution_algorithm.md`
A concise markdown note describing the numerical solution steps.

### File 4. `mah_model_todo_checklist.md`
A checklist showing which mathematical pieces are complete and which still require calibration choices or extra assumptions.

---

## Interaction protocol
You must proceed sequentially.
Do **not** try to rewrite everything at once.

Use the following workflow:

1. First produce a frozen outline of all sections and theorem targets.
2. Then produce Phase 2 only: static optimization derivations.
3. Then produce Phase 3 only: Bellman system and value-function existence.
4. Then produce Phase 4–6: transition matrix, entry, market clearing.
5. Then produce Phase 7–8: stationary distribution and equilibrium existence.
6. Then produce Phase 9–11: innovation objects, surplus, comparative statics.
7. Then produce Phase 12: numerical solution appendix.
8. Finally harmonize notation and cross-references across files.

At the end of each phase, provide:
- what was derived,
- what assumptions were used,
- what remains to be proven next.

---

## Priority rule
Whenever there is a tension between:
- theoretical richness,
- realism,
- and immediate implementability,

prioritize:
1. benchmark consistency,
2. mathematical correctness,
3. implementability,
4. richness.

---

## Definition of success
The project is successful only if the resulting package allows a reader to:
- see exactly what the benchmark model is,
- verify the static and dynamic optimization steps,
- understand the equilibrium objects,
- understand what conditions are required,
- and implement the model numerically without inventing missing mathematics.
