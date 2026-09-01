# Phase 17 Preflight

Date: 2026-09-01

## Entry state

- Branch: `codex/mah-model-rebuild`
- Locked base: `cd5b6e49608749e0bf32f3d9aa235a84f378347b`
- Phase 16 commit:
  `8d0ef8902d88f129e3ac3be41fcca6416f869398`
- Phase 16 local/remote equality: PASS
- Worktree before Phase 17: clean
- Effective specification SHA256:
  `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666`
- Main candidate SHA256:
  `1FEBFBE7C6F989C817937CBB49377E8816C60CEB790B4713884F6BE54367B688`
- Appendix candidate SHA256:
  `8165589801A389FADA4CD3ED9957F8F2D01B1B787569861C08B1A3CBD64194FF`
- Phase 16 status: `APPROVED` under `EXEC-GOV-001`
- Phase 18 status: `BLOCKED`
- Manuscript diff from locked base: none
- Collaborator ZIP in the rebuild worktree: absent

## Material reread

Before the audit began, the following controlling material was reread:

1. the v1.2 innovation-object correction and all 28 absolute red lines;
2. the full Phase 17 consistency-audit instructions;
3. proof/algebra QA, economic-interpretation QA, and success criteria;
4. `01_symbols_and_objects.md`;
5. the causal order, CMO fixed point, fixed/equilibrium price distinction,
   and forbidden arrows in `02_equation_dependency_map.md`;
6. `03_assumptions_and_scope.md` and its architecture guards;
7. `06_open_issues_log.md`;
8. the approved Phase 16 candidates and Shi Gu evidence boundary.

The effective specification's historical Shi Gu checkpoint remains
hash-frozen. Its conditional `UNVERIFIED until the PDF is checked` language
has been satisfied by the Phase 16 primary-source audit; the live resolution
is recorded in `06_open_issues_log.md` and
`08_shigu_empirical_boundary_check.md`.

## Completion standard

Phase 17 passes only if:

- every occurrence of the required core objects in both candidates, the
  empirical interface, and the full-draft assembly is catalogued and
  classified;
- the candidates use each object with one economic meaning;
- the only direct policy channel is `M -> tau_E(M)`;
- fixed candidate-price and equilibrium-price claims are not mixed;
- planning-stage, route, separation, and realized-product objects retain the
  approved timing;
- baseline and extension mechanisms remain separated;
- the main and appendix candidates still compile with zero fatal,
  undefined-reference, duplicate-label, or box warnings;
- candidate P0 count is zero; and
- `paper/manuscript/` remains unchanged.

## Authorized scope

Phase 17 may create the formal consistency audit, an occurrence catalog,
auditing scripts, compilation/render records, and the Phase 17 gate package.
It may modify a Phase 16 candidate only to correct a documented consistency
error. It may not modify `paper/manuscript/` or begin Phase 18 integration.

Preflight result: `PASS`.
