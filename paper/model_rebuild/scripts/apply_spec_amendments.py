from __future__ import annotations

import hashlib
from pathlib import Path


MODEL_REBUILD = Path(__file__).resolve().parents[1]
SPEC = MODEL_REBUILD / "spec"
SOURCE = SPEC / "source"
BASE = SOURCE / "MAH_model_rebuild_execution_note_for_Codex.md"
AMENDMENT = SOURCE / "MAH_model_rebuild_amendment_v1.1_for_Codex.md"
CORRECTION = SOURCE / "MAH_model_rebuild_correction_v1.2_transcription.md"
OUTPUT = SPEC / "MAH_model_rebuild_effective_spec_v1.2.md"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


text = BASE.read_text(encoding="utf-8")
applied: list[str] = []


def replace_once(old: str, new: str, label: str) -> None:
    global text
    count = text.count(old)
    if count != 1:
        raise RuntimeError(f"{label}: expected exactly one anchor, found {count}")
    text = text.replace(old, new, 1)
    applied.append(label)


def insert_before(anchor: str, payload: str, label: str) -> None:
    replace_once(anchor, payload.rstrip() + "\n\n" + anchor, label)


def insert_after(anchor: str, payload: str, label: str) -> None:
    replace_once(anchor, anchor + "\n\n" + payload.rstrip(), label)


effective_header = r"""

> **Effective specification version:** v1.2  
> **Precedence:** active user instruction > correction v1.2 > amendment v1.1 > this base note > legacy manuscript/model notes.  
> **Construction rule:** this file is a surgical derivative of the frozen base note. It is not a summary and does not replace the immutable source files in `spec/source/`.  
> **Source hashes:** base `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24`; v1.1 `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9`; v1.2 image `1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5`.  
> **Phase rule:** the formal state machine has Phase 1--18. `12_full_derivation_draft.tex` is assembled in Phase 15 and must be approved before Phase 16.
"""
insert_after("# MAH Model Rebuild — Codex Execution Note", effective_header, "GOV-HEADER")


# Amendment A plus the narrower correction supplied in v1.2.
precision_block = r"""
### Effective Precision on the Innovation Object (Amendment v1.1 + Correction v1.2)

The baseline control is canonically defined as

\[
\boxed{
x_i=\text{original-drug innovation investment / project-advancement intensity}.
}
\]

The term is deliberately broader than pure clinical-development effort: it covers investment that advances viable original-drug projects toward the commercialization-relevant route-planning stage. It is not generic upstream scientific research, basic-compound discovery, patent-generating effort, or patent applications themselves. Patent history may later proxy pre-existing capability \(a_i\), but patent applications are not the baseline endogenous outcome \(x_i\).

The project-value channel remains

\[
MAH\rightarrow \Omega_i\uparrow\rightarrow x_i^*\uparrow,
\]

under the proposition's stated conditions. It does not mechanically imply

\[
Patent\ Applications\uparrow.
\]

The phrase “original-drug” identifies the paper's non-generic innovative-drug domain. It must not be confused with the empirical novelty class \(g=O\), which is distinguished from \(g=\mathrm{Inc}\) within that domain.
"""
insert_before(
    "The model is **not** a full pharmaceutical-industry GE model and must not become one.",
    precision_block,
    "AMD11-A+AMD12-01",
)

replace_once(
    r"\text{ex ante R\&D}",
    r"\text{ex ante original-drug innovation investment / project advancement}",
    "AMD11-A-MISSION-CHAIN",
)
replace_once(
    "alter commercialization assignment and ex ante original-drug R&D incentives?",
    "alter commercialization assignment and ex ante original-drug project-advancement incentives?",
    "AMD11-A-RQ",
)
replace_once(
    r"\text{R\&D}.",
    r"\text{project advancement}." ,
    "AMD11-A-MECHANISM-END",
)


