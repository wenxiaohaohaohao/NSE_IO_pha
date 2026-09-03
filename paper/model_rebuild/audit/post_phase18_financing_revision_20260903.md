# Post-Phase-18 Commercialization-Financing Revision Audit

Date: 2026-09-03  
Branch: `codex/mah-model-rebuild`  
Instruction source: `spec/source/MAH_financing_friction_codex_notes.md`  
Instruction SHA256: `C139AE0B795A26851573438891F3CA30AABF46832B3CF97B22FF19138C4B61F9`

## Result

`POST_PHASE18_FINANCING_REVISION_AUDIT=PASS`

No P0 or unresolved P1 issue remains. The current baseline is a
commercialization-organization model with predetermined financing capacity,
not a credit-supply or research-allocation model.

## Economic and mathematical checks

| Check | Result | Evidence |
|---|---|---|
| Developer heterogeneity | PASS | $\theta_i=(a_i,k_i,\ell_i)\sim H(a,k,\ell)$; no independence restriction |
| Policy channel | PASS | $M$ changes only $\tau_E(M)$; it does not change $\ell_i,J_I,J_E$ or CMO supply |
| Internal financeability | PASS | $J_I(m,k_i)\le\ell_i$, $J_{I,m}>0$, $J_{I,k}<0$ |
| Entrusted financeability | PASS | $J_E(m)\le\ell_i$, $J_E'(m)>0$, and $J_E>0$ in the baseline |
| Route accounting | PASS | $F_I$ is subtracted once; $F_E,p_mb,\mu_E,\tau_E$ are each subtracted once; $J_I,J_E$ are never subtracted |
| Hard low-$k$ convention | PASS | $F_I$ remains finite; the old convention is recovered only as $J_I\to\infty$ |
| Deterministic choice | PASS | financeability screen followed by the $I/E/T/A$ value argmax; no logit or finance choice |
| Conditional sorting | PASS | on the common-financeability interval, $\Delta_{IE,k}=sR_cc_{I,k}-F_{I,k}>0$ |
| Financing corridor | PASS | locally $J_E<J_I$ gives F0, F1 and F2 regions; strict gain requires financeable $E$ and value dominance |
| Advancement | PASS | one common $x_i^*=[\beta a_i\Omega_i/\kappa]^{1/\nu}$; financing enters only through $\Omega_i$ |
| Financing monotonicity | PASS | within a regime, higher $\ell_i$ weakly expands the feasible set; the MAH treatment effect has no global monotone sign and may kink at thresholds |
| CMO closure | PASS | demand integrates over $H(a,k,\ell)$; $J_E$ is price invariant; demand remains weakly decreasing and supply strictly increasing |
| Scarcity attenuation | PASS | $p_m^1\ge p_m^0$, $0\le\Delta\Omega_i^{eq}\le\Delta\Omega_i^{dir}$ and the analogous advancement inequality |
| Nesting | PASS | if $\ell_i\ge\max\{J_I,J_E\}$ on the support, $\widetilde W^I=W^I$ and $\widetilde W^E=W^E$ |
| Gu/patent boundary | PASS | no active $x_i^R,x_i^D,\bar X_i,P_i^A$; patents are outside the current endogenous outcome set |
| Main-text compression | PASS | exactly four formal propositions |

## Boundary checks

- $\ell_i\to0$: both retained routes can be infeasible and the reform can
  have zero effect.
- $\ell_i\to\infty$: the preceding no-financing-friction commercialization
  model is nested.
- $J_E\to0$: identified as an extreme boundary, not the baseline.
- $J_E\ge J_I$: no financing-relief advantage, while an organizational-value
  advantage may remain.
- $J_I\to\infty$ for low $k_i$: limiting approximation to the old hard cutoff.
- $p_m\to\infty$: entrusted value and the MAH-relevant set vanish.
- Perfectly elastic CMO supply: direct and equilibrium-price comparisons
  coincide.
- $\nu=1$: the advancement response is linear in the value gain.

## Source and compile audit

- Frozen note hash: PASS.
- Active source scan for the hard capability cutoff: PASS, zero occurrences.
- Active source scan for the retired R-D/patent controls: PASS, zero occurrences.
- Appendix import scan for the retired module: PASS, zero imports.
- Main and appendix duplicate-label scans: PASS.
- Main and appendix unresolved reference/citation scans: PASS.
- `git diff --check`: PASS.

| Artifact | Pages | SHA256 |
|---|---:|---|
| Main manuscript PDF | 14 | `3A1DBB1A669EDF3E0CD755CE36BDA79621E3ACC3AB7B409A92D375562B11D35F` |
| Technical appendix PDF | 35 | `453A14D4791E806BEE53567596F75C49792E2A7C6B9BC4DDA6021726DE8ED3DF` |
| Full derivation PDF | 38 | `7703D99A8F75A967CD25AD654222C61713223F9E1DDCB367005074E955A02911` |
| Main-text candidate PDF | 4 | `82FB3D860406466D5294A53DBCC04DDCD004D7A6DD0F94BE2D947F11691CC58F` |
| Appendix candidate PDF | 35 | `B167A36836E8EA47DF3630D5769A691E8582AEFE6941C7CE22C0F772547B0454` |

All five final logs have zero fatal errors, undefined citations/references,
duplicate labels, overfull boxes, and underfull boxes.

## Scope and archival disposition

The previous formal source was copied to
`backups/pre_financing_revision_20260903/` with a SHA256 manifest before this
revision. The former active research--development/patent module was moved to
`archive/15_research_development_patent_extension_superseded_20260903.tex`.
It remains recoverable in Git but is not an active compile dependency.
