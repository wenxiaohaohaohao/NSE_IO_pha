# MAH, Firm Boundaries, and Industry Equilibrium

## 1. Research question

Recommended main question:

**Does MAH reduce the institutional bundling between R&D ownership and
production capacity, thereby inducing specialization, changing firm state
transitions, and shifting the innovation equilibrium in China's
pharmaceutical industry?**

This reframing does three things at once:

1. It keeps the current innovation focus.
2. It directly absorbs the teacher's suggestion on state change.
3. It gives the paper a genuine GE margin without forcing a full macro model.

An important clarification is needed:

- the direct empirical question is still **whether MAH promotes innovation**
- the deeper mechanism question is **why**
- the implementation/commercialization channel should be presented as the
  paper's structural interpretation, not as an object that is automatically
  directly identified from innovation-outcome data alone

## 2. What changes relative to the current PPT

The current PPT establishes:

- `MAH -> firm differentiation -> more innovation`

The upgraded paper should establish:

- `MAH -> lower commercialization friction for R&D specialists`
- `MAH -> higher expected commercialization value of innovative projects`
- `MAH -> stronger entry and financing incentives for R&D-oriented firms`
- `MAH -> lower switching cost across organizational forms`
- `MAH -> entry + survival + state transitions across A/B/C firms`
- `MAH -> changes in innovation, incumbent profit, and welfare through an industry equilibrium`

This is the cleanest way to differentiate the paper from
Jia et al. (2023). Their mechanism is primarily:

- faster review / shorter waiting time
- more innovative entry
- composition change

Your mechanism should instead be:

- separation of license ownership from production license
- re-organization of firm boundaries
- endogenous interaction between R&D firms and production firms
- improved ex ante project returns for potential biotech entrants and investors
- equilibrium feedback on entry, profits, and innovation

## 2.5 Identification boundary

With innovation-outcome data alone, the paper can most cleanly identify:

- `MAH -> innovation`

What the paper cannot claim to directly identify from those data alone is:

- the implementation probability itself

Therefore, the recommended wording is:

- direct empirical finding: `MAH raises innovation`
- mechanism interpretation: this is consistent with lower commercialization
  friction, higher expected implementation value, and organizational
  reallocation

This distinction will make the paper much easier to defend.

## 3. Minimal model structure

### 3.1 Firm types

Use three active firm types and one entrant pool:

- `A`: integrated firms, conducting both R&D and production
- `B`: R&D-specialized firms / biotech-type firms
- `C`: production-specialized firms / contract manufacturing-type firms
- `E`: potential entrants

Empirically, keep the current four-way classification:

- R&D type
- production type
- mixed type
- transitional type

Interpretation:

- empirical `mixed` is the closest observable counterpart to model `A`
- empirical `R&D` maps to `B`
- empirical `production` maps to `C`
- empirical `transitional` is not a separate steady-state type; it is an observed transition state that helps validate `A <-> B/C` or `C -> A`

### 3.2 State variables

At the minimum, each active firm has:

- organizational type `s in {A, B, C}`
- productivity / capability state `z`
- innovation stock or innovation quality state `n`

You do not need a fully rich product-line model in the first draft.
For a first memo, a single-firm state variable `z` is enough if it affects:

- current profit
- innovation efficiency
- survival
- switching incentives

### 3.3 Policy variable

Represent MAH by two reduced-form channels:

- `tau_M`: lower commercialization fixed cost for `B`
- `kappa_ij`: lower switching cost from organizational form `i` to `j`
- `phi_B`: stronger effective outside financing or lower effective entry cost for `B`

Interpretation:

- before MAH, a `B` firm cannot fully capture downstream payoff without building or owning production capacity
- after MAH, `B` can keep ownership and outsource production to `C`
- after MAH, the expected return to an innovative project rises, making entry by
  biotech-type firms more attractive and potentially easier to finance
- organizational restructuring becomes easier, especially `A -> B`, `A -> C`, `C -> A`, and entry `E -> B`

Do **not** explicitly model sales networks in version 1.
Treat downstream commercialization and market access as a reduced-form fixed cost,
commercialization margin, or implementation friction.

