# Collaborator Package Build Validation

Date: 2026-09-03
Package: `MAH_model_update_20260903_financing`
Model commit: `059ffb825ec13fd9e650c025d630311c566baae8`

## Result

`PACKAGE_BUILD_VALIDATION=PASS`

## Source integrity

- Compared 18 current project source files with their package copies.
- Source mismatches: 0.
- The package does not include or import the superseded
  research--development/patent module.
- The title in the packaged main TeX is
  `Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform`.

## Independent package compilation

Both documents were compiled from `source/` using the package's own PowerShell
scripts and MiKTeX. Each log contains zero fatal errors, undefined citations,
undefined references, duplicate labels, overfull boxes, or underfull boxes.

| Document | Formal pages | Rebuilt pages | Formal bytes | Rebuilt bytes | Result |
|---|---:|---:|---:|---:|---|
| Main manuscript | 14 | 14 | 398,113 | 398,113 | PASS |
| Technical appendix | 35 | 35 | 488,987 | 488,987 | PASS |

Formal PDF hashes:

- Main: `3A1DBB1A669EDF3E0CD755CE36BDA79621E3ACC3AB7B409A92D375562B11D35F`
- Appendix: `453A14D4791E806BEE53567596F75C49792E2A7C6B9BC4DDA6021726DE8ED3DF`

Independent rebuild hashes:

- Main: `4CC703976D6D4EDBDF8FC0B0F902D8BCAFCA849A15F7CC89676566509E046E10`
- Appendix: `ECB1D17B40725D9EA827D9026DA89FFFF8DE80187E6FB68A2FD6BD04970BFDE9`

The rebuild hashes differ because PDF metadata records build path/time. Page
counts, byte sizes, source hashes, LaTeX references and rendered content are
the validation criteria.

## Model acceptance checks represented in the package

- one common advancement control $x_i$;
- predetermined financing capacity $\ell_i$;
- $J_I,J_E$ used as financeability thresholds, never extra costs;
- financing-corridor proposition and no-binding-finance nesting;
- one scalar CMO market with unchanged supply technology;
- exactly four formal propositions in the main manuscript;
- no active patent-production or research--development allocation block.
