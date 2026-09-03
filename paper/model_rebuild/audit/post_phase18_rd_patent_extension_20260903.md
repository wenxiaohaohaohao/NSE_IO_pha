# Post-Phase-18 Research--Development/Patent Extension Audit

Audit date: 2026-09-03  
Branch: `codex/mah-model-rebuild`  
Locked commercialization baseline: unchanged  
Extension authorization: explicit user selection of the full second option

## 1. Scope and completion standard

The approved task was to preserve the deterministic commercialization
baseline while fully formalizing the reserved research-versus-development
allocation extension. Completion required:

1. two distinct extension-only controls, a common resource ceiling, and a
   complete KKT system;
2. sufficient concavity and interior/corner/regime-switch qualifications;
3. separate slack- and binding-resource comparative statics;
4. an explicit but conditional patent-production mapping;
5. a finite binary MAH comparison with endogenous CMO-price feedback;
6. a precise mapping to Gu (2024), including what the extension does not
   predict;
7. no change to the baseline equilibrium set or its six propositions;
8. synchronized main text, Technical Appendix, symbols, assumptions,
   dependency map, proposition ledger, evidence boundary, and open-issues
   log; and
9. clean compilation and visual inspection of both PDFs.

All nine requirements pass.

## 2. Source evidence

- Source: Shi Gu, *Production Outsourcing and Innovation: Evidence from
  China's Pharmaceutical Industry*, August 22, 2024.
- User-provided PDF: `D:\所有下载内容\ssrn-4770849 (1).pdf`.
- SHA256:
  `A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB`.
- Previously verified evidence retained: clinical trials increase (p. 45,
  Table II); patent applications decline (p. 46, Table III); the decline is
  concentrated among firms with fewer resources (p. 47, Table IV); granted
  and core patent proxies show no statistically significant decline (p. 48,
  Table V).

The extension uses those facts as evidence boundaries, not as assumed signs.

## 3. Independent derivation audit

Let $t_i=\beta\Omega_i$ and
$\Delta_i=\kappa_{Ri}\kappa_{Di}-(t_i\gamma_i)^2>0$.

### Slack regime

Direct inversion of the two interior FOCs gives

$$
x_i^{R,u}
=\frac{\kappa_{Di}u_i+t_i^2\gamma_i a_i}{\Delta_i},
\qquad
x_i^{D,u}
=\frac{t_i(\gamma_i u_i+\kappa_{Ri}a_i)}{\Delta_i}.
$$

Re-differentiation confirms
$\partial x_i^{D,u}/\partial\Omega_i>0$ and
$\partial x_i^{R,u}/\partial\Omega_i\geq0$, with equality in the research
response exactly when $\gamma_i=0$.

### Binding regime

Substituting $x_i^D=\bar X_i-x_i^R$ into the difference between the two FOCs
gives

$$
x_i^{R,b}
=
\frac{u_i+\kappa_{Di}\bar X_i
      +t_i(\gamma_i\bar X_i-a_i)}
     {\kappa_{Ri}+\kappa_{Di}+2t_i\gamma_i}.
$$

Independent differentiation confirms

$$
\frac{\partial x_i^{R,b}}{\partial\Omega_i}
=
\frac{\beta[\gamma_i(x_i^{D,b}-x_i^{R,b})-a_i]}
     {\kappa_{Ri}+\kappa_{Di}+2t_i\gamma_i},
\qquad
\frac{\partial x_i^{D,b}}{\partial\Omega_i}
=-\frac{\partial x_i^{R,b}}{\partial\Omega_i}.
$$

Therefore the negative research/patent sign requires, rather than assumes,
$a_i>\gamma_i(x_i^{D,b}-x_i^{R,b})$.

### Planning mass and CMO demand

For $N_i=(a_i+\gamma_i x_i^R)x_i^D$, the binding-regime derivative reduces
to

$$
\frac{\partial N_i^*}{\partial\Omega_i}
=
\frac{\beta[a_i-\gamma_i(x_i^{D,b}-x_i^{R,b})]^2}
     {\kappa_{Ri}+\kappa_{Di}+2t_i\gamma_i}
