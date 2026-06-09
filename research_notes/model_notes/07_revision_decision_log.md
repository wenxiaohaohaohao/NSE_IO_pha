# 07 Revision Decision Log

This file records final decisions on disputed review issues. Codex should follow these decisions unless the user explicitly changes them.

## Decision 1: Should the model become full GE?

**Final decision:** No.

The model should not become a full product-market GE model. Keep \(R_t\) fixed in the baseline. Move CES derivation to appendix or reduce it in the main text.

**Reason:** The paper studies commercialization-route frictions, not product-market general equilibrium.

## Decision 2: Should the model become a full free-entry model?

**Final decision:** No, not in the baseline.

Entry can be discussed as activation of latent research-oriented firms:

\[
N_E(M)=N_0\Pr(A_i(M)\ge f_i^e).
\]

Do not impose a full zero-profit free-entry equilibrium unless a separate structural section is developed.

## Decision 3: Should the model solve exit and invariant distribution?

**Final decision:** No, not in the baseline.

Do not claim full Hopenhayn stationary equilibrium. Use Hopenhayn/Klette--Kortum only as conceptual inspiration for dynamic firm/innovation language.

## Decision 4: Should \(p_m\) be endogenous?

**Final decision:** Yes.

The CMO service market should be closed in the baseline:

\[
D_m(p_m;M)=S_m(p_m).
\]

This determines:

\[
p_m^*(M).
\]

This is the minimal market closure needed for the mechanism.

## Decision 5: Should \(\zeta^E\) be introduced?

**Final decision:** Yes, but only as a composite or derived route-realization object.

Do not claim separate structural identification of \(\zeta^E\) unless there is direct realization-probability data.

Use:

\[
\mathcal V_i^E(M)=\zeta_i^E(M)\widetilde R_i^E.
\]

If identification is weak, calibrate or discuss \(\mathcal V_i^E\), not \(\zeta_i^E\) alone.

## Decision 6: How to treat post-production risk?

**Final decision:** Baseline should not model multiple post-production risks separately.

Use one risk-adjusted payoff:

\[
\widetilde R_i^E.
\]

If needed, in appendix define:

\[
\omega_i\sim F_{post}^E,\qquad \widetilde R_i^E=\mathbb E[R(\omega_i)+v].
\]

Do not create separate state variables for sales, after-sales, pharmacovigilance, penalties, or partner default.

## Decision 7: Should Phase III production-partner timing be general baseline?

**Final decision:** No.

The general model should allow both integrated and research-oriented firms.

Use firm-specific route feasibility:

\[
\mathcal R_i(M)=\{A,T\}\cup\{I:h_i^I=1\}\cup\{E:M=1,q_i^E=1\}.
\]

In the empirical module or research-oriented subsample, impose:

\[
h_i^I=0.
\]

Do not impose no internal production for all firms.

## Decision 8: Deterministic route choice or logit?

**Final decision:** If route-share calibration is used, use logit inclusive value in the baseline.

\[
\Gamma_i(M)=\sigma_r\log\sum_r\exp(G_i^r/\sigma_r).
\]

Deterministic max is the limiting case:

\[
\sigma_r\to0.
\]

Do not mix deterministic comparative statics with logit calibration.

## Decision 9: Should \(S_i\) be exogenous?

**Final decision:** Baseline may keep \(S_i\) exogenous for tractability, but the paper should add a GHM hold-up discussion.

Preferred conceptual extension:

\[
S_i=S_i(\text{best retained outside option}).
\]

MAH can raise the transfer price by improving the innovator's outside option.

## Decision 10: How to use GHM property-rights theory?

**Final decision:** Add as theoretical foundation.

Interpret MAH as improving the research firm's outside option in bargaining with producers or buyers. This reduces hold-up and raises ex-ante R&D incentives.

This does not require a full bargaining model in the baseline, but the mechanism should be stated.

## Decision 11: What should be the main proposition?

**Final decision:** The main proposition should be sorting, not weak option-value.

Avoid making this the main result:

\[
\max\{I,E,T,A\}\geq \max\{I,T,A\}.
\]

Instead, state conditions under which high-\(a\), low-\(k\), low-\(\mu^E\), CMO-accessible firms respond most strongly.

## Decision 12: What should Codex edit first?

**Final decision:** Codex should first update notes, not the main text.

Then Codex should make local edits in this order:

1. symbols and definitions;
2. route payoff;
3. route choice and \(\Gamma\);
4. observed realization;
5. CMO market closure;
6. propositions;
7. calibration mapping.

Do not ask Codex to rewrite the whole paper from all reviews.
