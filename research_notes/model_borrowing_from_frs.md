# What to Borrow from `frs_may2024.pdf`

Source discussed here:

- [Local FRS PDF](D:/working_paper/DANNI/frs_may2024.pdf)

This note answers a narrow question:

**What is the best model element to borrow from Fons-Rosen, Roldan-Blanco, and Schmitz (2024) for the MAH paper, without turning the paper into a full acquisition or bargaining model?**

## Short answer

The best borrowing target is **not** the acquisition block itself.

The most useful part to borrow is:

1. the distinction between **invention** and **implementation / commercialization**
2. the decomposition of policy effects into:
   - entry
   - incumbent innovation
   - implementation rate of ideas
   - financing support for innovative entry
3. the idea that GE feedback can reverse a partial-equilibrium intuition

For your paper, this should be transplanted into an **A/B/C organizational model**:

- `A`: integrated firms, doing R&D and production
- `B`: R&D-specialized firms / biotech-type innovators
- `C`: production-specialized firms / contract manufacturers

So the recommended model is:

**Hopenhayn-style state transition + FRS-style invention/implementation split + a simple contract-manufacturing equilibrium**

This is much better for your project than importing the full FRS setup.

## 1. What FRS is really doing

The paper starts from a Schumpeterian growth model with heterogeneous firms and adds two new ingredients:

- startup acquisitions
- a distinction between invention and implementation of startup ideas

In the local PDF, this appears in the model section around pages 6-16.

The essential logic is:

- incumbents innovate
- startups also generate ideas
- startup ideas are not automatically valuable
- they need costly implementation
- policy affects who implements ideas and whether startups are created in the first place

That logic is exactly the part that travels well to your MAH setting.

At the same time, keep the identification boundary clear:

- with innovation-outcome data alone, you can directly identify whether MAH raises innovation
- you cannot automatically claim to directly estimate the implementation probability itself
- the implementation block is therefore best treated as a structural interpretation, strengthened by reorganization and commercialization evidence

## 2. Which parts are highly portable to your paper

### 2.1 The invention vs implementation split

This is the single best idea to borrow.

In FRS:

- startups generate ideas
- implementation is a separate costly step
- incumbents may implement more efficiently than startups

In your paper:

- `B` firms generate drug ideas / own drug licenses / conduct R&D
- implementation is not "acquisition" but **commercialization through production capability**
- implementation can occur either:
  - inside an integrated `A` firm
  - through a `B` firm outsourcing to `C`
  - through organizational switching `B -> A`

This is a very natural translation.

And it naturally creates an upstream response:

- if implementation becomes easier, the expected value of an innovative project rises
- that makes entry by innovative labs or biotech-type firms more attractive
- it can also make outside investors more willing to fund such entrants

### 2.2 The three-margin decomposition

FRS says policy works through three main margins:

- startup rate
- incumbent innovation
- implementation rate

Your paper can translate these almost one-to-one:

- `B`-entry rate
- innovation of incumbents / integrated firms
- implementation or commercialization rate of `B` ideas

I recommend writing your mechanism section around these three margins.

In your setting, it is useful to extend the first margin slightly:

- `B`-entry rate
- financing support for `B`-type entry

### 2.3 The GE warning

FRS is useful because it shows a policy can look good in partial equilibrium and quite
different in general equilibrium once entry and incumbents respond.

This is very helpful for your paper:

- MAH may raise innovation
- but the effect on traditional producers' profits is ambiguous
- and welfare need not move one-for-one with the number of innovations

This is a clean way to answer your teacher's GE suggestion.

## 3. Which parts should NOT be imported directly

### 3.1 Do not import the acquisition/search/matching layer

FRS contains:

- matching between startups and acquirers
- search effort by incumbents
- related vs unrelated acquisition
- Nash bargaining over acquisition price
- acquisition tax

These are elegant in that paper, but for you they are too far from the MAH institution.

If you import them, the paper will drift toward:

- startup M&A
- merger theory
- bargaining and acquisition premia

That is not your question.

### 3.2 Do not import the full multi-product ladder structure unless necessary

FRS uses:

- a continuum of products
- multi-product incumbents
- technology gaps
- internal and external innovation

This is powerful, but it is too large for your current objective.

For your paper, this would create too much machinery relative to the empirical facts you have.

### 3.3 Do not frame the paper as a full game-theoretic firm-boundaries model

Your concern here is exactly right.

If you say "firm boundaries" too aggressively and then write bargaining, search, and
contracting, the reader will expect a full make-or-buy or incomplete-contract model.

That is unnecessary for the first version.

## 4. Recommended hybrid model for your paper

The best candidate is a **reduced-form industry equilibrium model with organizational states**.

### 4.1 Agents

- `A` integrated firms: invent and produce internally
- `B` R&D firms: invent but need implementation/commercialization support
- `C` production firms: provide production capability, may or may not do their own R&D
- `E` entrants: choose whether to enter as `B` or `C`

