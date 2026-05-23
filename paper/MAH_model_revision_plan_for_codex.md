# MAH Theory Section Revision Plan for Codex

## 0. Revision Objective

Revise the current MAH theory section into a cleaner and more defensible:

> **partial-equilibrium dynamic route-choice mechanism model + comparative statics + mechanism-calibration blueprint**.

Do **not** rewrite the model as a full general-equilibrium model.  
Do **not** claim full structural identification.  
Do **not** claim welfare results.

The revision should solve five current problems:

1. The model needs an explicit partial-equilibrium closure.
2. The payoff objects \(R_t\), \(\pi\), and \(v_t\) need clean accounting to avoid double counting.
3. The entrusted-production direct cost should be written as \(p_m\), not only as \(C^E\), to preserve the future contract-manufacturing-market extension.
4. The route-share logit used in calibration needs a formal bridge to the deterministic route-choice model.
5. Entry and aggregate counts should be stated as response modules, not as a fully closed industry equilibrium.

---

## 1. Verified Basis for Revision

### 1.1 What the current PDF already says

The current PDF already describes the paper as a theoretical mechanism model and mechanism-calibration blueprint, not as a full structural estimation exercise. It also states that demand-side conditions enter only through a single reduced-form market-return shifter held fixed in the main MAH comparative statics, and that the model maps feasible moments to composite objects rather than identifying all primitives.

Therefore, the correct revision is **not** to make the model more ambitious. The correct revision is to make the current modest positioning more explicit and internally consistent.

### 1.2 What the uploaded markdown correctly flags

The uploaded markdown correctly identifies the main risk: the model currently needs a clearer **partial-equilibrium closure**, clearer payoff accounting, and a bridge between deterministic route choice and logit route-use calibration. It also warns that \(S_i-\tau_i^T\), \(C^I(k_i)\), and \(C^E\) remain somewhat black-box objects.

These concerns are economically valid and should be adopted.

### 1.3 Why this should not be turned into GE

A Hopenhayn-style stationary industry equilibrium requires market clearing, optimal exit, free-entry conditions, and an invariant distribution. The current MAH model does not solve for product-market prices, input prices, contract-manufacturing prices, free entry, exit cutoffs, or an invariant firm distribution.

Therefore, the model should not be labeled as a full GE or full stationary industry-equilibrium model.

---

# 2. High-Level Target Structure

Revise the theory section into the following structure:

```text
4 Model
  4.0 Scope and partial-equilibrium closure
  4.1 Demand side and single-market return
  4.2 Firm characteristics and state variables
  4.3 R&D production function and uncertainty
  4.4 MAH indicator, route availability, and entrusted-production friction
  4.5 Commercialization route choice
  4.6 Recursive Bellman equation

5 Closed-form solution

6 Comparative statics
  6.1 Route relevance region
  6.2 Route-set expansion
  6.3 Friction-reduction comparative statics
  6.4 Strict-response conditions

7 Aggregate response modules
  7.1 Incumbent count response
  7.2 Entrant response module
  7.3 Aggregate expected counts under fixed distributions

8 Mechanism calibration blueprint
  8.1 Model-to-data mapping
  8.2 Route-use moments and logit smoothing
  8.3 Count moments and innovation-arrival scale
  8.4 Entry moments as future/sensitivity module
  8.5 Optional 8-moment extension
```

Do not create a full equilibrium section unless actual market-clearing conditions are added.

---

# 3. P1 Revision: Add a Formal Partial-Equilibrium Closure

## 3.1 Problem

The current model has a Bellman equation and comparative statics, but it does not explicitly state what is endogenous and what is taken as given.

This creates confusion: a reader may ask whether the model is partial equilibrium, general equilibrium, or structural IO.

## 3.2 Economic reason

A partial-equilibrium model is legitimate if it clearly fixes the background environment and studies firm choices within it.

The current paper’s goal is to study how MAH changes the private value of an original-drug opportunity through route-set expansion and external-route friction reduction. It does not need to clear product markets, input markets, or contract-manufacturing markets.

