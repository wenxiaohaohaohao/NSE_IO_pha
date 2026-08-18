# Symbols and Objects

Opened at Phase 1 (primitives + timing, execution note §4–§6, amendment
§A/§D/§E) and extended at Phase 2 (demand and profit, execution note §7).
Later phases append rows as they define new objects — never before the
phase that formally introduces them (red line RL-19). Categories are the
nine kinds fixed by the execution note §6.1.

**Note on branch correction:** this file was originally written before
`codex/mah-model-rebuild` was correctly based at `review-model@cd5b6e4`.
Content is unchanged (Phase 1–2 never depended on manuscript specifics),
but rows now cross-reference the *real* pre-existing manuscript objects
where relevant, instead of a different, non-canonical PDF. See
`06_open_issues_log.md` OI-01/OI-02.

| Symbol | Category | Meaning | First defined | Notes |
|---|---|---|---|---|
| $i$ | index | drug developer index (continuum) | §4.1 | not itself an object requiring classification |
| $\theta_i=(a_i,k_i)$ | exogenous firm characteristic (bundle) | permanent developer characteristics | §4.1 | only two baseline permanent characteristics — RL-02 (no discrete A/B/C types). Pre-existing manuscript's $\theta_i=(a_i,k_i,h_i^I,q_i^E,\mu_i^E,S_i,\tau_i^T)$ is a 7-tuple; crosswalked in Phase 12 |
| $a_i>0$ | exogenous firm characteristic | research capability / research productivity | §4.1 | MAH must never directly raise $a_i$ (RL-07); matches manuscript's $a_i$ directly |
| $k_i>0$ | exogenous firm characteristic | internal manufacturing capability | §4.1 | matches manuscript's $k_i$ directly |
| $j$ | index | qualified CMO index | §4.2 | |
| $z_j$ | exogenous firm characteristic | CMO manufacturing-service productivity/capacity efficiency | §4.2 | manuscript's analog is $z_j^C$ in $S_m(p_m)=\int s(p_m,z_j^C)dH_C(z_j^C)$ |
| $H(a,k)$ | aggregate/distributional primitive | joint distribution of $(a_i,k_i)$ over developers | §4.1 (implicit), formalized Phase 7 | manuscript's analog is $H_i$ |
| $H_C(z)$ | aggregate/distributional primitive | distribution of CMO efficiency $z_j$ | §4.2 (implicit), formalized Phase 6 | matches manuscript's $H_C$ directly |
| $\omega=(q,m)$ | exogenous project characteristic (bundle) | route-planning-stage project draw | §5 | **new structure**: the pre-existing manuscript has no project-level $(q,m)$ draw — its route payoffs $G_i^r$ are firm-level constants, not functions of a project draw |
| $q>0$ | exogenous project characteristic | project commercial/scientific value index | §5 | maps to market payoff only |
| $m>0$ | exogenous project characteristic | manufacturing requirement / complexity | §5 | maps to manufacturing difficulty only |
| $F(q,m)$ | aggregate/distributional primitive | joint distribution of project draws | §5 | new; no manuscript analog |
| $g\in\{O,I\}$ | exogenous project characteristic | empirical novelty class (original / incremental) | Amend. §D | **not** a new baseline decision state; enters only through type-specific distributions |
| $F_g(q,m)$ | aggregate/distributional primitive | type-specific project-draw distribution for class $g$ | Amend. §D | baseline stays agnostic about ranking $\Delta\Omega_{iO}$ vs $\Delta\Omega_{iI}$ |
| $s_g(q)$ | primitive (technology/nature function of $q$) | type-specific downstream realization probability, if required | Amend. §D | optional refinement of $s(q)$ below |
| $s(q)\in[0,1]$ | primitive (technology/nature function of $q$) | route-independent downstream clinical/regulatory realization probability | §6.2 Stage 4 | MAH must never directly shift $s(q)$ (RL-09); manuscript's analog is the firm-level decomposition $\zeta_i^r=s_i\chi_i^r$ (its eq. eq:zeta_decomposition) — crosswalked in Phase 12 |
| $M\in\{0,1\}$ | primitive parameter | institutional regime: $M=0$ pre-MAH, $M=1$ MAH retained holder–producer separation available | §6.2 Stage 0 | the single baseline policy primitive (SUCCESS-01); matches manuscript's $M$ directly, but the new baseline drops the manuscript's additional continuous $\eta\in[0,1]$ (RL-13) |
| $x_i\geq 0$ | control | **project-development / advancement intensity** (amended; NOT generic R&D, NOT upstream/patent-generating research) | §6.2 Stage 1; relabeled Amend. §A, §E | manuscript's $x_i$ is genuinely "original-drug R&D effort" with cost $C_i^R(x_i)=\frac{\kappa}{2}x_i^2$ ($R$ = R&D) — exactly the broad reading RL-21 requires narrowing; crosswalked in Phase 12 |
| $\lambda_i^{plan}=a_ix_i$ | endogenous firm-level object | intensity of viable projects reaching the route-planning / commercialization-relevant development stage | §6.2 Stage 1; Amend. §A | production function is $\lambda_i^{plan}=a_ix_i$, mathematically identical to the manuscript's eq. (eq:planning\_arrival) — only $x_i$'s interpretation narrows |
| $r\in\{I,E,T,A\}$ | endogenous route-level object | commercialization route choice: internal / retained entrusted / transfer / abandonment | §6.2 Stage 3 | route VALUES $W^r$ are not yet defined — deferred to Phase 4. Manuscript resolves this choice via logit over $G_i^r$ (RL-12 forbids this in baseline; deferred to Phase 11 extension) |
| $p_m$ | equilibrium price | manufacturing-service (CMO) price | §6.2 Stage 5 | solved in Phase 6–7; matches manuscript's $p_m$, but the new baseline's eventual $p_m^*(M)$ drops the manuscript's $\eta$ argument (manuscript has $p_m^*(M,\eta)$) |
| $A>0$ | primitive parameter | exogenous market-size shifter | §7.2 | MAH must never make $A$ a function of $M$ (RL-08); new object, no manuscript analog (manuscript takes the "market-return environment" as an unstructured given) |
| $\varepsilon>1$ | primitive parameter | demand elasticity | §7.2 | MAH must never make $\varepsilon$ a function of $M$ (RL-08) |
| $y(p;q)=Aqp^{-\varepsilon}$ | primitive (demand technology function) | constant-elasticity residual demand | §7.2 | $q$ itself remains the Phase-1 exogenous project characteristic; MAH must never shift $q$ (RL-08) |
| $c>0$ | free argument (generic, not yet a primitive) | placeholder marginal manufacturing cost | §7.3 | intentionally undetermined in Phase 2; instantiated as $c_I(m,k_i)$ or $c_E(m)$ in Phase 3 |
| $p^*(c)=\frac{\varepsilon}{\varepsilon-1}c$ | endogenous firm-level object | optimal static price given cost $c$ | §7.3 | derived from the pricing FOC, not a primitive |
| $\pi(q,c)$ | endogenous firm-level object | derived per-period operating profit | §7.3 | replaces manuscript's $R_i^{event}$/$\bar R_i^E$ role once combined with route-specific cost (Phase 12 crosswalk) |
| $\varphi\in[0,1)$ | primitive parameter | probability a commercialized drug remains commercially active next period | §7.4 | new; no manuscript analog stated explicitly |
| $\beta\in(0,1)$ | primitive parameter | discount factor | §7.4 | matches manuscript's $\beta$ directly |
| $R(q,c)$ | endogenous firm-level object | derived present-value return, $=\pi(q,c)/(1-\beta\varphi)$ | §7.4 | replaces manuscript's $R_i^{event}$ and $\bar R_i^E$ (see `02_demand_profit_derivation.tex` §Crosswalk) |

