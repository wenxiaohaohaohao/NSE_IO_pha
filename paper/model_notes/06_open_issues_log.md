# Open Issues Log

Format per execution note §25. An issue that would alter the locked
architecture requires explicit user approval before any implementation.

---

```text
ID: OI-01
Phase: 1 (surfaced during spec freeze, before formal Phase 1 derivation)
Equation/object: identity of the "current manuscript"
Status: RESOLVED
Issue (original): No remote was known at the time this workspace was first
  set up. Only a PDF (new-2.pdf) had been supplied directly by the user,
  and no .tex source was available anywhere on the machine. It was
  provisionally treated as the current manuscript, and the workspace was
  built on a freshly initialized, disconnected git repo (see OI-02).
Resolution: Once the remote https://github.com/wenxiaohaohaohao/NSE_IO_pha
  was supplied by the user and fetched, branch `review-model` at commit
  `cd5b6e4` (exactly the commit the spec names) was found to contain the
  real manuscript source: paper/manuscript/mah_route_indicator_friction_model.tex
  (393 lines), which uses eta (50x), Gamma (11x), logit (3x), and
  "inclusive value" (3x) -- matching the execution note's assumed "current
  model" (reduced-form chain G^I,G^E,G^T -> Gamma -> x with logit/inclusive
  value and continuous eta) almost exactly, and matching the note's own
  Phase-12 crosswalk table object-for-object (R_i^event, bar-R_i^E,
  zeta_i^E, eta, quadratic C_i^R(x_i)=kappa/2 x_i^2, etc. all present
  verbatim in the real manuscript).
  new-2.pdf shares the manuscript's exact title ("MAH, Commercialization
  Frictions, and Original-Drug Innovation") but has none of eta/Gamma/logit
  -- a deterministic-max route choice, no eta at all. Per user confirmation
  (2026-08-18), new-2.pdf is understood to be a target/draft output of a
  *different*, earlier document -- paper/MAH_model_revision_plan_for_codex.md,
  found in the same repo, which explicitly plans to move the baseline to a
  deterministic route choice with logit only as a calibration bridge --
  produced elsewhere (a separate tool/session) and never committed to this
  repo. It is archived at paper/spec/reference_only/new-2_target_draft_unverified.pdf
  and is NOT used as a source of truth for any phase; it is background
  context only.
Why it mattered economically: the crosswalk table (Phase 12) and the
  manuscript-integration phase (Phase 18) both depend on the canonical
  manuscript's actual content. Getting this wrong would have produced a
  crosswalk against a document that doesn't exist in this repo's history.
Why it mattered mathematically: none for Phases 1-2 specifically (both
  modules are self-contained and did not depend on manuscript specifics),
  but forward references (the Phase 2 crosswalk note) initially pointed at
  the wrong document's equation numbers and have been corrected.
Approval: user confirmed both the new-2.pdf classification and the branch
  correction (OI-02) in the same exchange, 2026-08-18.
```

---

```text
ID: OI-02
Phase: 1 (spec freeze / workspace setup)
Equation/object: git branch base
Status: RESOLVED
Issue (original): The note instructs branching codex/mah-model-rebuild from
  review-model@cd5b6e4. At first setup, this directory had no git remote
  configured and no local git history, so no such commit could be found.
  A fresh repo was initialized instead; existing project contents were
  committed as a root commit (e2ce725) on a new `main`, and
  codex/mah-model-rebuild was branched from e2ce725. Phase 1 and Phase 2
  were drafted and approved on that branch (commits eb3338d, c9d1aa8).
Resolution: The user supplied the real remote,
  https://github.com/wenxiaohaohaohao/NSE_IO_pha. Fetching it revealed
  `review-model` at commit `cd5b6e4` -- exactly the commit named in the
  spec -- carrying the real manuscript, research_notes/, and full prior
  history (52+ commits). Per user direction (2026-08-18): the old,
  disconnected codex/mah-model-rebuild branch was tagged
  `archive/codex-mah-model-rebuild-orphaned-attempt` (pointing at c9d1aa8)
  for audit trail, then deleted. codex/mah-model-rebuild was recreated
  from review-model@cd5b6e4 (the correct base). Phase 1 and Phase 2
  derivation content -- which never depended on the manuscript or on
  repo history -- was replayed onto the new branch unchanged in its
  mathematical content; only the Phase 2 forward-crosswalk note was
  corrected to reference the real legacy objects (R_i^event, bar-R_i^E,
  Gamma_i) instead of the wrong document's equation numbers.
Why it mattered economically/mathematically: same as OI-01 -- affects
  which document Phase 12/18 target, not the Phase 1-2 math itself.
Approval: user confirmed via AskUserQuestion, 2026-08-18 ("Delete it and
  recreate codex/mah-model-rebuild from review-model@cd5b6e4, replaying
  the Phase 1/2 math").
```

---

```text
ID: OI-03
Phase: 1-2 (recorded during OI-01/OI-02 correction)
Equation/object: research_notes/model_notes/ (pre-existing, parallel notes
  system) and paper/MAH_model_revision_plan_for_codex.md (a prior, separate
  revision plan)
Status: OPEN (informational, non-blocking)
Issue: This repository already contains a fully worked-out notes system at
  research_notes/model_notes/ (files 00-12 plus a generator script)
  documenting the pre-existing manuscript's model in detail -- symbols,
  dependency map, assumptions, comparative-statics checklist, calibration
  mapping, Bellman accounting, decision log, closure audit, file-layering
  rules, consistency audits, proposition-dependency audit, calibration-
  claim audit. Its own README states it governs
  paper/manuscript/mah_route_indicator_friction_model.tex directly and
  predates the current execution note + amendment v1.1. There is also
  paper/MAH_model_revision_plan_for_codex.md, a different, apparently
  earlier revision plan than the current spec, whose target structure
  (deterministic route choice + logit-as-calibration-bridge, kept p_m
  explicit, etc.) appears to be what new-2.pdf implements.
Why it matters economically: research_notes/model_notes/ is valuable
  crosswalk material for Phase 12 (it already enumerates old-model
  objects and their roles) and could shortcut some of that phase's work.
  It is not being used yet.
Why it matters mathematically: none yet -- no phase has consulted it for
  derivation content, only for confirming the real manuscript's object
  names (used already in Phase 1/2's crosswalk notes).
Candidate resolutions:
  (a) Treat research_notes/model_notes/ purely as read-only reference
      material to consult when Phase 12 (crosswalk) is drafted, without
      modifying it.
  (b) Ask the user whether MAH_model_revision_plan_for_codex.md and its
      apparent output (new-2.pdf) should inform any specific phase's
      content beyond what the current execution note + amendment already
      specify, since some of its ideas (e.g. writing entrusted cost as
      p_m directly) already appear in the current spec independently.
Preferred resolution: (a) now; (b) deferred until Phase 12, when the
  crosswalk table is actually built and research_notes/model_notes/ is
  read in full for the first time.
Does this alter the locked architecture? NO.
Approval required before change? NO -- informational only.
```