## 3.3 Required modification

Insert the following subsection at the beginning of Section 4, before the demand block.

```latex
\subsection{Scope and partial-equilibrium closure}

The baseline model is a partial-equilibrium dynamic route-choice model. It takes as given the market-return environment, the contract-manufacturing service price, the distribution of firm characteristics, and the institutional regime. Firms choose original-drug R\&D intensity before successful opportunities are realized. Conditional on a successful opportunity, they choose a commercialization route.

Formally, a baseline partial-equilibrium MAH environment consists of
\[
\mathcal E_t =
\left(
R_t,\; p_{m,t},\; H(a,k,S,\tau^T),\; G_N(z),\; M_t,\; \tau^E(M_t)
\right),
\]
where \(R_t\) is the market-return shifter, \(p_{m,t}\) is the direct price or payment for qualified contract manufacturing, \(H\) is the distribution of incumbent firm characteristics, \(G_N\) is the distribution of potential entrant characteristics, \(M_t\) is the institutional regime, and \(\tau^E(M_t)\) is the entrusted-route governance and compliance friction.

The model does not solve for product-market clearing, input-market clearing, a contract-manufacturing market-clearing price, or an invariant industry distribution in the baseline. Its purpose is to characterize how MAH-induced route-set expansion and entrusted-route friction reduction affect the private opportunity value \(\Gamma_i\), R\&D intensity \(x_i^*\), and expected original-drug counts \(\lambda_i^*\).
```

## 3.4 Acceptance criterion

After this insertion, the reader should know:

- \(R_t\) is exogenous in the baseline.
- \(p_m\) is exogenous in the baseline.
- \(H\) and \(G_N\) are fixed distributions.
- The model does not claim GE.
- Comparative statics are partial-equilibrium comparative statics.

---

# 4. P1 Revision: Fix Payoff Accounting for \(R_t\), \(\pi\), and \(v_t\)

## 4.1 Problem

The current model risks double counting retained-drug value.

The model has \(R_t\) as a market-return object, \(\pi n_{it}\) as the flow payoff from retained drugs, and \(v_t\) as the marginal continuation value of retaining one more drug.

If \(R_t\) is interpreted as the full lifetime value of a commercialized product, then adding \(v_t\) duplicates future retained-stock value.

## 4.2 Economic reason

The model needs a clean distinction between:

| Object | Meaning |
|---|---|
| \(R_t\) | commercialization-event payoff |
| \(\pi n_{it}\) | flow payoff from already retained products |
| \(v_t\) | continuation value of adding one retained product |

This separation is economically standard: an innovation can generate an immediate commercialization payoff and, if retained, also add to the firm’s future product stock.

## 4.3 Required modification in Section 4.1

Modify the definition of \(R_t\). Do not define it as full product-horizon value. Replace the current wording around \(R_t=\chi_t E_\omega[\varpi_{\omega t}]\) with:

```latex
The object \(R_t\) is not the full lifetime value of a retained drug. It is the route-period commercialization-event payoff associated with converting a successful original-drug opportunity into a marketed product. It excludes the continuation value of retaining the product in the innovating firm's future portfolio. That continuation value is represented separately by \(v_t\).

The multiplier \(\chi_t\) should therefore be interpreted as a reduced-form mapping from operating-profit conditions into the commercialization-event payoff, not as a full product-lifetime multiplier. Demand-side conditions discipline the background level of \(R_t\), but MAH is not modeled as shifting \(R_t\) in the baseline comparative statics.
```

## 4.4 Required modification in route-choice section

Before route payoffs, insert:

```latex
\paragraph{Payoff accounting.}
There are three distinct payoff objects. First, \(R_t\) is the commercialization-event payoff from turning a successful opportunity into a marketed product. Second, existing retained products generate the flow payoff \(\pi n_{it}\). Third, \(v_t\) is the marginal continuation value of adding one retained original-drug asset to the firm's stock. Retained routes receive \(v_t\); non-retained routes do not.
```

