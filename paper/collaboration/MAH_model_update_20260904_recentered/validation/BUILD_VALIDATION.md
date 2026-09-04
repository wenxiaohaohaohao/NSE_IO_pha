# Package Build Validation

Date: 2026-09-04
Result: PASS

The package was compiled from `source/` using its own manuscript files,
model modules, BibTeX database, `aer.bst`, and PowerShell build scripts.

| Target | Pages | Final-log blocking warnings | Extracted-text SHA256 |
|---|---:|---:|---|
| Main manuscript | 14 | 0 | `F21A5D76D3BCFD5CC3019D9CD2C13D0030F78B81E5218FF95F5EB49C6F11441C` |
| Technical appendix | 35 | 0 | `C76297E8C0FD8BAA3FF339E5A8E6C070151B481962CD480F3C29604ADDE6FBA6` |

For both targets, the independently built PDF and the corresponding file in
`formal/` have the same page count, extractable-text length, and extracted-text
SHA256. Binary PDF hashes differ because MiKTeX writes compilation time and
path-dependent metadata; this is expected and does not indicate a content
difference.

The final LaTeX logs contain no undefined citation/reference, duplicate-label,
rerun, overfull/underfull box, fatal, or emergency-stop warning. Generated
build/output directories were removed after validation; the generated `.bbl`
files are retained in `source/manuscript/` for convenience.