## 4. Timing and firm problem

### 4.1 Timing

Each period:

1. incumbents observe `(s, z)`
2. they choose whether to remain in the current form, switch form, innovate, or exit
3. `B` firms can contract production from `C` firms at service price `p_m`
4. firms receive profits and transition to next-period state
5. potential entrants in `E` choose whether to enter as `B` or `C`

### 4.2 Value functions

The memo version only needs the logic, not a fully solved system.

For integrated firms:

```text
V_A(z) = max {
  pi_A(z; w, p_m) - f_A + beta E[V_A(z')],
  -kappa_AB + beta E[V_B(z')],
  -kappa_AC + beta E[V_C(z')],
  0
}
```

For R&D-specialized firms:

```text
V_B(z) = max {
  pi_B(z; p_m, tau_M) - f_B + beta E[V_B(z')],
  -kappa_BA + beta E[V_A(z')],
  0
}
```

For production-specialized firms:

```text
V_C(z) = max {
  pi_C(z; p_m) - f_C + beta E[V_C(z')],
  -kappa_CA + beta E[V_A(z')],
  0
}
```

Potential entrants satisfy free-entry conditions:

```text
V_E = max { E[V_B(z0)] - c_EB + phi_B(M), E[V_C(z0)] - c_EC, 0 }
```

Here `phi_B(M)` should be interpreted broadly:

- higher expected external financing availability
- lower effective entry cost
- stronger investor willingness to back R&D-specialized firms

The paper does not need to model venture-capital contracting explicitly in v1.
A reduced-form entry-support term is enough.

## 5. Industry equilibrium

A first-draft stationary equilibrium needs the following objects.

### 5.1 Prices and market-clearing conditions

At minimum include two prices / conditions:

- `p_m`: contract manufacturing service price, clearing demand from `B` and supply from `C`
- free-entry condition: pins down entry into `B` and `C`

Optional third margin if you want stronger GE language:

- common wage or R&D factor price `w`

### 5.2 Distributional objects

Let the stationary mass of firms by type and state be:

- `mu_A(z)`
- `mu_B(z)`
- `mu_C(z)`

The paper does not need a full transitional dynamics solution in version 1.
A stationary equilibrium with comparative statics is enough.

### 5.3 Transition margins that must be explicit

The model should generate:

- `E -> B`
- `E -> C`
- `B -> A`
- `A -> B`
- `A -> C`
- `C -> A`
- exit from any active type

This is the core teacher-facing upgrade.
It makes clear that the paper is no longer just about more entry after a lower cost shock.

## 6. Main propositions

Keep four propositions only.

### Proposition 1

Lower `tau_M` raises the value of `B` firms, especially for firms with strong R&D capability
but weak production capability. If this also raises the expected return perceived by outside
investors, entry into `B` rises even more and `B` survival improves.

### Proposition 2

Lower switching costs `kappa_ij` increase organizational restructuring, in particular:

- `A -> B/C` when specialization gains dominate integration gains
- `C -> A` when production firms accumulate enough innovative capability
- `B -> A` when downstream integration becomes profitable for sufficiently productive innovators

### Proposition 3

The post-MAH equilibrium features a larger mass of specialized R&D firms and a higher share
of original innovation if outsourcing reduces commercialization frictions enough.
This can happen through both:

- stronger implementation/commercialization of existing ideas
- more entry by R&D-oriented firms because expected project value rises

### Proposition 4

The welfare effect is ambiguous in sign ex ante:

- welfare gains: more innovation, more entry, more specialization, less duplicate production investment
- welfare losses: lower profit for some traditional producers, possible business stealing, switching losses

Hence, **innovation quantity and welfare need not move one-for-one**.

This is the cleanest way to respond to the GE suggestion.

## 7. Comparative statics to emphasize

These are the minimum checks the first theory draft should contain:

1. `dV_B / d(-tau_M) > 0`
2. entry into `B` rises after MAH
3. restructuring probability rises after MAH
4. profits of `C` firms are not necessarily monotone
5. welfare is not guaranteed to have the same sign as innovation quantity

If you add a reduced-form financing support term `phi_B(M)`, also check:

6. `d Entry_B / d phi_B > 0`

Useful edge cases:

- if contract manufacturing is unavailable, the model collapses to the pre-MAH bundled regime
- if outsourcing friction goes to zero, specialization displaces part of integrated production

## 8. Mapping model objects to current empirical variables

| Model object | Empirical proxy already in the PPT / data plan | Notes |
| --- | --- | --- |
| `B` mass | number/share of R&D-type firms | current personnel-based classification can be reused |
| `C` mass | number/share of production-type firms | same |
| `A` mass | number/share of mixed firms | mixed is the empirical integrated type |
| restructuring | transition matrix across firm types | this is the major missing fact to build next |
| entry into `B` or `C` | first observed firm-year by type | should be reported separately from incumbent switching |
| innovation quantity | original-drug innovation applications, firm original-innovation counts | interpret innovation metrics as original-drug innovation rather than all drug innovation |
| innovation structure | share of original-drug or high-quality innovative applications in all applications | use this to capture the composition of original innovation |
| innovation quality | approved original innovative drugs / high-quality original innovation share | keep the object aligned with the policy goal of encouraging original-drug innovation |
| downstream commercialization margin | selling expenses, commissioned production text, annual report keywords | use reduced-form evidence if clean financial decomposition is unavailable |
| `C`-firm profit effect | gross margin, operating margin, revenue growth, entrusted-production mentions | useful for the GE discussion even if imperfect |
| entry-financing support | VC/PE rounds, biotech financing events, IPOs, new lab creation, new R&D-oriented registrations | these strengthen the entry margin rather than directly identify implementation |

This mapping also helps align the model with the teacher's current emphasis:

- ownership reform and firm differentiation are captured by `tau_M`, the `B`-implementation block, and `A/B/C` state transitions
- more innovation comes through entry, implementation, and reallocation margins
- the innovation object should be read as **original-drug innovation**
- possible losses for traditional production firms are captured through the `C`-firm profit block
- a positive net welfare effect is a **conditional equilibrium implication**, not an identity, requiring innovation gains and reallocation gains to dominate profit losses and switching costs

## 9. Revised paper structure

Recommended structure:

1. Institutional background and why MAH changes organizational boundaries
2. Facts on firm reorganization and transition
3. Industry-equilibrium model with state transitions
4. Empirical tests of transitions, innovation, and heterogeneity
5. Welfare discussion and scope conditions

This is better than the current order because it makes the model answer the newly documented fact.

## 10. Text that should appear in the draft

Suggested paragraph for the introduction / model overview:

> This paper treats the extension of the pharmaceutical value chain from
> "production-distribution-use" to "R&D-production-distribution-use" as an
> important background fact of industry upgrading. However, the model
> endogenizes only the R&D-production boundary. The purpose is to isolate the
> organizational mechanism through which MAH changes ownership, specialization,
> entry, and innovation incentives.

Suggested positioning sentence against Jia et al. (2023):

> Unlike work emphasizing shorter regulatory waiting time and faster approval as
> the core mechanism, this paper studies how MAH changes the ownership and
> commercialization structure of drug innovation, thereby reshaping firm
> boundaries and the industry equilibrium.

Suggested sentence on identification:

> 本文在实证上直接识别的是 `MAH` 对创新结果变量和企业组织重构的影响，例如创新申请、创新质量、研发型企业进入以及不同组织类型之间的状态转移。本文并不声称仅凭这些结果变量就能够直接估计研发成果被实施或商业化的概率。相反，本文将 implementation 视为连接 idea generation 与创新产出的关键中间机制，并将其理解为 `MAH` 所改变的商业化摩擦、组织边界与预期项目回报的综合体现。因此，关于 implementation 的讨论主要来自制度背景、企业重组事实、商业化代理变量以及结构模型解释，而非对实施概率本身的直接估计。

## 11. What to do next

Immediate next steps:

1. build pre/post transition matrices from the firm panel
2. document entry composition separately from incumbent switching
3. verify whether production-type firms gain contract-manufacturing business after MAH
4. write the formal model section only after the transition facts are visible

The model should explain the fact pattern, not the other way around.