### 4.2 Core friction

Before MAH:

- a `B` firm that invents a drug cannot easily retain ownership while outsourcing production
- it effectively faces a high commercialization friction

After MAH:

- that friction falls
- `B` can retain ownership and use `C` for production
- the ex ante value of an R&D project rises
- new innovative labs may be more willing to enter
- investors may be more willing to fund specialized innovators
- switching across organizational forms becomes easier

### 4.3 Key choice margins

Each period:

- `A` chooses innovation and whether to remain integrated
- `B` chooses idea generation and how to implement ideas
- `C` chooses whether to remain production-specialized or upgrade toward integration
- entrants choose whether to enter as `B` or `C`

### 4.4 Implementation block

This is where FRS is most useful.

Let a `B` firm generate ideas at rate `x_B` with cost `c_B(x_B)`.
An idea succeeds only if it is implemented.

The `B` firm has three options:

1. implement by switching to `A`
2. implement via outsourcing to `C` at service price `p_m`
3. fail to implement and lose the idea

So the implementation probability is an endogenous object, not automatically one.

This is the FRS insight translated into MAH language.

### 4.5 Equilibrium margins

The policy effect should be decomposed into:

1. entry of `B` firms
2. financing support for `B`-type entry
3. innovation effort of `A` firms and possibly `B` firms
4. implementation rate of `B` ideas
5. organizational transition rates across `A/B/C`

This is exactly where your paper improves on a pure PE story.

## 5. The simplest version you can actually write now

If you want a version that is model-worthy but still feasible, use this one.

### States

- firm type `s in {A, B, C}`
- capability `z`

### Value functions

Integrated firms:

```text
V_A(z) = max {
  pi_A(z) - c_A(x_A) + beta E[V_A(z')],
  -kappa_AB + beta E[V_B(z')],
  -kappa_AC + beta E[V_C(z')],
  0
}
```

R&D-specialized firms:

```text
V_B(z) = max {
  pi_B(z; p_m, tau_M) - c_B(x_B) + beta E[V_B(z')],
  q_B(z) * H_B(z) + beta E[V_B(z')],
  -kappa_BA + beta E[V_A(z')],
  0
}
```

Production-specialized firms:

```text
V_C(z) = max {
  pi_C(z; p_m) + beta E[V_C(z')],
  -kappa_CA + beta E[V_A(z')],
  0
}
```

where:

- `q_B(z)` is idea-generation intensity
- `H_B(z)` is expected payoff per idea after accounting for implementation

### The key new object

Define:

```text
H_B(z) = max {
  H_outsource(z; p_m, tau_M),
  H_integrate(z; kappa_BA),
  0
}
```

This is your MAH version of the FRS implementation block.

Before MAH:

- `H_outsource` is low because commercialization while retaining ownership is hard

After MAH:

- `H_outsource` rises sharply

This does two things at once:

- it raises the expected return to idea generation for incumbent `B` firms
- it raises the expected entry value of new innovative firms

That one object already captures the core institutional effect.

## 6. Why this hybrid dominates the alternatives

### Better than copying FRS directly

Because your institution is not startup acquisition.

### Better than a pure Hopenhayn model alone

Because Hopenhayn gives you entry/exit and state distributions, but not the crucial
"idea generation vs commercialization" distinction.

### Better than a full property-rights or bargaining model

Because your data and current paper are not set up to identify bargaining primitives.

## 7. Concrete recommendation

If you ask "Which model should I actually use?", my answer is:

### Recommended base model

Use a **Hopenhayn-style stationary equilibrium with discrete organizational states**.

### Recommended imported mechanism from FRS

Import only:

- invention vs implementation
- entry / incumbent innovation / implementation decomposition
- the idea that implementation gains can feed back into entry and financing
- GE feedback logic

### Recommended extra ingredient

Add a **contract-manufacturing market** with service price `p_m`.

That gives you a genuine MAH mechanism without making the model too large.

## 8. A concise way to describe this in the paper

You can write:

> We borrow from recent innovation models the distinction between idea generation and
> idea implementation. In our setting, MAH does not primarily affect whether firms can
> invent, but whether R&D-specialized firms can commercialize inventions without
> internalizing production. We embed this mechanism into a stationary industry equilibrium
> with organizational state transitions across integrated, R&D-specialized, and
> production-specialized firms. Empirically, the paper directly identifies the effect
> of MAH on innovation outcomes and organizational change; the implementation channel
> is interpreted structurally and reinforced with commercialization and entry evidence.

That sentence is both accurate and manageable.

## 9. Final verdict

If you want one sentence:

**The right model to borrow from FRS is not "startup acquisitions," but "ideas need implementation, and policy changes the equilibrium implementation margin as well as entry and incumbent responses."**

That is the part that fits your MAH paper extremely well.