# Amendment B.
shi_gu_reference = r"""
- **Shi Gu (2024), “Production Outsourcing and Innovation: Evidence from China's Pharmaceutical Industry”:**
  empirical boundary and benchmark. The verified SSRN abstract reports increased clinical development among firms without production facilities, a patent-application decline among financially constrained firms concentrated in lower-value patents, and a stronger incremental-development response. The more detailed claims listed in the Phase 16/18 empirical checkpoint remain `UNVERIFIED` until the paper PDF is checked by page and table. Shi Gu is not an additional mother model, and its research-versus-development financial-constraint model must not enter the baseline.
"""
insert_before("Do not splice these papers into a hybrid multi-model system.", shi_gu_reference, "AMD11-B")


# Amendment C.
new_red_lines = r"""
21. Do **not** describe \(x_i\) as generic R&D effort if this wording could include upstream patent-generating research.
22. Do **not** claim that MAH must increase patent applications.
23. Do **not** claim that MAH must increase upstream scientific research.
24. Do **not** impose that MAH must increase breakthrough/original innovation.
25. Do **not** introduce separate controls \(x_i^R\) and \(x_i^D\), a binding financial constraint, or a research-versus-development resource-allocation block into the baseline without explicit approval.
26. Do **not** treat Shi Gu's negative patent result as a contradiction of the commercialization mechanism; patents are outside the baseline endogenous outcome unless an explicit research extension is activated.
27. Do **not** force the model to predict that original projects respond more strongly than incremental projects.
28. Do **not** redefine the paper as a financial-constraints paper.
"""
insert_after(
    "20. Do **not** infer welfare conclusions from private-value or realized-output comparative statics.",
    new_red_lines,
    "AMD11-C",
)


# Amendment D plus the approved notation repair and common-control completion.
heterogeneity_layer = r"""
## 5.1 Empirical novelty-class decomposition (not a new baseline state)

When empirical work distinguishes original/breakthrough-oriented and incremental/improved projects, use

\[
\boxed{g\in\{O,\mathrm{Inc}\}.}
\]

The label \(\mathrm{Inc}\) is used instead of \(I\) so that project class cannot be confused with internal route \(I\). The baseline retains one common control \(x_i\); no \(x_{ig}\) control is permitted without separate approval. Let

\[
\rho_g\geq0,\qquad \sum_g\rho_g=1,
\]

be the exogenous class share and let \((q,m)\sim F_g(q,m)\) conditional on class. The aggregate project distribution and expected value decompose as

\[
F(q,m)=\sum_g\rho_gF_g(q,m),
\qquad
\Omega_i=\sum_g\rho_g\Omega_{ig},
\]

where

\[
\Omega_{ig}(M,p_m)=E_{(q,m)\sim F_g}
\left[W_i(q,m;M,p_m)\right].
\]

If required for observed outcomes, use an exogenous, MAH-invariant downstream probability \(s_g(q)\). The baseline imposes no ordering between \(\Delta\Omega_{iO}\) and \(\Delta\Omega_{i\mathrm{Inc}}\). Any ranking requires an explicit primitive restriction and proof.
"""
insert_before("# 6. Phase 1 — Object and Timing Audit", heterogeneity_layer, "AMD11-D")


# Amendment E.
old_stage_one = r"""### Stage 1: R&D

Developer \(i\) observes \((a_i,k_i)\) and chooses:

\[
x_i\geq0.
\]

Route-planning-stage projects arrive at intensity:

\[
\lambda_i^{plan}=a_ix_i.
\]"""
new_stage_one = r"""### Stage 1: Original-drug project-development / advancement investment

Developer \(i\) observes \((a_i,k_i)\) and chooses:

\[
x_i\geq0.
\]

The intensity of viable projects reaching the route-planning / commercialization-relevant development stage is

\[
\lambda_i^{plan}=a_ix_i.
\]

The control \(x_i\) is original-drug innovation investment / project-advancement intensity. It is not limited to pure clinical-development effort and is not patent applications. Upstream scientific research, patent generation, and basic-compound discovery are outside baseline timing and may have occurred before the project enters the model. This timing is deliberate because MAH changes downstream manufacturing/commercialization options rather than scientific discovery technology."""
replace_once(old_stage_one, new_stage_one, "AMD11-E")
replace_once(
    "timing of R&D versus route choice is unambiguous;",
    "timing of project-advancement investment versus route choice is unambiguous;",
    "AMD11-E-GATE",
)


