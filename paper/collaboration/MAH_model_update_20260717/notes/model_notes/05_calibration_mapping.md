# 05 Calibration Mapping

## Calibration principle

The baseline is a mechanism calibration. Match feasible realized-outcome moments to composite model objects, state normalizations, and report what the data cannot identify. Do not relabel approval-side records as planning-stage projects.

## 1. Holder--producer split

For a comparable sample of realized retained original-drug products, the model counterpart is

\[
s_E^{obs}(M,\eta)
=
\frac{
\int a_i x_i^*(M,\eta)
P_i(E\mid M,\eta,p_m^*)\zeta_i^E(\eta,p_m^*)\,dH_i
}{
\int a_i x_i^*(M,\eta)
\sum_{r\in\mathcal R_i^{ret}(M)}
P_i(r\mid M,\eta,p_m^*)\zeta_i^r(\eta,p_m^*)\,dH_i
}.
\]

This is an aggregate realized-weighted ratio. It jointly reflects R&D selection, route choice, realization, and heterogeneity. It is not a route probability and not the product of representative values.

### Narrow-cell log odds

For a homogeneous firm or sufficiently narrow cell with exactly retained routes \(I\) and \(E\),

\[
s_{iE}^{obs}
=\frac{P_i(E)\zeta_i^E}
{P_i(E)\zeta_i^E+P_i(I)\zeta_i^I},
\]

so

\[
\log\frac{s_{iE}^{obs}}{1-s_{iE}^{obs}}
=\frac{G_i^E-G_i^I}{\sigma_r}
+\log\frac{\zeta_i^E}{\zeta_i^I}.
\]

Because \(\zeta_i^r=s_i\chi_i^r\), common success cancels only inside this individual or narrow-cell ratio. It does not generally cancel before aggregation.

If route \(E\) is unavailable before MAH, a zero pre-period share does not provide a comparable structural log-odds moment. Prefer the finite route-set interpretation and, where credible, post-MAH exposure or implementation-intensity variation. A pseudo-count is sensitivity only.

## 2. Original-drug counts

Route-planning arrival is

\[
\lambda_i^{plan,*}=a_i x_i^*
=\frac{\beta a_i^2}{\kappa}
\Gamma_i(M,\eta,p_m^*(M,\eta)).
\]

A data-specific realized count is

\[
\lambda_i^{obs,d,*}
=a_i x_i^*
\sum_r P_i(r)\zeta_i^r\omega_i^{r,d}.
\]

Approval or launch counts therefore discipline a composite of \(\beta a_i^2/\kappa\), \(\Gamma_i\), route choice, realization, and the observation definition. They do not identify planning-stage arrivals alone.

## 3. Qualified CMO support market

The closure is

\[
D_m^B(p_m)
+\int a_i x_i^*(M,\eta,p_m)
P_i(E\mid M,\eta,p_m)\,dH_i
=S_m(p_m).
\]

Useful data or sensitivity inputs include:

- producer capacity and qualified-producer participation by support-market cell;
- CMO fee schedules or effective support-cost proxies;
- dosage-form, region, or technology-segment scarcity;
- non-MAH background demand proxies.

These moments discipline supply, background demand, or sensitivity values for \(p_m^*(M,\eta)\). They do not convert the support cost into a product-market price. Do not add \(\zeta_i^E\) to planning-stage support demand.

## 4. Demand and approval alternatives

Demand-side variables such as patient population, disease burden, reimbursement, procurement exposure, or therapeutic composition may discipline or control the market-return background. They are not the MAH treatment.

- Jia et al. discipline an approval-delay/review-capacity alternative.
- Barwick et al. discipline a demand/market-size alternative.
- The MAH calibration targets route availability, route friction and implementation, relative route realization, and qualified-support scarcity.

## 5. Entry

An entry-cost distribution can be disciplined only with a credible firm-year measure of research-oriented entry, such as first application, trial sponsorship, or holder activity with a defensible timing rule. With approval-side product records alone, entry remains a future or sensitivity module.

## 6. Baseline parameterization

Target composite objects such as:

| Composite | Main empirical discipline | Required warning |
|---|---|---|
| Relative entrusted route-realization wedge | Realized holder--producer split | Does not separately identify policy friction, holder burden, support cost, returns, or realization |
| Project-arrival scale \(\beta a^2/\kappa\) | Baseline realized original-drug counts plus normalizations | Realized counts are downstream of route choice and realization |
| CMO supply or scarcity | Capacity, participation, fee proxies, or sensitivity values | Only the qualified-support market is endogenous |
| Entry-cost distribution | Credible firm-year research-entry panel | Exclude from baseline when such data are absent |

At least one scale object must be normalized, such as \(\kappa\), a benchmark \(\Gamma\), \(\sigma_r\), or a sensitivity value for the support cost.

## 7. Permitted calibration claim

The baseline may show that selected realized moments are quantitatively consistent with the MAH commercialization-route mechanism under transparent normalizations. It may not claim separate identification of every primitive friction, scientific success, matching probability, legal cost, CMO cost component, or welfare effect.
