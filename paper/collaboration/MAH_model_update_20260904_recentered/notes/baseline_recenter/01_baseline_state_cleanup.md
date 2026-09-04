# 01 Baseline State Cleanup

Status: complete

The baseline state was restored from $(a_i,k_i,\ell_i)$ to $(a_i,k_i)$ in the
main manuscript, model modules, symbols ledger, assumptions ledger, dependency
map, and CMO integrals. Baseline timing no longer contains a financeability
screen.

The following objects are absent from baseline definitions, propositions, and
equilibrium equations:

- financing capacity $\ell_i$;
- liquidity requirements $J_I$ and $J_E$;
- finance-adjusted values $\widetilde W_i^I,\widetilde W_i^E$;
- the financing corridor.

Ordinary route values $W_i^I,W_i^E,W^T,W^A$ and the ordinary deterministic
maximum are again the active objects. Extension-only notation is registered
separately and is never used as a parent of a baseline equation.