# Amendments F and G.
replace_once("# 10. Phase 5 — R&D Problem", "# 10. Phase 5 — Project-Development / Advancement Problem", "AMD11-F-TITLE")
replace_once("## 10.1 R&D technology", "## 10.1 Project-advancement technology", "AMD11-F-SUBTITLE")
replace_once("R&D cost:", "Project-development / advancement cost:", "AMD11-F-COST-LABEL")
text = text.replace("C_R(x_i)", "C_X(x_i)")
applied.append("AMD11-F-CX")
replace_once("## 10.3 Ex ante R&D problem", "## 10.3 Ex ante project-advancement problem", "AMD11-F-PROBLEM")
replace_once("- R&D FOC/SOC derivation", "- project-advancement FOC/SOC derivation", "AMD11-F-DELIVERABLE") if "- R&D FOC/SOC derivation" in text else None
replace_once(
    "Therefore the R&D FOC is interpretable as:",
    "Therefore the project-advancement FOC is interpretable as:",
    "AMD11-G-FOC-LABEL",
)
replace_once(
    "- no-project continuation value: \\(B_i\\);\n- value after obtaining a route-planning-stage project: \\(K_i=B_i+\\Omega_i\\).",
    "- continuation value before an additional viable development-stage project is advanced: \\(B_i\\);\n- value after a project reaches the commercialization-relevant route-planning stage: \\(K_i=B_i+\\Omega_i\\).",
    "AMD11-G-VALUE-GAP",
) if "- no-project continuation value" in text else None
replace_once(
    "Do **not** introduce an artificial recursive Bellman with unnecessary states merely for appearance.",
    "This is an Akcigit-style downstream project-value foundation, not a claim that MAH directly raises scientific research productivity. Do **not** introduce an artificial recursive Bellman with unnecessary states merely for appearance.",
    "AMD11-G-INTERPRETATION",
)
replace_once("- R&D is ex ante;", "- project-advancement investment is ex ante;", "AMD11-F-GATE-1")
replace_once("- MAH affects R&D only through \\(\\Omega_i\\).", "- MAH affects project advancement only through \\(\\Omega_i\\).", "AMD11-F-GATE-2") if "- MAH affects R&D only" in text else None


# Amendments H and I.
replace_once(
    "## Proposition 3 — R&D response and heterogeneity",
    "## Proposition 3 — Project-advancement response and firm heterogeneity",
    "AMD11-H-TITLE",
)
prop3_boundary = r"""

The proposition concerns the intensity with which research-capable developers advance viable projects toward commercialization. It does not establish that MAH increases patent applications, basic research, scientific discovery, or breakthrough novelty.
"""
insert_after(
    r"""\text{response strongest for high-}a_i
\text{ and low/intermediate-}k_i.
}""",
    prop3_boundary,
    "AMD11-H-INTERPRETATION",
)
novelty_corollary = r"""
## Corollary — Novelty Composition Is Theoretically Ambiguous

For \(g\in\{O,\mathrm{Inc}\}\), define

\[
\Omega_{ig}^0=E_{F_g}[W_i^0(q,m)],
\qquad
\Omega_{ig}^1=E_{F_g}[\max\{W_i^0(q,m),W_i^E(q,m;p_m)\}],
\]

so that

\[
\boxed{
\Delta\Omega_{ig}=E_{F_g}\left[(W_i^E-W_i^0)_+\right].
}
\]

There is no baseline ordering between \(\Delta\Omega_{iO}\) and \(\Delta\Omega_{i\mathrm{Inc}}\). A stronger response for either class must follow from explicit primitive differences in manufacturing complexity, commercialization costs, downstream success probabilities, outside options, or other project characteristics. The empirical ranking in Shi Gu (2024) must not be hard-coded into theory.
"""
insert_before("## Proposition 4 — CMO equilibrium existence and uniqueness", novelty_corollary, "AMD11-I")