## 4.5 Acceptance criterion

The revised model must make clear that:

\[
R_t \neq v_t,
\qquad
R_t \neq \pi n_{it}.
\]

---

# 5. P1 Revision: Replace \(C^E\) with \(p_m\) in the Entrusted Route

## 5.1 Problem

The current notation \(C^E\) makes the entrusted route look like a pure technology cost. But the economic story is about a qualified external production service.

## 5.2 Economic reason

The MAH mechanism separates two different objects:

\[
p_m = \text{direct payment or price for qualified contract manufacturing},
\]

\[
\tau^E = \text{governance/compliance/monitoring/coordination friction}.
\]

This distinction prevents \(\tau^E\) from absorbing everything. It also leaves a clean future extension in which \(p_m\) is endogenized through a contract-manufacturing service market.

## 5.3 Required modification

Replace:

```latex
b^E_{i,t+1}=R_{t+1}-C^E-\tau^E_{i,t+1}
```

with:

```latex
b^E_{i,t+1}=R_{t+1}-p_{m,t+1}-\tau^E_{i,t+1}.
```

Then define:

```latex
Here \(p_{m,t+1}\) is the direct price or payment for qualified entrusted manufacturing services. The separate object \(\tau^E_{i,t+1}\) captures route-specific governance, compliance, monitoring, documentation, and cross-firm coordination frictions. In the baseline partial-equilibrium model \(p_m\) is taken as given. A later extension may determine \(p_m\) from a contract-manufacturing service market-clearing condition.
```

## 5.4 Required consistency updates

Replace all appearances of:

\[
C^E
\]

in route values, route-use calibration, and comparative statics with:

\[
p_m.
\]

For example:

\[
G_i^E - G_i^I
=
C^I(k_i)-p_m-\tau_i^E.
\]

## 5.5 Acceptance criterion

Everywhere in the model:

- \(p_m\) is the direct manufacturing-service price.
- \(\tau^E\) is the route-specific governance/compliance wedge.
- They are not conflated.

---

# 6. P1 Revision: Clarify Transfer/Sale/Out-Licensing Payoff \(S_i-\tau_i^T\)

## 6.1 Problem

The current transfer payoff is too black-box. It matters because it determines whether the entrusted route is relevant.

If \(S_i-\tau_i^T\) is high, the firm may transfer the project instead of using entrusted production. Therefore this object affects the main comparative statics.

## 6.2 Economic reason

The model does not need a full market for technology, but it must define the outside option clearly.

A minimal foundation is enough: \(S_i\) can be a non-retained transfer/sale/out-licensing payment. It can remain exogenous, but the model should state that it is not separately identified in baseline calibration.

## 6.3 Required modification

In the route-choice section, replace the current short definition of \(S_i-\tau_i^T\) with:

```latex
The route \(T\) is a non-retained outside option. It includes transfer, sale, or non-retained out-licensing arrangements under which the innovating firm receives a net payment but does not add the product to its retained stock. We write this payoff as
\[
b^T_i = S_i-\tau_i^T.
\]
The object \(S_i\) is the gross expected non-retained transfer value, and \(\tau_i^T\) is the transaction or contracting friction associated with that outside option. In the baseline, \(S_i-\tau_i^T\) is taken as exogenous. A useful special case is
\[
S_i = \omega_i^T R_t,
\qquad
\omega_i^T\in[0,1],
\]
but the main comparative statics do not require imposing this functional form.
```

## 6.4 Acceptance criterion

The reader should understand:

- \(T\) is non-retained.
- \(T\) is not the same as entrusted production.
- \(S_i-\tau_i^T\) is an outside option.
- It is not separately identified in baseline calibration.

---

# 7. P1 Revision: Formalize Route-Choice Logit as Calibration Device

## 7.1 Problem

The theory uses deterministic max:

\[
r_i^* \in \arg\max_r G_i^r.
\]

