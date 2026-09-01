# 08 Shi Gu Empirical Boundary Check

## 1. Source and verification protocol

- Paper: Shi Gu, *Production Outsourcing and Innovation: Evidence from
  China’s Pharmaceutical Industry*
- Version date printed on page 1: August 22, 2024
- Length: 74 PDF pages
- User-confirmed source:
  `D:\所有下载内容\ssrn-4770849 (1).pdf`
- Frozen local SHA256:
  `A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB`
- Verification date: 2026-09-01
- Verification method: page-preserving text extraction followed by visual
  inspection of PDF pages 45--52.

Verdicts have the following meanings:

- `VERIFIED`: the stated fact is directly supported by the identified text
  and table;
- `VERIFIED WITH PRECISION LIMIT`: the source reports the qualitative
  comparison and the point estimates follow it, but it does not report a
  formal cross-coefficient equality test;
- `CONTRADICTED`: the source reports the opposite;
- `UNVERIFIED`: the available version does not establish the claim.

## 2. Claim-by-claim evidence ledger

| ID | Detailed claim from v1.1 | PDF evidence | Verdict | Exact interpretation permitted here |
|---|---|---|---|---|
| `SG-01` | Production outsourcing increases clinical trials among firms without production facilities | p. 1 abstract; p. 45, Table II, `NP x Treat x Post = 0.026***` in the baseline treated-drug specification | VERIFIED | The policy raises clinical-trial registrations for incumbent innovators without production lines relative to the triple-difference comparison group. It does not establish that every firm or every project responds. |
| `SG-02` | The increase is concentrated in first-stage trials | p. 24 discussion; p. 51, Table VIII: first-stage coefficients `0.0250***` and `0.0254***`, versus `-0.0040` and `-0.0017` for second-and-later stages | VERIFIED | The source's stage split supports an initial-stage response and no statistically significant later-stage response. This is an empirical timing result, not a redefinition of baseline `x_i` as clinical effort. |
| `SG-03` | Patent applications decline for affected firms, especially those with tighter financial resources | p. 19--20 discussion; p. 46, Table III: `-0.082**` and `-0.107***`; p. 47, Table IV(a): `-0.142***` and `-0.140***` for fewer-resource firms, while Table IV(b) is statistically insignificant for more-resource firms | VERIFIED | The average affected-firm patent margin is negative in the baseline specifications and the statistically significant decline is concentrated in the fewer-resource subsample. This is outside the MAH baseline endogenous outcomes. |
| `SG-04` | High-value, eventually granted, and core patent outcomes do not significantly decline | p. 21 discussion; p. 48, Table V: granted-patent coefficients `-0.0340` and `-0.0382`; core-patent coefficients `-0.0203` and `-0.0214`, all statistically insignificant | VERIFIED | The permitted statement is failure to find a statistically significant decline for the paper's granted- and core-patent proxies. It is not proof that the true effects are exactly zero. |
| `SG-05` | Incrementally innovative chemical-drug development responds more strongly than originally innovative chemical-drug development | p. 24 discussion; p. 50, Table VII: original-chemical coefficients `0.0053` and `0.0058`, statistically insignificant; incremental-chemical coefficients `0.0123***` in both specifications | VERIFIED WITH PRECISION LIMIT | The author describes the incremental response as more pronounced, and the reported point estimates/significance pattern support that description. No formal cross-column equality test is reported, so the candidate may not claim a statistically established coefficient difference. |
| `SG-06` | Originally innovative biological-drug development has a smaller positive response | p. 24 discussion; p. 50, Table VII: original-biological coefficients `0.0070**` and `0.0069**` versus `0.0123***` for incremental chemical drugs | VERIFIED WITH PRECISION LIMIT | The original-biological point estimates are positive, statistically significant, and numerically smaller; the author calls the effect comparatively modest. No formal cross-column equality test is reported. |
| `SG-07` | Pure researchers become more likely to transition into developers | p. 25--26 discussion; p. 52, Table IX: transition coefficients range from `0.030***` to `0.036***`; the main estimate is `0.036***` | VERIFIED | A first clinical trial defines the transition in this exercise. The result concerns an extensive-margin entry into development, not the intensive common control in the MAH baseline. |

There are no remaining `UNVERIFIED` v1.1 claims in the required Phase 16
checkpoint for this identified paper version.

## 3. Model-boundary classification