# Amendment J.
planning_interpretation = r"""

Interpret \(\Lambda_i^{plan}\) as arrival/advancement of viable projects to the commercialization-relevant development stage. It is not limited to pure clinical effort and is not patent generation. Potential data counterparts such as IND/application activity or early clinical milestones require a separate measurement audit.
"""
insert_after(r"""\Lambda_i^{plan}=a_ix_i^*.
}""", planning_interpretation, "AMD11-J-PLANNING")
type_outcomes = r"""

For \(g\in\{O,\mathrm{Inc}\}\), the common-control type-specific retained outcome is

\[
\boxed{
Y_{ig}^{ret}
=
a_ix_i^*\rho_g
\int s_g(q)
\left[
\mathbf 1\{r_i^*=I\}
+
\mathbf 1\{r_i^*=E\}
\right]
dF_g(q,m).
}
\]

The baseline must allow \(\Delta Y_{iO}^{ret}=0<\Delta Y_{i\mathrm{Inc}}^{ret}\) and the reverse. No sign ranking is imposed ex ante, and no separate \(x_{ig}\) control is created.
"""
insert_after(
    r"""Y_i^E
=
a_ix_i^*
\int
s(q)
\mathbf 1\{r_i^*=E\}
dF(q,m).
}""",
    type_outcomes,
    "AMD11-J-TYPE-OUTCOMES",
)
replace_once("1. R&D/project-arrival response;", "1. project-advancement/project-arrival response;", "AMD11-J-DECOMP")


# Amendment K.
outcome_hierarchy = r"""

The empirical outcome hierarchy is

\[
\boxed{
\text{upstream research}
\neq
\text{project advancement}
\neq
\text{commercialization organization}
\neq
\text{realized product}.
}
\]

Patent applications are an upstream-research proxy and are outside the baseline endogenous outcome. IND/application or early-clinical activity may proxy project advancement after a measurement audit. Product-level holder--manufacturer separation may proxy route \(E\) only when identities, product, and timing are aligned. Approval or launch data are realized-product outcomes. A patent decline alone does not falsify the commercialization mechanism.
"""
insert_after("Create `09_observed_outcomes.tex`.", outcome_hierarchy, "AMD11-K")
replace_once(r"\text{R\&D effort}", r"\text{original-drug innovation investment / project advancement}", "AMD11-K-HIERARCHY")