But the calibration section uses logit route shares. Without explanation, this looks inconsistent.

## 7.2 Economic reason

For comparative statics, deterministic max is sufficient. For matching route-use shares, a smoothed route-choice probability is useful.

This is standard: the deterministic model gives the mechanism; the logit version is a measurement/calibration layer.

## 7.3 Required modification

Keep the main model deterministic.

In Section 8, before the route-use block, add:

```latex
\paragraph{Route-share smoothing for calibration.}
The baseline theory uses deterministic route choice:
\[
\Gamma_i^M=\max_{r\in\mathcal R(M)}G_i^r.
\]
For route-share calibration only, we introduce an idiosyncratic route-choice shock
\[
\widetilde G_i^r = G_i^r+\varepsilon_i^r,
\]
where \(\varepsilon_i^r\) is Type-I extreme value with scale parameter \(\sigma_r\). This smoothing device is not needed for the comparative statics. It is used only to map observed route-use shares into an effective entrusted-route wedge.
```

Then write:

```latex
Conditional on comparing retained internal production and retained entrusted production,
\[
P_i(r=E\mid r\in\{I,E\})
=
\frac{\exp(G_i^E/\sigma_r)}
{\exp(G_i^E/\sigma_r)+\exp(G_i^I/\sigma_r)}.
\]
Therefore,
\[
\log\left(\frac{s_t^E}{1-s_t^E}\right)
=
\frac{G_t^E-G_t^I}{\sigma_r}
=
\frac{C^I(k)-p_m-\tau_t^E}{\sigma_r}.
\]
```

## 7.4 Acceptance criterion

The final text must say:

- deterministic max is the baseline theory;
- logit is only a calibration layer;
- comparative statics do not rely on logit.

---

# 8. P2 Revision: Add a Minimal Functional Example for \(C^I(k_i)\)

## 8.1 Problem

The current model only assumes:

\[
\frac{\partial C^I(k_i)}{\partial k_i}<0.
\]

This is enough formally, but readers may find the object too abstract.

## 8.2 Economic reason

The key heterogeneity prediction is that MAH matters more for firms with weak internal manufacturing capability but valuable research opportunities.

A simple internal-cost function makes this transparent.

## 8.3 Required modification

After defining \(C^I(k_i)\), add:

```latex
A convenient example is
\[
C^I(k_i)=F_I+\frac{\bar c_I}{k_i},
\qquad k_i>0,
\]
where \(F_I\) is the fixed internal commercialization burden and \(\bar c_I/k_i\) captures the idea that higher manufacturing capability lowers the cost of internal production. The main comparative statics require only \(C_k^I(k_i)<0\); the closed-form results do not depend on this specific functional form.
```

## 8.4 Acceptance criterion

The text should retain generality but provide intuition.

---

# 9. P2 Revision: Clarify What \(Y_{i,t+1}\) Means

## 9.1 Problem

The current model sometimes uses \(Y_{i,t+1}\) as a successful opportunity, and the data side uses approval or certificate records.

This can create confusion between:

- early-stage idea arrival;
- approval-ready opportunity;
- final approval;
- retained certificate.

## 9.2 Economic reason

Current approval-side data cannot observe latent ideas. It observes downstream realized records. The model must state that \(Y\) is a reduced-form approval-ready or realized-opportunity object.

## 9.3 Required modification

In the R&D production section, revise the text around \(Y_{i,t+1}\):

```latex
The object \(Y_{i,t+1}\) should be interpreted as the number of successful original-drug opportunities that reach the commercialization-route decision stage. It is not a raw scientific idea arrival at the laboratory stage. In approval-side data, approvals, retained certificates, or realized original-drug records are downstream proxies for this object. A richer pipeline model could introduce an earlier idea-arrival stage and a separate clinical or regulatory success probability, but the baseline mechanism model absorbs those probabilities into effective research ability \(a_i\).
```

## 9.4 Acceptance criterion

The model should no longer imply that approval records literally observe latent ideas.

