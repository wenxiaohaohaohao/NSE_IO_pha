# 05 Finance Extension Isolation

Status: complete

The preserved formal module is
`paper/model_rebuild/15_financing_commercialization_extension.tex`. It is
explicitly labeled “Not part of the baseline” and is imported only in the
appendix/full-derivation containers, after the baseline extension quarantine.

Inside that module only, developer type may be augmented by $\ell_i$ and
retained routes may face liquidity thresholds $J_I,J_E$. The thresholds are
not real costs and are never subtracted from route values. The local condition
$J_E<J_I$ may define an extension-only financing corridor.

Nesting is exact when $\ell_i\ge\max\{J_I,J_E\}$ for all relevant pairs:
$\widetilde W_i^I=W_i^I$ and $\widetilde W_i^E=W_i^E$. The module does not
alter baseline advancement, CMO demand, or market clearing.