# Amendment L: replace the complete mapping table and fix timing in the mechanism claims.
old_mapping = r"""| Model object | Economic meaning | Potential empirical proxy/moment |
|---|---|---|
| \(a_i\) | research capability | pre-reform original-drug activity, R&D, patents, scientific labor |
| \(k_i\) | internal manufacturing capability | pre-reform production licenses/capacity/assets |
| \(q\) | project commercial/scientific value | therapeutic/market-size/target-value proxies |
| \(m\) | manufacturing complexity | modality, dosage form, biologic/sterile/technical class |
| \(r^*=E\) | retained holder–producer separation | holder different from manufacturer |
| \(a_ix_i\) | route-planning project arrival | IND/application-side outcomes when available |
| \(Y_i^{ret}\) | realized retained original drug | approval/launch outcome |
| \(p_m^*\) | qualified manufacturing scarcity | price if available; otherwise capacity/density proxies |
| \(T(q,m)\) | transfer outside option | future transfer/license moments if available |"""
new_mapping = r"""| Model object | Economic meaning | Preferred empirical proxy/moment | Boundary |
|---|---|---|---|
| \(a_i\) | pre-existing capability to generate/advance viable projects | pre-policy clinical-development history, innovative-drug pipeline, scientific labor; patent history may proxy capability | patent history is not \(x_i\) |
| \(x_i\) | original-drug innovation investment / project-advancement intensity | not directly observed; candidate development-stage activity requires validation | not pure clinical effort and not patent applications |
| \(a_ix_i\) | viable projects reaching route-planning stage | IND/application-side activity or early clinical milestones when available | not approval/launch |
| \(k_i\) | internal manufacturing capability | pre-reform, project-compatible capacity evidence | licences/GMP scope alone need not equal realized capacity |
| \(q\) | project commercial/scientific value | therapeutic/market-size/target-value proxies | MAH-invariant primitive |
| \(m\) | manufacturing complexity | modality, dosage form, biologic/sterile/technical class | project-level requirement |
| \(r^*=E\) | retained holder–producer separation | product-level holder different from manufacturer | requires aligned identities, product and date |
| \(Y_i^{ret}\) | realized retained innovative product | approval/launch/marketing-licence outcome | downstream realization |
| \(g\in\{O,\mathrm{Inc}\}\) | empirical novelty class | verified regulatory classification | classifier, not control/state |
| patent applications | upstream-research proxy | patent records | outside baseline endogenous outcome |
| \(p_m^*\) / scarcity | qualified manufacturing-service scarcity | price if available; otherwise audited capacity/density proxies | proxy does not separately identify price |
| \(T(q,m)\) | transfer outside option | future transfer/license moments if available | not endogenized in baseline |"""
replace_once(old_mapping, new_mapping, "AMD11-L-TABLE")
timing_chains = r"""

The theoretical anticipation channel and the realized sequence must be kept separate:

\[
MAH
\rightarrow
\text{anticipated availability/value of }E
\rightarrow
\Omega_i
\rightarrow
x_i,
\]

\[
x_i
\rightarrow
\text{planning-stage projects}
\rightarrow
r_i^*
\rightarrow
\text{observed holder--producer separation}
\rightarrow
\text{realized products}.
\]

Empirical tests may examine both sequences, but observed holder--producer separation must not be represented as an event that occurs before the ex ante choice of \(x_i\). Patent responses are informative but secondary to the baseline model.
"""
insert_before("Do not hard-code unavailable data.", timing_chains, "AMD11-L-CHAIN")


# Amendment M.
research_development_extension = r"""
## 16.6 Research-versus-Development Allocation Extension

An optional extension may distinguish upstream research \(x_i^R\) from development \(x_i^D\), possibly under a resource constraint, to study the empirical combination \(x_i^D\uparrow\) and \(x_i^R\downarrow\). This block is explicitly outside the baseline. It may not be implemented without separate approval because it adds dimensionality, shifts the research question toward financial constraints, and overlaps with Shi Gu (2024). The baseline contribution remains commercialization organization, retained authorization, manufacturing-capability matching, and CMO scarcity.
"""
insert_before("# 17. Phase 12 — Old-to-New Model Crosswalk", research_development_extension, "AMD11-M")


# Amendment N.
crosswalk_rows = r"""
| \(x_i\) described as generic R&D effort | reinterpret as original-drug innovation investment / project-advancement intensity |
| \(a_ix_i\) described as generic innovation arrival | viable projects reaching the commercialization-relevant route-planning stage |
| patent applications as direct outcome of \(x_i\) | remove from baseline mapping |
| “MAH increases original innovation” | delete as a theoretical implication; treat novelty response as empirical heterogeneity |
| original vs incremental innovation | use \(\rho_g,F_g(q,m)\) with \(g\in\{O,\mathrm{Inc}\}\), not a new control/state |
"""
insert_before("For every removed object, identify all equations", crosswalk_rows, "AMD11-N")


# Amendment O.
replace_once("R&D x_i*", "project-development / advancement intensity x_i*", "AMD11-O-LABEL")
dependency_branches = r"""

Empirical novelty decomposition:

```text
g ∈ {O, Inc}, rho_g, F_g(q,m), possibly s_g(q)
    ↓
type-specific reform gain Delta Omega_ig
    ↓
NO ex-ante sign ranking between O and Inc
```

Explicit exclusion:

```text
upstream patent-generating research
    ↛ not modeled as x_i in baseline
```
"""
insert_before("The feedback loop must be explicitly acknowledged", dependency_branches, "AMD11-O-BRANCHES")


