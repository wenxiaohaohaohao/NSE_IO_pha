# Phase 15 Preflight

- Phase: 15 - Comparative Statics and Full Derivation Draft
- Status at start: IN PROGRESS
- Checked: 2026-09-01 Asia/Shanghai
- Branch: codex/mah-model-rebuild
- Entry commit: 90cb8b867209f3776d14571544c8a29a70632a03
- Entry remote commit: 90cb8b867209f3776d14571544c8a29a70632a03
- Locked base: cd5b6e49608749e0bf32f3d9aa235a84f378347b
- Effective-spec SHA256:
  855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666
- Previous phase: Phase 14 APPROVED
- Phase 16 at start: NOT STARTED

## Completion standard

Phase 15 must produce a formal comparative-static module and a self-contained,
compilable full derivation draft. Every result must name the mathematical
margin, differentiated object, held-fixed objects, algebra, sufficient sign
conditions, economic interpretation, empirical prediction and zero-effect
case. Binary policy comparisons must be finite. Continuous derivatives must
identify their continuous argument. Fixed candidate price and equilibrium
price must never be conflated.

The mandatory boundaries are:

1. \(k_i\to\infty\);
2. \(k_i<\underline{k}(m)\);
3. \(M=0\);
4. \(p_m\to\infty\);
5. \(W_i^E\leq W_i^0\) for every project draw;
6. perfectly elastic CMO supply;
7. \(\nu=1\);
8. \(\rho_O=0\);
9. \(\rho_{\mathrm{Inc}}=0\); and
10. no baseline ordering of class-specific gains.

## Preflight checks

| Check | Result |
|---|---|
| five controlling hashes | PASS |
| branch and local/remote entry commit | PASS |
| Phase 14 APPROVED; Phase 16 NOT STARTED | PASS |
| worktree clean at entry | PASS |
| paper/manuscript unchanged from locked base | PASS |
| collaborator ZIP absent from rebuild worktree status | PASS |
| all outputs and temporary files remain on D drive | PASS |

## Correction identified by independent re-derivation

Phase 8 correctly derived a strictly positive total
\(\Delta_{IE,k}\), but one proof sentence called both component terms strictly
positive. The operating-cost component is only weakly positive when
\(s(q)=0\); the setup-cost component remains strictly positive. Phase 15
corrects this P1 wording while preserving the proof, proposition and locked
architecture.

No P0 issue was found at preflight.
