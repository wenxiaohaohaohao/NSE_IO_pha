# Phase 18 Diff Summary

Date: 2026-09-01  
Phase entry: aae9b14fdbdd7da94dfd6ea3c88d5e1da815cb2d

## Final manuscript-source diff

Relative to the locked pre-rebuild manuscript at cd5b6e4, exactly three files
under paper/manuscript/ changed:

| File | Insertions | Deletions | Purpose |
|---|---:|---:|---|
| mah_route_indicator_friction_model.tex | 440 | 269 | replace the old model and all directly dependent reader-facing language |
| mah_route_indicator_friction_model_appendix.tex | 83 | 1,511 | replace the legacy appendix with the approved modular derivation container and evidence boundary |
| mah_route_indicator_friction_refs.bib | 11 | 0 | add the frozen Gu2024 reference |

The active main manuscript has 564 source lines. The active appendix wrapper
has 140 source lines and compiles the derivation modules in a fixed order.

## Directly compiled module edits

Independent review found that several derivation modules still contained
internal project-process prose or comments. Phase 18 changed only those
descriptions and removed the redundant local technology crosswalk table. The
affected files are:

- 01_primitives_and_timing.tex
- 02_demand_profit_derivation.tex
- 03_internal_external_technologies.tex
- 04_route_values_and_sorting.tex
- 05_rd_problem.tex
- 06_cmo_supply_demand_equilibrium.tex
- 07_equilibrium_definition.tex
- 08_required_propositions.tex
- 08_comparative_statics.tex
- 09_observed_outcomes.tex
- 11_extensions_not_baseline.tex

These edits do not alter the locked architecture. They remove reader-visible
Phase N, approval, manuscript-candidate, deliverable, internal file-path,
audit/quarantine, and local-crosswalk language, plus Phase-only source
comments. The Phase 12 exhaustive crosswalk and all earlier commits retain the
complete audit trail.

## Content removed from the active manuscript

- continuous implementation parameter eta;
- logit route choice and route probabilities;
- inclusive value Gamma;
- old reduced-form return and route-specific realization objects;
- old entry, aggregate-response, calibration-log-odds, and dynamic blocks;
- any direct MAH shift in research capability, project quality, demand,
  downstream success, patenting, supply technology, or the CMO price;
- any original-versus-incremental response ranking.

## Content added or retained

- binary M -> tau_E(M) institutional channel;
- distinct internal and entrusted technologies with one-time cost accounting;
- deterministic I/E/T/A route choice and conditional sorting;
- common project-advancement control x_i;
- expected optimized project value Omega_i;
- endogenous qualified-capacity price and one scalar fixed point;
- exact four-object partial equilibrium;
- six propositions and one novelty corollary;
- fixed-price versus equilibrium-price comparative statics;
- planning, route, holder--producer observation, and realization timing;
- restrained empirical interfaces and the verified Shi Gu boundary;
- explicit extension separation.

## Protected content

The technical memo is unchanged. No unrelated institutional or literature
section was removed. The two final PDFs are the only changed files under
paper/output/. The original checkout's modified collaborator ZIP is not
present in this worktree, the diff, or the commit scope.

## Backup and reversibility

The pre-integration versions of the four manuscript sources and two PDFs were
copied before editing. backups/phase18_preintegration/BACKUP_MANIFEST.md
records matching source/backup SHA256 values for all six files.
