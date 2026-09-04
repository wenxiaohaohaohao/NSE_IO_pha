# MAH Model Rebuild Specification Provenance Manifest

## Frozen sources

| Source | Original path | Frozen copy | Bytes | Original modified time | SHA256 | Verification |
|---|---|---|---:|---|---|---|
| Base execution note | `D:\AppGallery\xwechat_files\qazwsxedc1058063080_0549\msg\file\2026-08\MAH_model_rebuild_execution_note_for_Codex.md` | `source/MAH_model_rebuild_execution_note_for_Codex.md` | 38,122 | 2026-08-17T22:36:38.6661889+08:00 | `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24` | Exact-copy hash PASS |
| Amendment v1.1 | `D:\AppGallery\xwechat_files\qazwsxedc1058063080_0549\msg\file\2026-08\MAH_model_rebuild_amendment_v1.1_for_Codex.md` | `source/MAH_model_rebuild_amendment_v1.1_for_Codex.md` | 22,008 | 2026-08-17T23:39:25.8503073+08:00 | `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9` | Exact-copy hash PASS |
| Correction v1.2 image | `C:\Users\dongw\AppData\Local\Temp\codex-clipboard-044a96a3-1bd4-4cb9-a2ba-b7ed2db8dde3.png` | `source/MAH_model_rebuild_correction_v1.2.png` | 53,675 | 2026-08-30T12:00:08.2371565+08:00 | `1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5` | Exact-copy hash PASS |
| Post-Phase-18 financing revision note | `D:\所有下载内容\MAH_financing_friction_codex_notes.md` | `source/MAH_financing_friction_codex_notes.md` | 29,870 | 2026-09-03 | `C139AE0B795A26851573438891F3CA30AABF46832B3CF97B22FF19138C4B61F9` | Exact-copy hash PASS; supplemental active instruction |
| Post-Phase-18 recentering note | `D:\所有下载内容\MAH_recenter_financing_extension_codex_notes.md` | `source/MAH_recenter_financing_extension_codex_notes.md` | 30,161 | 2026-09-04T01:18:52.0417937+08:00 | `78FE720E4BEEE624FFF3DDF0E1D51CD7FE773178BBE4740E7951B39DDDD0E45E` | Exact-copy hash PASS; latest controlling supplemental instruction |

The v1.2 image is 945 by 441 pixels. Its transcription is stored at `source/MAH_model_rebuild_correction_v1.2_transcription.md`, SHA256 `06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E`.

## Derived artifacts

| Artifact | Construction rule | SHA256 |
|---|---|---|
| `MAH_model_rebuild_effective_spec_v1.2.md` | Frozen base plus unique-anchor application of v1.1 A-W, followed by only the v1.2 interpretation correction and approved errata | `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666` |
| `instruction_traceability_matrix.csv` | Deterministic generation of RL, amendment, phase, QA and success IDs; specification-level approval recorded | `3F0671ED447CB2AF07EB3DED62730A0EF7E15437A9107539B7554E644F18A98F` |

## Authority and immutability

- Files under `spec/source/` are frozen evidence and must not be edited.
- The two post-Phase-18 notes are preserved as successive supplemental
  instructions. The 2026-09-04 recentering note has higher priority and
  supersedes financing as an active baseline mechanism; it does not rewrite
  the approved v1.2 source or historical Phase 1--18 gate records.
- The effective specification is reproducible with `scripts/apply_spec_amendments.py`.
- The traceability matrix is reproducible with `scripts/build_traceability_matrix.py`; its current deterministic state records the approved specification checkpoint.
- A changed frozen-source hash is a P0 failure. A changed derived hash is permitted only after an approved specification amendment and regenerated evidence.
