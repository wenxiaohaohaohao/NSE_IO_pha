---
name: "danni-research-instructions"
description: "DANNI economics research project workspace - provides context for all agents"
applyTo: "**"
---

# DANNI Economics Research Project

## Workspace Overview

This is the `D:\working_paper\DANNI` workspace containing:
- **literatures/**: Background papers, slides, and reference materials
- **research_notes/**: Model notes, empirical notes, drafts, Stata code, and LaTeX fragments
- **models/**: Specialized model documentation and notes

## Project Domain

You are assisting with research on economics topics involving:
- Growth models with heterogeneous agents (MAH, NSE frameworks)
- Empirical identification and policy transitions
- Comparative analysis with Fréchet Return Specification (FRS) and Hopenhayn models
- India-US-China context (indicated by prefix "mah", "nse", "toyangchendanni")

## Working Principles

1. **Consistency across layers**: Keep theory, empirics (Stata code), computation (MATLAB), and writing synchronized
2. **Reproducibility**: All analyses must be traceable from code to output to write-up
3. **Identification first**: Empirical work must anchor to clear identification strategy
4. **Parsimony in theory**: Elegant models are good, but implementable simplicity is better
5. **Notation discipline**: Use consistent notation across LaTeX fragments, do-files, and MATLAB routines

## Workflow Integration

Work typically flows:
1. **theory-modeler** → define and refine the theoretical framework
2. **stata-empiricist** + **matlab-solver** → empirical identification and calibration (can run in parallel)
3. **python-researcher** → data preparation, validation, plotting, format conversion
4. **manuscript-crafter** → integrate results into paper sections and presentations
5. **research-reviewer** → final check before sharing

You have access to six specialized agents:
- **theory-modeler**: Model logic, derivations, proofs
- **stata-empiricist**: DiD, panel estimators, empirical troubleshooting
- **matlab-solver**: Calibration, numerical stability, optimization
- **python-researcher**: Data prep, simulation, plotting, utilities
- **manuscript-crafter**: Writing, LaTeX, tables, presentations
- **research-reviewer**: Review for bugs, risks, and overclaims

## Recommended Usage Patterns

### Single-agent tasks
- "Check the equilibrium characterization in my dynamic problem" → theory-modeler
- "Debug this DID regression and verify sample alignment" → stata-empiricist
- "Why does my MATLAB optimizer keep hitting the bound?" → matlab-solver
- "Create a Python script to compute welfare changes from transition matrices" → python-researcher
- "Polish this model section for the paper" → manuscript-crafter
- "Review the theory and code before I submit" → research-reviewer

### Two-agent workflows
- "theory-modeler: Is the model consistent? stata-empiricist: Does the do-file match the identification?" → then reconcile
- "matlab-solver: Can you solve the model at the calibrated parameters? python-researcher: Can you plot the results?" → coordinate outputs

### Full pipeline
- "Work through the model logic, data strategy, calibration, and write up a results section" → series of agents

## Key Files to Reference

When asked about existing work:
- Check `research_notes/README.md` for documentation of current phases
- Review `research_notes/mah_ge_formal_model_draft_zh.md` for latest theory framing
- Look in `research_notes/models/` for detailed model specifications
- Check `literatures/` for citation context and related papers

---

**Language**: You may receive requests in Chinese (Simplified) or English. Respond in the same language as the request.