---

# 10. P2 Revision: Reclassify Entry as a Response Module

## 10.1 Problem

The current model has an entry-cost distribution \(F_e\), but it does not solve a full free-entry stationary equilibrium.

## 10.2 Economic reason

Without a firm-year entry panel and without a free-entry condition, entry should not be the baseline structural result. It should be a mechanism extension.

The current calibration blueprint already treats entry-cost distribution as a future/sensitivity module when credible research-oriented entry data are unavailable.

## 10.3 Required modification

Rename Section 7 from:

```text
Incumbents, Entrants, and Aggregate Drug Counts
```

to:

```text
Aggregate Response Modules: Incumbents, Potential Entrants, and Expected Drug Counts
```

Then add:

```latex
The entry block is not a full free-entry equilibrium condition in the baseline model. It is a response module that maps the post-entry value \(A(z,M)\) into potential research-oriented entry through an entry-cost distribution \(F_e\). In the current approval-side data environment, this module should be interpreted as a future calibration or sensitivity exercise unless a credible firm-year entry panel is available.
```

## 10.4 Acceptance criterion

The model should not claim:

```text
we solve equilibrium entry
```

It should claim:

```text
we characterize the entry response implied by higher post-entry value
```

---

# 11. P2 Revision: Rename Aggregate Drug Counts

## 11.1 Problem

The current notation \(\Lambda^{agg}\) may be read as a GE aggregate.

## 11.2 Economic reason

The model integrates individual responses over fixed distributions. It does not solve a new invariant distribution after the policy.

## 11.3 Required modification

Where the paper writes:

```latex
Aggregate expected original-drug opportunities are ...
```

revise to:

```latex
Holding the distribution of incumbent characteristics and the potential entrant pool fixed, the model-implied aggregate expected original-drug count is ...
```

When defining:

\[
\Lambda^{agg}(M)
\]

add:

```latex
This is an aggregate response under fixed distributions, not a general-equilibrium aggregate obtained from an invariant industry distribution.
```

## 11.4 Acceptance criterion

Avoid the phrase:

```text
equilibrium aggregate innovation
```

unless actual equilibrium distribution and market-clearing conditions are added.

---

# 12. P2 Revision: Keep CES Demand Block but Clarify Its Limited Role

## 12.1 Problem

The CES demand block may make readers expect product-market equilibrium feedback.

## 12.2 Economic reason

The CES block is useful because it microfounds \(R_t\). But the model does not allow MAH-induced entry to change the price index \(P_t\), market size, or competitive structure in the baseline.

## 12.3 Required modification

At the end of Section 4.1, add:

```latex
The CES block microfounds the market-return shifter \(R_t\). It does not make the baseline model a product-market general-equilibrium model. In particular, the main MAH comparative statics hold \(R_t\), \(E_t\), and \(P_t\) fixed. Feedback from MAH-induced innovation into the price index, aggregate expenditure allocation, or product-market competition would require a separate equilibrium extension.
```

## 12.4 Acceptance criterion

The demand block should support expected-return logic, not imply a full demand-side estimation or GE feedback.

---

# 13. P2 Revision: Add Optional Semi-Equilibrium Extension for Contract Manufacturing

## 13.1 Problem

You want to preserve the idea that MAH may create or deepen a contract-manufacturing service market, but the baseline model does not need full GE.

## 13.2 Economic reason

The natural intermediate extension is not full GE. It is a single-market semi-equilibrium extension for \(p_m\).

This is economically useful because it shows that lower \(\tau^E\) can increase demand for entrusted production, which may raise \(p_m\) and partially offset the benefit.

## 13.3 Required modification

Add a short optional appendix subsection:

```latex
\subsection{Optional extension: contract-manufacturing service market}

The baseline model takes the contract-manufacturing service price \(p_m\) as given. A natural extension endogenizes \(p_m\) through a qualified contract-manufacturing service market.

The demand for entrusted manufacturing services is
\[
D_m(p_m;M)
=
\int
\lambda_i^*(M,p_m)
P_i(r=E\mid M,p_m)
dH_i,
\]
where \(\lambda_i^*(M,p_m)\) is the model-implied expected number of successful original-drug opportunities and \(P_i(r=E\mid M,p_m)\) is the probability that the entrusted route is chosen.

The supply of qualified contract-manufacturing services is
\[
S_m(p_m)=\int s_j(p_m;z_j^C)dH_C(j),
\]
where \(z_j^C\) indexes producer-side manufacturing capability.

The service-market-clearing condition is
\[
D_m(p_m;M)=S_m(p_m).
\]

This extension is not part of the baseline model. It is useful for studying how MAH-induced route demand may affect the contract-manufacturing price \(p_m\). A full general-equilibrium model would additionally require product-market clearing, R\&D input-market clearing, free entry, exit, and an invariant firm distribution.
```

## 13.4 Acceptance criterion

This section must be labeled optional. It should not replace the baseline PE model.

---

# 14. P2 Revision: Expand Calibration Blueprint from Three Core Objects to Eight Moment Families

## 14.1 Problem

The current calibration focuses on three composite objects. This is appropriate as a minimum, but too thin for a future SMM or indirect-inference design.

## 14.2 Economic reason

Three moments are enough for a minimal mechanism calibration, but not enough for a richer overidentified calibration.

The future version should use moment families corresponding to:

\[
route\ choice
\rightarrow
innovation\ realization
\rightarrow
entry
\rightarrow
heterogeneity
\rightarrow
producer\text{-}side\ response.
\]

## 14.3 Required modification

Add a subsection in Section 8 or Appendix:

```latex
\subsection{Preferred eight-moment extension}

The baseline mechanism calibration uses three moment families: route use, original-drug counts, and research-oriented entry. A richer implementation can expand these into eight empirical moments:

\begin{enumerate}
    \item Original-drug holder--producer split share:
    \[
    m_1=\Pr(Split_p=1\mid O_p=1).
    \]
    This disciplines the entrusted-route wedge relative to the route-choice scale.

    \item Realized original-drug count:
    \[
    m_2=E[Y^O_{it}].
    \]
    This disciplines the composite innovation-arrival scale.

    \item Original-drug share among all realized products:
    \[
    m_3=\frac{Y^O_{it}}{Y^{all}_{it}}.
    \]
    This disciplines the original-drug orientation of realized innovation.

    \item External-route use among B-like or research-oriented firms:
    \[
    m_4=\Pr(Split_p=1\mid O_p=1,\;B\text{-like firm}).
    \]
    This tests whether the mechanism is strongest for firms most likely to need external commercialization.

    \item Application-to-approval conversion for original drugs:
    \[
    m_5=\frac{\#Approved\ original\ drugs}{\#Original\ drug\ applications}.
    \]
    This moment should be used only after application/status data are available.

    \item Research-oriented entry:
    \[
    m_6=\#\{\text{first-time original-drug applicants or sponsors}\}.
    \]
    This disciplines the entry-cost distribution only when a credible firm-year entry panel is available.

    \item Heterogeneity by pre-reform manufacturing capability:
    \[
    m_7=\Delta Y^O_{LowManu}-\Delta Y^O_{HighManu}
    \]
    or
    \[
    m_7=\Delta Split^O_{LowManu}-\Delta Split^O_{HighManu}.
    \]
    This checks whether the response is stronger among firms with weaker internal manufacturing capacity.

    \item Producer-side entrusted-manufacturing response:
    \[
    m_8=\#\{\text{qualified entrusted producers}\}
    \]
    or a related measure of producer-side participation. This is needed for the optional contract-manufacturing market extension.
\end{enumerate}

These moments are not all available in the current approval-side data. The current baseline should use feasible approval-side moments and reserve conversion, entry, and producer-side moments for future merged data modules.
```

## 14.4 Acceptance criterion

The text should distinguish:

- current feasible moments;
- preferred future calibration moments;
- unavailable moments that should not be claimed now.

---

# 15. P3: Claims to Remove or Avoid

Codex should search the document and weaken or remove any claims equivalent to the following.

## 15.1 Avoid full structural estimation language

Do not say:

```text
we estimate the structural parameters of the model
```

Say:

```text
we discipline composite model objects through mechanism-calibration moments
```

## 15.2 Avoid full GE language

Do not say:

```text
stationary industry equilibrium
```

unless all market-clearing and invariant-distribution conditions are added.

Say:

```text
partial-equilibrium response under fixed background distributions
```

## 15.3 Avoid welfare language

Do not say:

```text
MAH raises welfare
```

Say:

```text
MAH raises private opportunity value for firms for which the entrusted route is relevant
```

## 15.4 Avoid primitive identification language

Do not say:

```text
we identify legal compliance cost, search cost, quality cost, or firm-specific project success probabilities
```

Say:

```text
the data discipline an effective entrusted-route wedge and composite innovation-arrival scale
```

---

# 16. Final Recommended Model Positioning Paragraph

Insert this either at the end of the Introduction or at the beginning of the Model section.

```latex
The model should be read as a partial-equilibrium mechanism model rather than a full dynamic structural model of the pharmaceutical industry. The baseline takes the market-return shifter \(R_t\), the contract-manufacturing service price \(p_m\), and the distributions of incumbent and potential entrant characteristics as given. MAH affects the firm problem only through route-set expansion and a reduction in the governance and compliance friction \(\tau^E\) of the entrusted-production route. The main theoretical results are comparative statics for private opportunity value, R\&D intensity, and expected original-drug counts. The calibration section maps feasible data moments to composite objects, but it does not claim to identify all primitives or to solve a full general-equilibrium allocation.
```

---

# 17. Final Checklist for Codex

## 17.1 Model closure

- [x] Section 4 explicitly says the model is partial equilibrium.
- [x] Exogenous objects are listed.
- [x] Endogenous firm choices are listed.
- [x] No market-clearing condition is claimed in the baseline.

## 17.2 Payoff accounting

- [x] \(R_t\) is commercialization-event payoff.
- [x] \(\pi n_{it}\) is flow payoff from existing retained drugs.
- [x] \(v_t\) is marginal continuation value of adding one retained drug.
- [x] No double counting of product lifetime value.

## 17.3 Route payoffs

- [x] Entrusted production uses \(p_m+\tau^E\), not just \(C^E+\tau^E\).
- [x] Transfer route is explicitly non-retained.
- [x] Abandonment payoff is zero.

## 17.4 Comparative statics

- [x] Main result remains:
\[
\tau^E\downarrow
\Rightarrow
\Gamma_i\uparrow
\Rightarrow
x_i^*\uparrow
\Rightarrow
\lambda_i^*\uparrow.
\]
- [x] Strict response is stated only for firms for which the entrusted route is relevant.
- [x] Aggregate counts are under fixed distributions, not GE aggregates.

## 17.5 Calibration

- [x] Logit route-share smoothing is labeled as a calibration device.
- [x] Three core composite objects are preserved.
- [x] Eight-moment extension is optional/future.
- [x] Entry-cost distribution is not used as baseline unless firm-year entry data are available.

## 17.6 Claims

- [x] No full structural identification claim.
- [x] No full GE claim.
- [x] No welfare claim.
- [x] No claim that MAH changes demand or scientific productivity.

---

# 18. Summary of the Core Revision Logic

The revision should not make the model bigger. It should make the model more precise.

The final model should be presented as:

> a partial-equilibrium dynamic route-choice model in which MAH affects original-drug innovation through route-set expansion and a reduction in the governance/compliance friction of entrusted production.

Main text: comparative statics.  
Appendix: mechanism calibration blueprint.  
Optional extension: contract-manufacturing service market clearing for \(p_m\).  
Not included: full GE, welfare, full structural estimation.