# Amendment P.
assumption_boundary = r"""

No assumption may be imposed solely to guarantee \(\Delta\Omega_{iO}>0\), \(\Delta\Omega_{iO}>\Delta\Omega_{i\mathrm{Inc}}\), or an increase in patent applications. Any sufficient condition for a class ranking must be labeled as an extension, state the exact primitive restriction, and defend it economically.
"""
insert_before("Every proposition must list exactly which assumptions it uses.", assumption_boundary, "AMD11-P")
replace_once("## C. R&D assumptions", "## C. Project-advancement assumptions", "AMD11-P-TITLE")


# Amendment Q and Phase-15 assembly timing.
innovation_question = r"""

Before interpreting any result, state whether it concerns upstream research, project advancement, commercialization-route choice, or realized product output. No proposition may use the generic word “innovation” when the mathematical object is more specific.
"""
insert_before("Do not write:", innovation_question, "AMD11-Q")
insert_after(
    "Create `08_comparative_statics.tex`.",
    "After all Phase 1--15 modules pass their own audits, assemble and compile `12_full_derivation_draft.tex`. Approval of that full draft is the entry condition for Phase 16.",
    "GOV-FULL-DRAFT-PHASE15",
)


# Amendment R.
main_appendix_boundary = r"""

In Sections 3.1 and 3.3, use “original-drug innovation investment / project-advancement intensity” rather than generic “R&D effort,” unless the narrower meaning is explicitly defined. The appendix must include a short subsection, “Research versus Development: Boundary of the Baseline,” explaining that MAH changes downstream commercialization options, that \(x_i\) is broader than pure clinical effort but excludes patent-generating upstream research, and that Shi Gu (2024) shows these margins can differ.
"""
insert_before("## 21.1 Main-text model should be restrained", main_appendix_boundary, "AMD11-R")
replace_once("- R&D before route choice.", "- project-advancement investment before route choice.", "AMD11-R-TIMING")
replace_once("### 3.3 Organization and R&D", "### 3.3 Organization and project advancement", "AMD11-R-SUBSECTION")
replace_once("- R&D FOC.", "- project-advancement FOC.", "AMD11-R-FOC")


# Amendment S.
audit_questions = r"""
11. Is \(x_i\) ever described as patent-generating/upstream research or reduced to pure clinical-development effort?
12. Does any theoretical statement claim MAH must increase patent applications?
13. Does any statement claim MAH must increase original/breakthrough innovation?
14. Are original and incremental effects agnostic unless extra assumptions are stated?
15. Is Shi Gu's research-versus-development mechanism imported into baseline without approval?
16. Is “innovation” used too broadly where project advancement, route choice, or realized product is the actual object?

Any violation of questions 11--16 is a P0 terminology/mechanism error.
"""
insert_after("10. Does any old logit/inclusive-value language remain in the theoretical baseline?", audit_questions, "AMD11-S")


# Amendment U is placed before Phase 18, where it can actually block integration.
empirical_checkpoint = r"""
## Shi Gu Empirical Boundary Checkpoint (required before Phase 16 claims and Phase 18 integration)

Create `model_notes/08_shigu_empirical_boundary_check.md`. Record source version, retrieval date, page/table location, and verdict for each detailed claim concerning: production-facility heterogeneity; first-stage trials; patent declines and financial constraints; high-value/granted/core patent outcomes; original versus incremental chemical drugs; original biological drugs; and pure-researcher transitions.

The SSRN abstract currently verifies only the core research/development boundary. Detailed items remain `UNVERIFIED` until checked in the formal paper PDF. `UNVERIFIED` does not block Phase 1--15 derivations, but it blocks Phase 16 empirical-boundary prose and Phase 18 manuscript integration. For every verified fact, state whether it is predicted by baseline, outside baseline, a heterogeneity test, or an extension motivation.
"""
insert_before("# 23. Phase 18 — Manuscript Integration", empirical_checkpoint, "AMD11-U")


