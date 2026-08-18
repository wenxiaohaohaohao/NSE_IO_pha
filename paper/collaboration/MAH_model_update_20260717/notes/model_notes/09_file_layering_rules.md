# File Layering Rules for the MAH Model

## Purpose

The complete model should be supported by three different layers:

| Layer | Location | Role |
|---|---|---|
| Main text | `paper/manuscript/mah_route_indicator_friction_model.tex` | Short reader-facing model statement and paper argument. |
| Technical appendix | `paper/manuscript/mah_route_indicator_friction_model_appendix.tex` | Formal derivations, object-status audit, proof details, CMO closure, and calibration boundaries. |
| Model notes | `research_notes/model_notes/` | Model-design control panel for Codex and the author. |

The main text should not carry the full construction history. The appendix should not carry internal work notes. The model notes should not be treated as polished manuscript prose.

## Promotion Rule

New model ideas should move through the layers in this order:

1. First enter `research_notes/model_notes/`.
2. If the idea passes closure, payoff-accounting, and claim-boundary checks, it can enter the technical appendix.
3. Only the minimal version needed for the paper's central claim should enter the main text.

## What Belongs in Each Layer

### Main text

Keep:

- core institutional mechanism;
- route set;
- entrusted-route payoff;
- logit route choice;
- CMO market closure;
- R&D choice;
- observed realization equation;
- key comparative statics;
- minimum empirical interpretation.

Exclude:

- long equation audits;
- alternative derivations;
- missing-data workarounds;
- detailed calibration recipes;
- future entry modules unless they directly support a current claim.

### Technical appendix

Keep:

- object-status table;
- CES background for the market-return object;
- post-production risk interpretation;
- CMO market regularity conditions;
- Bellman payoff accounting;
- closed-form derivation;
- comparative-static derivations;
- route-share and count-moment mapping;
- entry module as future or sensitivity.

Exclude:

- informal revision history;
- notes to Codex;
- suggested text fragments;
- unresolved brainstorms.

### Model notes

Keep:

- model closure decisions;
- symbol dictionary;
- equation dependency map;
- assumptions and scope limits;
- calibration mapping;
- disputed-review decision log;
- future modifications before they are promoted.

Exclude:

- final manuscript prose unless it is clearly marked as draft text;
- duplicated appendix sections unless needed for audit.

## Current Working Principle

The short main-text file is necessary but not sufficient. The complete model is supported by:

\[
\text{main text} + \text{technical appendix} + \text{model notes}.
\]

This separation preserves model completeness without making the main paper read like a construction memo.
