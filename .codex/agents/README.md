# Research subagents

This project now has a project-scoped Codex subagent setup under `.codex/agents`.

Available custom agents:

- `theory-modeler`: theory model construction, equilibrium logic, proofs, comparative statics, and LaTeX-ready derivations
- `stata-empiricist`: Stata code, identification, regressions, logs, robustness checks, and table workflows
- `matlab-solver`: MATLAB calibration, simulation, optimization, fixed-point logic, and numerical debugging
- `python-researcher`: Python helpers, data prep, simulation glue, plotting, validation, and conversion scripts
- `manuscript-crafter`: paper writing, LaTeX editing, tables, slides, and Word-oriented deliverables
- `research-reviewer`: review-only pass for bugs, risks, overclaims, and reproducibility issues

Suggested ways to use them:

- `Use theory-modeler to check whether the dynamic problem and propositions are internally consistent.`
- `Use stata-empiricist to debug this do-file and verify the DID setup matches the paper.`
- `Use matlab-solver to stabilize the calibration routine and explain why the optimizer is failing.`
- `Use python-researcher to build a script that converts regression outputs into a clean table input.`
- `Use manuscript-crafter to turn these notes into a LaTeX subsection and a Word-style memo.`
- `Use research-reviewer to review the latest theory and empirical changes before we send them out.`

Parallel examples:

- `Use theory-modeler and stata-empiricist in parallel, then reconcile where theory and identification do not line up.`
- `Use matlab-solver and python-researcher in parallel to compare the numerical outputs and plotting pipeline.`
- `Use manuscript-crafter and research-reviewer in parallel, then keep only claims supported by the code and model.`

Notes:

- This setup is project-scoped, so it only affects `D:\working_paper\DANNI`.
- Global agent fan-out is limited by `.codex/config.toml`.
- The reviewer agent is read-only by design; use another agent to implement fixes after review.