## Objects explicitly NOT yet defined (deferred; must not appear before their phase)

$C_X(\cdot)$/$C_R(\cdot)$ (advancement cost), $\Omega_i$, $W_i^I,W_i^E,W_i^T,W^A$,
$c_I(m,k_i)$, $F_I(m,k_i)$, $c_E(m)$, $b(m)$, $F_E(m)$, $\mu_E$, $\tau_E(M)$,
$k^*$, $\Psi(s_j;z_j)$, $S_m(p_m)$,
$D_m(p_m;M)$, $\Omega_{ig}$, $Y_i^{ret}$, $Y_{ig}^{ret}$, $\Lambda_i^{plan}$.
These belong to Phases 3–9 and are introduced there under RL-19.

## Notation discipline log (RL-18)

- Amendment v1.1 changes the *interpretation* of $x_i$ but not its symbol or
  its production-function role $\lambda_i^{plan}=a_ix_i$ — no notation break.
- Amendment v1.1 introduces $g,F_g,s_g,\Omega_{ig}$ as additive objects; no
  existing symbol is overloaded or reused.
- If Phase 5 working files still contain $C_R$ from the pre-amendment draft,
  the amendment (§F) permits keeping $C_R$ **only if** the surrounding text
  redefines $R$ explicitly as development-stage investment, not upstream
  research. The pre-existing manuscript's $C_i^R(x_i)=\frac{\kappa}{2}x_i^2$
  genuinely uses $R$ for R&D — so per the amendment's own rule, Phase 5
  should adopt $C_X$, not carry $C_R$ forward, when it is drafted (not yet
  reached).
- Phase 2 introduces $R(q,c)$ (present-value return). This is a distinct
  symbol from the manuscript's $R_i^{event}$/$\bar R_i^E$ (which it
  replaces) and from any possible legacy reading of $C_R$'s subscript
  discussed above — the two uses of the letter "R" are never used in the
  same module. If Phase 5 retains $C_R(x_i)$ despite the note above, its
  subsection must state explicitly that this $R$ means development-stage
  investment, not the Phase 2 return function, to avoid a silent notation
  clash (RL-18).