# Amendment T.
integration_rules = r"""

During integration: remove statements equating project-value gains with a generic rise in all R&D; distinguish research, project advancement, commercialization, and realized product outcomes; do not claim a positive original/breakthrough effect before the empirical section establishes it; treat original-versus-incremental heterogeneity as an empirical question; and position Shi Gu (2024) as related evidence without importing its financial-constraint mechanism into baseline.
"""
insert_after("# 23. Phase 18 — Manuscript Integration", integration_rules, "AMD11-T")


# Repair the status table to the formal 18-phase state machine.
old_status_table = r"""| Phase | Status | Main output | P0 issue | Approved to continue? |
|---|---|---|---|---|
| 1 Objects/timing | NOT STARTED | 01_primitives_and_timing.tex | — | No |
| 2 Demand/profit | NOT STARTED | 02_demand_profit_derivation.tex | — | No |
| 3 Technologies | NOT STARTED | 03_internal_external_technologies.tex | — | No |
| 4 Routes/sorting | NOT STARTED | 04_route_values_and_sorting.tex | — | No |
| 5 R&D | NOT STARTED | 05_rd_problem.tex | — | No |
| 6 CMO equilibrium | NOT STARTED | 06_cmo_supply_demand_equilibrium.tex | — | No |
| 7 Equilibrium definition | NOT STARTED | 07_equilibrium_definition.tex | — | No |
| 8 Comparative statics | NOT STARTED | 08_comparative_statics.tex | — | No |
| 9 Outcomes | NOT STARTED | 09_observed_outcomes.tex | — | No |
| 10 Empirical mapping | NOT STARTED | 10_empirical_mapping.tex | — | No |
| 11 Extensions | NOT STARTED | 11_extensions_not_baseline.tex | — | No |
| 12 Crosswalk/audit | NOT STARTED | notes files | — | No |
| 13 Full derivation draft | NOT STARTED | 12_full_derivation_draft.tex | — | No |
| 14 Main/appendix candidate | NOT STARTED | 13/14 tex | — | No |
| 15 Integration | BLOCKED | manuscript | — | No |"""
new_status_table = r"""| Phase | Status | Main output | P0 issue | Approved to continue? |
|---|---|---|---|---|
| 1 Objects/timing | NOT STARTED | 01_primitives_and_timing.tex | — | No |
| 2 Demand/profit | NOT STARTED | 02_demand_profit_derivation.tex | — | No |
| 3 Technologies | NOT STARTED | 03_internal_external_technologies.tex | — | No |
| 4 Routes/sorting | NOT STARTED | 04_route_values_and_sorting.tex | — | No |
| 5 Project advancement | NOT STARTED | 05_rd_problem.tex | — | No |
| 6 CMO equilibrium | NOT STARTED | 06_cmo_supply_demand_equilibrium.tex | — | No |
| 7 Equilibrium definition | NOT STARTED | 07_equilibrium_definition.tex | — | No |
| 8 Six propositions + corollary | NOT STARTED | proposition checklist/modules | — | No |
| 9 Outcomes/data boundary | NOT STARTED | 09_observed_outcomes.tex | — | No |
| 10 Empirical mapping | NOT STARTED | 10_empirical_mapping.tex | — | No |
| 11 Extensions | NOT STARTED | 11_extensions_not_baseline.tex | — | No |
| 12 Old-to-new crosswalk | NOT STARTED | 05_old_to_new_model_crosswalk.md | — | No |
| 13 Equation dependency map | NOT STARTED | 02_equation_dependency_map.md | — | No |
| 14 Assumption discipline | NOT STARTED | 03_assumptions_and_scope.md | — | No |
| 15 Comparative statics/full draft | NOT STARTED | 08_comparative_statics.tex; 12_full_derivation_draft.tex | — | No |
| 16 Main/appendix candidates | NOT STARTED | 13/14 tex | — | No |
| 17 Consistency audit | NOT STARTED | 07_consistency_audit.md | — | No |
| 18 Manuscript integration | BLOCKED | manuscript and final build | — | No |"""
replace_once(old_status_table, new_status_table, "GOV-18-PHASE-STATUS")