\geq0.
$$

The squared numerator was re-derived manually and checked numerically over
three admissible parameterizations. Finite-difference errors in the identity
were below $1.7\times10^{-8}$, and all slack development/research monotonicity
checks passed. A revealed-preference comparison separately establishes
monotonicity of $N_i^*$ across a slack/binding switch.

Because $\Omega_{i,p_m}=-\chi_i^E\leq0$ and $\chi_i^E$ is weakly decreasing
in the candidate CMO price, extension demand
$D_{m,RD}^{MAH}=\int N_i^*\chi_i^E\,dH$ remains weakly decreasing. The same
strictly increasing supply schedule therefore retains the scalar uniqueness
logic. No capital-market or second market-clearing equation was added.

## 4. Patent and Gu (2024) claim audit

| Claim | Status | Evidence/condition |
|---|---|---|
| Patent applications are endogenous somewhere in the model | PASS | Extension equation $P_i^A=h_i(x_i^R)$ |
| MAH directly reduces patents | REJECTED | Policy still acts only through $\tau_E$, $\Omega_i$, and the KKT allocation |
| Binding-resource firms can have development up and patents down | PASS, conditional | Strict net $\Delta\Omega_i^{eq}>0$, interior binding regime, development-biased condition, and $h_i'>0$ |
| Slack-resource firms reduce patents | REJECTED | Research weakly rises; it is unchanged when $\gamma_i=0$ |
| Low observed resources identify a binding constraint | REJECTED | Only $\varpi_i>0$ defines binding; empirical groups are proxies |
| Granted/core patents must be unchanged | REJECTED as unconditional | Requires a separate local composition/inelasticity condition |
| Incremental development must respond more | REJECTED as unconditional | Common allocations and $\rho_gF_g$ retain no fixed class ranking |
| Pure-researcher entry is explained by this extension | REJECTED | It remains an extensive-margin/state-transition extension |

This is a direct, non-avoidant treatment of Gu (2024): the model now explains
the constrained-firm patent decline under explicit sufficient conditions and
states the cases in which it should not occur.

## 5. Automated audit

Command:

```powershell
.\paper\model_rebuild\scripts\audit_post_phase18_rd_extension.ps1
```

Final marker: `POST_PHASE18_RD_EXTENSION_AUDIT=PASS`.

Passed checks include:

- effective-spec SHA256 unchanged;
- all required objective, KKT, proposition, corollary, patent, CMO-demand, and
  finite-equilibrium labels present;
- exactly two separately numbered extension propositions and one extension
  corollary;
- no derivative with respect to binary $M$;
- baseline model section, baseline advancement problem, and baseline
  equilibrium contain no extension controls;
- labels unique within both compiled documents;
- Gu PDF hash verified; and
- original checkout remains dirty only in
  `paper/collaboration/MAH_model_update_20260717.zip`.

## 6. Compilation and visual audit

| Artifact | Result | Pages | SHA256 |
|---|---:|---:|---|
| Main manuscript PDF | PASS | 14 | `8151AC5A99871D5EAE8B0383E45AAED82994602678DB5C300130BB6DF7B9A293` |
| Technical Appendix PDF | PASS | 38 | `39CBB65F7B149BBAEB4CDA018D7D2E0F193FE42188F6E5A59DCCBF21C014F5B0` |

Final LaTeX logs contain zero targeted fatal errors, undefined
citations/references, duplicate labels, overfull boxes, or underfull boxes.
The only console notices were the standard MiKTeX update reminder and Windows
Perl locale fallback; neither appears as a document error.

Visual inspection covered the main title/abstract page, the complete main
extension and empirical mapping table (pp. 8--11), and the complete appendix
extension (pp. 31--37). Equations, theorem headings, references, table cells,
and page breaks are legible and not clipped.

## 7. Gate conclusion

- P0 issues: 0.
- P1 issues: 0.
- Locked baseline architecture changed: NO.
- Separately approved extension fully implemented: YES.
- Ready for model commit and collaborator-package rebuild: YES.