| Evidence item | Relation to the rebuilt baseline |
|---|---|
| Stronger response among firms without production facilities | Baseline heterogeneity prediction: low internal manufacturing capability can enlarge the value of the retained entrusted route. |
| More clinical trials | Consistent with higher project advancement and more projects reaching commercialization-relevant planning, but clinical trials are an empirical proxy and not definitionally equal to `x_i`. |
| First-stage rather than later-stage trial response | Heterogeneity/timing test outside the one-stage baseline; a phase-specific development technology would be an extension. |
| Patent decline and financial-resource split | Outside the baseline. Explaining it requires the inactive research-versus-development allocation extension and a financial constraint. |
| Granted/core patents do not significantly decline | Evidence that research and project-advancement margins can diverge; not a baseline prediction about patents. |
| Original/incremental/biological response pattern | Empirical heterogeneity test using `g` and conditional distributions. The baseline imposes no class ranking and uses no class-specific control. |
| Pure-researcher transition into development | Entry/extensive-margin evidence outside the fixed-population partial-equilibrium baseline. It can motivate a separately approved entry extension. |

The evidence therefore supports the boundary

`MAH -> anticipated availability/value of E -> Omega_i -> x_i`

without implying

`MAH -> patent applications increase`.

It does not authorize a financial constraint, separate `x_i^R` and `x_i^D`
controls, or any fixed original-versus-incremental ranking in the baseline.

## 4. Current-manuscript conflict audit

The locked manuscript is not modified in Phase 16. The following existing
sentences require replacement or narrowing in Phase 18:

| File and line | Existing issue | Required Phase 18 correction |
|---|---|---|
| `paper/manuscript/mah_route_indicator_friction_model.tex:44` | Abstract equates `x_i` with original-drug R&D and states comparative statics for original-drug outcomes under the obsolete eta/logit architecture | Replace with project-advancement terminology, deterministic baseline, binary reform, and novelty-agnostic outcome language. |
| `paper/manuscript/mah_route_indicator_friction_model.tex:52` | “current R&D becomes more valuable” is broad enough to include patent-generating research | State that anticipated commercialization value raises the value of advancing viable projects; patents remain outside the baseline. |
| `paper/manuscript/mah_route_indicator_friction_model.tex:78` | Defines `x_i` as original-drug R&D effort | Replace with the v1.2 definition: original-drug innovation investment / project-advancement intensity, broader than pure clinical effort but excluding upstream patent-generating research. |
| `paper/manuscript/mah_route_indicator_friction_model.tex:340` | Presents a positive realized original-drug response without the new corollary's no-ranking/zero-effect qualification | State the sufficient conditions and allow zero effects and ambiguous original-versus-incremental composition. |
| `paper/manuscript/mah_route_indicator_friction_model.tex:387` | Conclusion again uses generic R&D incentives and realized original-drug outcomes | Narrow to project value, project advancement, organizational assignment, and realized-product outcomes under explicit conditions. |
| `paper/manuscript/mah_route_indicator_friction_model_appendix.tex:1246` | Uses the obsolete logit inclusive value and generic original-drug R&D definition | Replace the old appendix block with the rebuilt deterministic derivation and the research/development boundary. |

These are scheduled old-model conflicts, not defects in the Phase 16
candidates. They remain read-only until Phase 18.

## 5. Authorized citation language for Phase 16

The appendix candidate may state:

> Shi Gu (2024) documents that allowing production outsourcing can raise
> clinical development while patent applications need not rise, and can fall
> among firms with fewer financial resources. This establishes that
> development and upstream research are distinct empirical margins.

It may also report, with the precision limits above, that the paper finds
the clinical-trial response concentrated in initial-stage and incrementally
innovative projects and documents transitions from pure research into
development.

The candidate may not:

1. call patent applications an outcome generated by baseline `x_i`;
2. import the paper's financial-constraint mechanism;
3. claim a statistically tested cross-class coefficient difference that the
   paper does not report;
4. infer that MAH must raise original or breakthrough innovation;
5. redefine the present paper as a replication of Shi Gu's empirical design.

## 6. Gate conclusion

`ISSUE-SPEC-001` is resolved for the Phase 16 and Phase 18 claim boundary.
All seven required detailed claims have primary-source page/table evidence.
The two cross-class comparisons retain explicit inference limits. No
architecture change follows from this verification.
