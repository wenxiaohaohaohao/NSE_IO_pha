# Empirical Roadmap for the MAH GE Paper

## 1. Empirical strategy in one sentence

Before estimating the upgraded model, document that MAH changed:

1. who enters
2. who survives
3. who changes organizational form
4. how innovation is reallocated across firm types

The first-stage empirical goal is to show **reorganization**, not only more innovation.

Equally important, keep the identification boundary clear:

- directly identified from current innovation data: whether MAH raises innovation
- indirectly inferred mechanism: whether MAH likely works through lower
  commercialization friction and higher expected implementation value
- mechanism becomes more convincing once reorganization, commercialization, and
  entry-financing evidence are added

## 2. Core facts to document

### Fact 1. Transition matrices by firm type

Construct transition matrices using the current four-way empirical classification:

- `rd`
- `prod`
- `mix`
- `transition`

Minimum output:

- one pre-policy matrix
- one post-policy matrix

Recommended windows:

- pre-policy: `2011-2015`
- post-policy: `2016-2023`

Operational note for `t -> t+1` transitions:

- if you require both origin and destination years to stay inside the same window,
  use origin years `2011-2014` for the pre matrix
- use origin years `2016-2022` for the post matrix unless 2024 data exist

Recommended extension after the first pass:

- pilot phase: `2016-2019`
- national implementation phase: `2020-2023`

What to highlight:

- `mix -> rd`
- `mix -> prod`
- `prod -> mix`
- `rd -> mix`
- exit by type
- entry composition by type

### Fact 2. Innovation reallocation across firm types

For each year, report:

- innovation applications by firm type
- approved innovation by firm type
- share of original / higher-quality innovation by firm type

Key question:

- Is the rise in innovation driven by more `rd` firms, stronger innovation within `rd` firms, or both?

### Fact 3. Production-side business response

If good accounting data exist, test whether production-type firms gain from the new outsourcing margin.

Candidate outcomes:

- operating revenue growth
- gross margin
- operating margin
- selling expense ratio
- manufacturing service income if separately disclosed

If clean accounting splits are not available, use annual-report text evidence:

- "entrusted manufacturing"
- "commissioned production"
- "contract manufacturing"
- "CMO"
- "CDMO"
- "MAH"
- "marketing authorization holder"
- "license holder"

This evidence does not need to be perfect in the first draft.
It only needs to support the claim that production specialization became economically meaningful.

### Fact 4. Entry and financing response of innovative firms

If MAH raises the expected commercialization value of innovative projects, this
should not only affect incumbent behavior but also the willingness of new
R&D-oriented firms to enter and the willingness of capital providers to support them.

Candidate evidence:

- count of new R&D-type entrants
- count of newly registered biotech / R&D labs
- VC / PE investment events in innovative pharmaceutical firms
- pre-IPO financing activity
- IPOs by innovative pharma / biotech firms
- financing rounds or fundraising announcements of listed and unlisted firms

This margin is especially valuable because it connects:

- commercialization expectations
- organizational form
- entry of innovative firms
When running the actual text search, add the standard Chinese annual-report
equivalents used by listed pharmaceutical firms.

## 3. Data structure you need

At the minimum, prepare a firm-year panel with:

- `firm_id`
- `year`
- `type4`
- innovation measures
- size controls
- ownership
- region
- listed indicator if available
- financing event indicators if available
- startup / new registration indicator if available

Recommended type coding:

- `1 = rd`
- `2 = prod`
- `3 = mix`
- `4 = transition`

Additional variables that would help:

- first observed year
- last observed year
- province
- whether the firm is in an MAH pilot province
- R&D spending
- technical staff share
- production staff share
- operating revenue
- gross profit margin
- operating profit margin
- VC / PE funding amount or funding-event count
- IPO year or listing year

## 4. How to define transitions

### Baseline transition rule

For firm `i`, define transition from year `t` type to year `t+1` type.

### Exit rule

If a firm appears in year `t` and is absent in `t+1` while the panel continues, code:

- `type_t -> exit`

### Entry rule

If a firm appears for the first time in year `t`, classify its first observed type as:

- `entry -> rd`
- `entry -> prod`
- `entry -> mix`
- `entry -> transition`

Important:

- **Do not mix entry composition with incumbent switching.**
- Report them separately even if you place them on the same summary page.

## 5. Recommended transition outputs

### Output A. Counts

For each window, report the count matrix:

- rows = origin type
- columns = destination type plus exit

Important:

- keep origin and destination years within the same policy regime
- do not let `2015 -> 2016` contaminate the pre-policy matrix

### Output B. Row shares

For each origin type, normalize the row to sum to one.

This is the most interpretable table for the draft.

### Output C. Entry shares

For each window, report the distribution of new entrants across:

- `rd`
- `prod`
- `mix`
- `transition`

### Output D. Entry-financing facts

If financing data exist, report by window:

- number of financed R&D-type entrants
- average funding amount for innovative entrants
- share of innovative entrants among all newly funded pharma firms

## 6. Event-study and reduced-form specifications

### 6.1 Firm-type transition event study

If you can link firms to pilot and non-pilot regions, estimate:

```text
Y_it = sum_k beta_k * 1[t - T0 = k] * Pilot_i + alpha_i + gamma_t + X_it' delta + eps_it
```

Candidate outcomes:

- indicator for becoming `rd`
- indicator for becoming `mix`
- indicator for exit
- indicator for first observed entry as `rd`

Purpose:

- verify that state changes accelerate after MAH

### 6.2 Innovation by type

Estimate heterogeneous effects:

```text
Innovation_it = beta1 * Post_t * Pilot_i
              + beta2 * Post_t * Pilot_i * RD_i_pre
              + beta3 * Post_t * Pilot_i * Prod_i_pre
              + alpha_i + gamma_t + X_it' delta + eps_it
```

Purpose:

- see whether MAH mainly raises innovation through `rd` firms, through switching, or through integrated incumbents

### 6.3 Production-side business response

For listed firms or firms with better financials:

```text
Margin_it = beta * Post_t * Exposure_i + alpha_i + gamma_t + X_it' delta + eps_it
```

Possible exposure measures:

- pre-policy production specialization
- being located in a pilot province
- being a likely outsourced-production provider

Purpose:

- discipline the GE claim that incumbent producer profits may move differently from total innovation

### 6.4 Entry and financing response

If financing data can be linked to firms, estimate:

```text
EntryOrFunding_it = beta * Post_t * Exposure_i + alpha_i + gamma_t + X_it' delta + eps_it
```

Possible outcomes:

- indicator for new R&D-type entry
- funding-event count
- log funding amount
- indicator for IPO / listing / major capital raise

Purpose:

- test whether MAH improved the ex ante attractiveness of innovative projects
- reinforce the entry margin in the model

## 7. Suggested tables and figures

### Table 1. Firm classification rules

Keep your current rules but clarify that:

- `mix` is the empirical integrated type
- `transition` is an observed short-run reorganization state, not the core long-run type in the theory

### Table 2. Pre-policy transition matrix

Use `2011-2015`.

### Table 3. Post-policy transition matrix

Use `2016-2023`.

### Table 4. Entry composition by firm type

Split into pre and post.

### Figure 1. Type shares over time

Plot:

- share of `rd`
- share of `prod`
- share of `mix`
- share of `transition`

### Figure 2. Innovation contribution by type

Plot:

- innovation count by type
- innovation share by type

### Figure 3. Key transition hazards over time

Plot:

- `mix -> rd`
- `mix -> prod`
- `prod -> mix`
- exit from `prod`

### Figure 4. Entry and financing of innovative firms

Plot, if data permit:

- count of new R&D-type entrants
- financing events for innovative pharma firms
- average funding amount or number of funded entrants

## 8. Acceptance criteria before writing the full model

Do not lock the formal model until you know whether the data show:

1. more `rd` entry after MAH
2. faster organizational transitions after MAH
3. innovation increasingly concentrated in `rd` or reorganizing firms
4. nontrivial producer-side response
5. plausible entry or financing response of innovative firms

If these are absent, revise the mechanism before adding more structure.

## 9. Scope discipline

Keep the empirical scope tight:

- endogenize `R&D-production`
- treat sales / distribution as background
- do not add patent transfer structure in version 1 unless the data clearly force you to

This is crucial for keeping the paper feasible.

## 10. Immediate to-do list

1. Build the firm-year transition panel.
2. Produce the two transition matrices.
3. Split entry from incumbent switching.
4. Produce one figure of type shares over time.
5. Produce one figure of innovation contribution by type.
6. Search listed-company annual reports using the contract-manufacturing keywords.
7. Search for VC / PE / IPO / new-lab or new-biotech entry data.
8. Only then finalize the model equations.
