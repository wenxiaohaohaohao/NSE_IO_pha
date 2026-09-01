# Phase 16 Independent Split and Evidence Audit

Date: 2026-09-01

## 1. Completion standard

Phase 16 passes only if the two candidates are a restrained split of the
approved Phase 15 draft, the Shi Gu boundary uses primary-source page/table
evidence, both candidates compile, the locked model architecture is unchanged,
and `paper/manuscript/` remains byte-identical to the locked base.

## 2. Source and evidence integrity

- The user-supplied August 22, 2024, 74-page Shi Gu PDF was copied
  byte-identically to the project-local evidence directory.
- Source and copy SHA256:
  `A13D5D1D3DE3A0E4E0D15D5DBF428F2F395C9B95E960C7B3C97652CBC8D9EAEB`.
- Tables II--IX on PDF pages 45--52 were checked against the paper's
  discussion on pages 19--26.
- `SG-01`--`SG-04` and `SG-07` are directly verified.
- `SG-05` and `SG-06` are verified with a precision limit: the reported point
  estimates and the author's description support the direction of the
  comparison, but the paper does not report a formal cross-column equality
  test.
- No required v1.1 detail remains unverified for this identified PDF version.

## 3. Main-text candidate audit

- The candidate uses only approved primitives and equilibrium objects.
- `x_i` retains the v1.2 meaning: original-drug innovation investment /
  project-advancement intensity; it is not patent effort or pure clinical
  effort.
- The policy is binary, route choice is deterministic, and the reform affects
  advancement only through `Omega_i`.
- The partial equilibrium contains exactly
  `{p_m^*,x_i^*,r_i^*(q,m),s_j^*}`.
- Fixed-price and equilibrium-price claims are distinguished.
- Planning-stage projects, organizational assignment, and realized outcomes
  occur in the approved timing order.
- Original and incremental projects share the common control; no fixed novelty
  ranking is imposed.
- Patent applications are explicitly outside the baseline.

Independent mathematical comparison against the approved modules found no
changed sign, omitted cost term, new state variable, new control, or new
market-clearing condition.

## 4. Appendix candidate audit

- The appendix imports the approved derivation modules in their economic
  dependency order.
- It preserves full pricing, technology, route, advancement, equilibrium,
  proposition, comparative-statics, and outcome derivations.
- The research-versus-development boundary uses only claims authorized by the
  Shi Gu evidence ledger.
- Research allocation, financial constraints, entry, logit choice, and other
  non-baseline mechanisms remain in the explicitly labelled extensions
  section and do not alter the baseline.

## 5. Compilation and scope

- Main candidate: 4 pages, two-pass MiKTeX compile, zero fatal, undefined,
  duplicate-label, overfull, or underfull warnings.
- Appendix candidate: 33 pages, two-pass MiKTeX compile, zero fatal, undefined,
  duplicate-label, overfull, or underfull warnings.
- Visual PDF audit: PASS.
- `paper/manuscript/` diff relative to
  `cd5b6e49608749e0bf32f3d9aa235a84f378347b`: none.
- The original checkout's modified collaborator ZIP is absent from this
  worktree and from the Phase 16 change set.

## 6. Severity conclusion

- P0: 0
- P1: 0
- Architecture change: NO
- Evidence blocker: NONE
- Independent gate: `PASS`

