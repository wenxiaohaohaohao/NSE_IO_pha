# Inactive Financing Extension Scope

Historical source: `paper/model_rebuild/spec/source/MAH_financing_friction_codex_notes.md`  
Current controlling source: `paper/model_rebuild/spec/source/MAH_recenter_financing_extension_codex_notes.md`

As of 2026-09-04, financing is not part of the active baseline. The baseline
developer type is \(\theta_i=(a_i,k_i)\), and the baseline mechanism is the
choice among commercialization organizations after MAH makes retained
entrusted production legally available.

This directory preserves the financing logic as an explicitly inactive
appendix extension. It may augment the type by predetermined financing
capacity \(\ell_i\) and impose liquidity thresholds \(J_I(m,k_i)\) and
\(J_E(m)\) on retained routes. It adds no financing choice, credit-supply
shift, capital market, or direct constraint on baseline advancement \(x_i\).

The direct policy arrow remains \(M\to\tau_E(M)\). In particular,
\(M\nrightarrow\ell_i,J_I,J_E,a_i,k_i,F,s\). No active baseline file imports
the finance-adjusted route values.
