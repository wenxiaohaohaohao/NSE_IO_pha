# Phase 1 Artifact Hashes

Status: `APPROVED`

| Artifact | SHA256 |
|---|---|
| `paper/model_rebuild/01_primitives_and_timing.tex` | `9DC49596B72F379706F286B230317C6CC6452535F2AB6D3DD835E72A7297CB34` |
| `paper/model_notes/01_symbols_and_objects.md` | `8370AA3CDC7DD79D6C87734302BBE0CE61F1B6039BC21BC356FDC0B622F23B2D` |
| `paper/model_notes/02_equation_dependency_map.md` | `E085E575ACD15F90A0A478F3076E5DAF0E3F9023F0B2749CB5E1122C42AB341F` |
| `paper/model_notes/03_assumptions_and_scope.md` | `8BC2F7AEF4330FBCCF66C2EE4680BC4D74081A1A73081EFE8B657065315116E0` |
| `paper/model_rebuild/audit/phase01_gate_report.md` | `F3EFA4D64058DA007B154291C338AC55510385C0426295117D0E791CC5B4B544` |
| `paper/model_rebuild/audit/phase01_compile_console.txt` | `BD99BA1E73348449D560C20E6AA141E2561D5B35D4D00A96BB5F444C7F42F28C` |
| `paper/model_rebuild/audit/phase01_compile_wrapper.tex` | `0AFCA875F5CD21DE3556FC3CB73143871CEBC9201CCE7854788E82103FDCAE23` |
| `paper/model_rebuild/scripts/compile_phase01.ps1` | `03B10144073DAC543764D2A21A9D95DEDB66EFA4212F765A4EA912B36BA3E725` |
| `paper/model_rebuild/spec/instruction_traceability_matrix.csv` | `3C3715806A83CE355E56C928E606BF7515FC6BFF59F785D69D3C59A3B64D520B` |
| local build PDF | `34930DA0245008F0BDBDE8ACDC4EE1723E879FF477A624E2B67EC81028061E28` |
| local MiKTeX log | `7848959399B26DDE22D6112CF852B3F67F57B5D005FE4D1FDEC3DAF24030B0F4` |

The PDF and MiKTeX `.log` are project-local build evidence and are ignored by Git. The wrapper and console evidence are tracked. The three model-note hashes changed only because their phase-status headers were updated from `READY FOR APPROVAL` to `APPROVED`; their substantive content was not changed. The matrix hash reflects the corresponding approved gate state. Any other formal artifact edit requires regeneration of this file and a new Phase 1 audit.
