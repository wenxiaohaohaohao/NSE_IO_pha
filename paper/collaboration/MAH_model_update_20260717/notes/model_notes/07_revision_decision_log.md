# 07 Revision Decision Log

This log records current model decisions. Reopen a decision only if the main text and appendix are deliberately revised together.

| Decision | Current resolution | Reason |
|---|---|---|
| Baseline equilibrium scope | Partial equilibrium; close only qualified CMO support | This is the only market directly required by the MAH route mechanism |
| Policy variables | \(M\) is binary route availability; \(\eta\) is continuous implementation intensity | Prevents invalid derivatives of a route-set indicator |
| Route-planning arrival | \(a_i x_i\) ends at route planning and manufacturing preparation | Downstream clinical, regulatory, and implementation success belongs in \(\zeta_i^r\) |
| Entrusted eligibility | \(q_i^E\) denotes technical and regulatory eligibility only | A secured producer match is not assumed |
| Retained realization | Keep \(\zeta_i^r=s_i\chi_i^r\) | Separates common downstream success from route-specific implementation without claiming separate identification |
| Entrusted-route burden | Keep \(\mu_i^E\) after MAH | Holder responsibility, monitoring, quality control, and coordination do not disappear |
| Support demand | Use \(D_m^B+\int a_i x_i^*P_i(E)dH_i\) | Support is reserved at route planning; final realization does not enter demand |
| Pre-MAH support market | Keep background demand \(D_m^B\) | Makes the pre-MAH equilibrium support cost economically meaningful |
| CMO closure | Impose continuity, boundary crossing, and strictly decreasing excess demand | Delivers a unique \(p_m^*(M,\eta)\) |
| Price feedback | Use the implicit-function theorem for \(dp_m^*/d\eta\) | Separates direct implementation gains from support-cost attenuation |
| Route choice | Logit throughout; deterministic sorting only as \(\sigma_r\to0\) | Keeps theory and calibration consistent |
| Bellman transition | Write \(\mathbb E_t[n_{i,t+1}]\) | The compact transition is a conditional expectation, not a realized identity |
| Discounting | Maintain \(\beta\in(0,1)\) | Required for the dynamic problem and contraction argument |
| Observed holder--producer share | Use the aggregate realized-weighted ratio | Heterogeneity, effort, route choice, and realization all affect the observed share |
| Log odds | Restrict to homogeneous or sufficiently narrow two-route \(I\)-\(E\) cells and include relative realization | Aggregate log odds are not a representative-firm payoff gap |
| Pre-period zero entrusted share | Treat as route-set expansion; pseudo-count only for sensitivity | A structurally unavailable route does not provide comparable pre-period log odds |
| Approval-side counts | Interpret as realized outcomes | They jointly discipline arrival, route choice, realization, and observation |
| Entry | Future or sensitivity module without a credible firm-year research-entry panel | Approval records alone do not identify an entry-cost distribution |
| Jia et al. | Approval-delay/review-capacity alternative | Not the MAH commercialization-route mechanism |
| Barwick et al. | Demand/market-size alternative | Not the MAH commercialization-route mechanism |
| Welfare | Do not claim a welfare theorem | The model establishes private-value and realized-output comparative statics |

## Editing rule

Any future change to one of these decisions must first update the main text and technical appendix. Then synchronize the numbered control notes and rebuild the combined control note. Do not hand-edit the combined file.