# Amendment W: the immediate action after applying the patch remains Phase 1, but only after approval.
amendment_action = r"""
# 29A. Amendment v1.1/v1.2 Application Checkpoint

Before Phase 1, produce an amendment status report covering sections modified, new red lines, terminology, Phase 5, propositions, empirical mapping, extension boundary, conflicts with completed work, files requiring later revision, and P0 issues. The checkpoint must be marked `READY FOR APPROVAL` and must pause. Only explicit user approval permits the specification commit/push and entry into Phase 1.

If any already-completed rebuild work used \(x_i\) as generic upstream R&D, pure clinical effort, or a source of mandatory positive original-innovation effects, revise and re-audit that work before continuing. In the current locked checkout, the new rebuild has not yet started.
"""
insert_before("# 30. Definition of Success", amendment_action, "AMD11-W")


# Amendment V.
replace_once(
    "4. R&D incentives depend on the endogenous expected value of future commercialization opportunities.\n5. The reform affects only a subset of project–firm pairs rather than mechanically raising all values.\n6. The strongest response is derived for research-capable but manufacturing-constrained developers.",
    "4. The model identifies how MAH changes the expected value of advancing viable projects toward commercialization rather than mechanically increasing all upstream R&D.\n5. The reform may have zero effect for many project–firm pairs and may affect original and incremental projects differently.\n6. The strongest baseline firm-level response is derived for research-capable but manufacturing-constrained developers, while the original-versus-incremental ranking remains agnostic absent additional primitive restrictions.",
    "AMD11-V-REPLACE",
)
success_additions = r"""
11. The baseline is consistent with clinical development rising while patent applications do not.
12. The model need not explain patent reallocation unless the explicit research-versus-development extension is activated.
13. The empirical contribution remains commercialization organization, retained holder–producer separation, manufacturing mismatch, and CMO scarcity rather than a reproduction of Shi Gu's mechanism.
"""
insert_after(
    "10. All central comparative statics follow from a small set of interpretable economic primitives.",
    success_additions,
    "AMD11-V-ADD",
)


# Terminology repairs required by the active user decision and v1.2.
terminology_repairs = {
    "- R&D depends on \\(p_m\\) through route value;": "- project advancement depends on \\(p_m\\) through route value;",
    "2. optimal developer R&D;": "2. optimal developer project advancement;",
    "Then map to R&D:": "Then map to project advancement:",
    "R&D/project-arrival response": "project-advancement/project-arrival response",
    "## C. R&D assumptions": "## C. Project-advancement assumptions",
    "- R&D FOC/SOC;": "- project-advancement FOC/SOC;",
    "Because ex ante R&D is chosen before project characteristics are realized": "Because ex ante project-advancement investment is chosen before project characteristics are realized",
    "raises the marginal return to R&D": "raises the marginal return to project advancement",
}
for old, new in terminology_repairs.items():
    if old in text:
        text = text.replace(old, new)
        applied.append(f"TERM:{old[:32]}")


if r"g\in\{O,I\}" in text or r"a_ix_{ig}^*" in text:
    raise RuntimeError("an active forbidden notation or separate-control formula survived effective-spec construction")

source_manifest = (
    "\n\n---\n\n"
    "## Effective-Spec Construction Record\n\n"
    f"- Frozen base SHA256: `{sha256(BASE)}`\n"
    f"- Frozen amendment v1.1 SHA256: `{sha256(AMENDMENT)}`\n"
    f"- Frozen correction v1.2 transcription SHA256: `{sha256(CORRECTION)}`\n"
    f"- Applied operations: {len(applied)}\n"
    + "".join(f"  - `{item}`\n" for item in applied)
)
text = text.rstrip() + source_manifest
OUTPUT.write_text(text, encoding="utf-8", newline="\n")
print(f"WROTE={OUTPUT}")
print(f"APPLIED={len(applied)}")
print(f"OUTPUT_SHA256={sha256(OUTPUT)}")
