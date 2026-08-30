from __future__ import annotations

import csv
from pathlib import Path


MODEL_REBUILD = Path(__file__).resolve().parents[1]
OUTPUT = MODEL_REBUILD / "spec" / "instruction_traceability_matrix.csv"
SPEC_APPROVAL_STATUS = "APPROVED"


rows: list[dict[str, str]] = []


def add(
    requirement_id: str,
    source_location: str,
    effective_requirement: str,
    applicable_files: str,
    verification_method: str,
    current_status: str,
    evidence: str,
    approval_status: str,
) -> None:
    rows.append(
        {
            "requirement_id": requirement_id,
            "source_location": source_location,
            "effective_requirement": effective_requirement,
            "applicable_files": applicable_files,
            "verification_method": verification_method,
            "current_status": current_status,
            "evidence": evidence,
            "approval_status": approval_status,
        }
    )


red_lines = [
    "No original-drug versus generic-drug R&D directions",
    "No permanent A/B/C firm types",
    "No full multi-product firm state",
    "No baseline firm entry or exit",
    "No Hopenhayn invariant firm distribution",
    "No representative household, capital accumulation, BGP, or welfare model",
    "MAH does not directly increase a_i",
    "MAH does not directly increase market size, q, or demand",
    "MAH does not directly increase s(q) or s_g(q)",
    "MAH does not directly lower equilibrium p_m^*",
    "Entrusted production is not ownership/authorization transfer",
    "No baseline logit or inclusive value",
    "No baseline continuous eta implementation parameter",
    "No new state variables imported from reference papers",
    "No manuscript modification before the derivation gates and Phase 18 approval",
    "Do not claim separate identification of every primitive",
    "Pseudo-code cannot substitute for formal derivation",
    "Notation cannot change silently across phases",
    "Every proposition object must be defined first",
    "No welfare inference from private value or realized output",
    "x_i cannot be generic R&D that includes upstream patent-generating research",
    "Do not claim MAH must increase patent applications",
    "Do not claim MAH must increase upstream scientific research",
    "Do not impose that MAH must increase breakthrough/original innovation",
    "No x_i^R/x_i^D, binding finance constraint, or research-development allocation in baseline",
    "Negative patent responses do not by themselves contradict the commercialization mechanism",
    "Do not force an original-project response larger than the incremental-project response",
    "Do not redefine the paper as a financial-constraints paper",
]
for index, requirement in enumerate(red_lines, start=1):
    source = "BASE §2" if index <= 20 else "AMD11 §C"
    add(
        f"RL-{index:02d}",
        f"{source}, item {index}",
        requirement,
        "all baseline modules; candidates; manuscript after Phase 18",
        "scope-aware forbidden-mechanism and interpretation audit",
        "SPECIFIED",
        "spec/MAH_model_rebuild_effective_spec_v1.2.md",
        SPEC_APPROVAL_STATUS,
    )


amendment_sections = {
    "A": "precision on x_i and the innovation object",
    "B": "Shi Gu empirical-boundary reference",
    "C": "red lines 21-28",
    "D": "novelty-class heterogeneity without a new control/state",
    "E": "Phase 1 timing language",
    "F": "Phase 5 title, terminology, cost notation, and optimization",
    "G": "Akcigit-style downstream value-gap interpretation",
    "H": "Proposition 3 title and interpretation",
    "I": "novelty-composition corollary",
    "J": "Proposition 6 planning and type-specific outcomes",
    "K": "observed-outcome hierarchy and data boundary",
    "L": "empirical mapping and timing-correct mechanism chains",
    "M": "research-versus-development extension boundary",
    "N": "old-to-new crosswalk additions",
    "O": "equation-dependency branches and exclusion",
    "P": "assumption discipline for novelty and patents",
    "Q": "object-specific comparative-static interpretation",
    "R": "main-text/appendix terminology and boundary subsection",
    "S": "Phase 17 audit questions 11-16",
    "T": "Phase 18 manuscript-integration rules",
    "U": "Shi Gu empirical evidence checkpoint",
    "V": "success criteria 4-6 and 11-13",
    "W": "immediate amendment status and approval checkpoint",
}
for letter, requirement in amendment_sections.items():
    add(
        f"AMD11-{letter}",
        f"AMD11 §{letter}",
        requirement,
        "effective specification and named downstream phase files",
        "unique-anchor patch plus operation-ledger audit",
        "APPLIED",
        "effective spec construction record; reports/AMENDMENT_v1.1_v1.2_STATUS.md",
        SPEC_APPROVAL_STATUS,
    )

add(
    "AMD12-01",
    "v1.2 supplied image/transcription",
    "x_i is original-drug innovation investment/project-advancement intensity; broader than pure clinical effort; not patents",
    "effective specification; Phase 1, 5, 8-10, 16-18 outputs",
    "canonical-definition, negative-boundary, and mechanism-chain audit",
    "APPLIED",
    "spec/source/MAH_model_rebuild_correction_v1.2_transcription.md; effective spec §0",
    SPEC_APPROVAL_STATUS,
)


phases = {
    1: ("primitives, object classification, timing, symbols, initial dependency map", "v1.2 x_i; g classifier only; MAH route wedge only; define before use"),
    2: ("demand, pricing FOC/SOC, pi(q,c), R(q,c)", "dimension consistency; no unexplained reduced-form return or double counting"),
    3: ("internal/external technologies", "I/E distinct; E retains holder rights; no MAH shift to a_i/q/s_g; no baseline eta"),
    4: ("route values, deterministic choice, sorting cutoff", "T/A retained; cutoff existence/uniqueness/signs; no logit/inclusive value"),
    5: ("project-advancement problem, FOC/SOC, value gap", "C_X consistent; x_i boundary; MAH affects x_i only through Omega_i"),
    6: ("CMO supply, demand, and market clearing", "route and x_i feedback; aggregate regularity; no unresolved circularity"),
    7: ("partial-equilibrium definition", "only p_m^*, x_i^*, r_i^*, s_j^*; no other market closure"),
    8: ("six propositions and one novelty corollary", "assumptions/proofs/fixed objects/sufficient conditions/zero cases; no extra substantive proposition"),
    9: ("planning, route, realization, type outcomes", "common x_i and rho_g F_g; no x_ig control; patents outside baseline outcome"),
    10: ("empirical mapping interface", "unit/grain/key/availability/identification limits; no invented data"),
    11: ("extensions file", "all extensions isolated from baseline"),
    12: ("old-to-new crosswalk", "trace every old-object dependency; legacy files remain read-only"),
    13: ("complete equation dependency map", "explicit p_m fixed point and solve order"),
    14: ("assumption blocks and proposition-assumption matrix", "primitive/derived/assumed distinction; no conclusion-as-assumption"),
    15: ("comparative statics and full derivation draft", "fixed/equilibrium price and finite/derivative distinctions; boundary tests; compile"),
    16: ("main-text and appendix candidates", "only from approved full draft; Shi Gu details page/table verified"),
    17: ("global consistency audit", "zero P0; candidate consistency; legacy manuscript unchanged"),
    18: ("scoped manuscript integration and final build", "separate approval; scoped diff; compile/label/reference/notation audit"),
}
for phase, (deliverable, gate) in phases.items():
    add(
        f"P{phase:02d}-D01",
        f"BASE formal Phase {phase}; active implementation plan",
        deliverable,
        f"Phase {phase} formal outputs",
        "file-existence and content-scope audit",
        "NOT_STARTED" if phase < 18 else "BLOCKED",
        "—",
        "NO",
    )
    add(
        f"P{phase:02d}-G01",
        f"BASE formal Phase {phase} audit gate; active implementation plan",
        gate,
        f"Phase {phase} gate report",
        "manual derivation audit + automated checks + compilation where applicable",
        "NOT_STARTED" if phase < 18 else "BLOCKED",
        "—",
        "NO",
    )


proof_checks = [
    "Independently rederive every FOC",
    "Check SOC and all corner cases",
    "Check dimensions/units",
    "Check algebraic signs and sufficient conditions",
    "State the differentiated object and held-fixed objects",
    "Use finite comparisons for binary M",
    "Distinguish fixed p_m from equilibrium p_m^*",
    "Check all mandatory limiting cases",
    "Verify fixed-point closure and regularity",
    "Compile and audit labels/references",
]
for index, requirement in enumerate(proof_checks, start=1):
    add(
        f"QA-PROOF-{index:02d}",
        "BASE §§26 and phase gates; active implementation plan",
        requirement,
        "all derivation modules",
        "independent derivation record and phase gate evidence",
        "NOT_STARTED",
        "—",
        "NO",
    )


econ_checks = [
    "MAH enters baseline only through the institutional route wedge",
    "Planning-stage objects are not confused with observed outcomes",
    "Entrusted production is not ownership transfer",
    "CMO price is endogenous wherever equilibrium values are used",
    "Baseline and extension mechanisms remain separated",
    "Empirical mapping does not overclaim primitive identification",
    "Innovation terminology names the actual mathematical margin",
    "Empirical/source claims are verified or explicitly UNVERIFIED",
]
for index, requirement in enumerate(econ_checks, start=1):
    add(
        f"QA-ECON-{index:02d}",
        "BASE §27; AMD11; correction v1.2; active implementation plan",
        requirement,
        "all theory, mapping, candidate, and integration outputs",
        "economic-interpretation and evidence-boundary audit",
        "NOT_STARTED",
        "—",
        "NO",
    )


success = [
    "MAH changes one defined institutional primitive",
    "Internal and entrusted values derive from explicit technologies and profits",
    "Organizational route choice is endogenous",
    "MAH changes the value of advancing viable projects rather than all upstream R&D",
    "Many project-firm pairs may have zero effect and novelty responses may differ",
    "Strongest baseline firm response is high capability and manufacturing constrained; novelty ranking agnostic",
    "CMO scarcity is an equilibrium attenuation mechanism",
    "Model remains partial equilibrium and respects feasible identification",
    "Baseline does not rely on logit option-value tautology",
    "Comparative statics follow from interpretable primitives",
    "Clinical development may rise while patent applications do not",
    "Patent reallocation is outside baseline unless its extension is approved",
    "Empirical contribution remains commercialization organization, mismatch, and CMO scarcity",
]
for index, requirement in enumerate(success, start=1):
    add(
        f"SUCCESS-{index:02d}",
        "Effective specification Definition of Success",
        requirement,
        "final candidates and Phase 18 manuscript",
        "final traceability, proof, economic, compile, and diff audit",
        "NOT_STARTED",
        "—",
        "NO",
    )


OUTPUT.parent.mkdir(parents=True, exist_ok=True)
with OUTPUT.open("w", encoding="utf-8", newline="") as stream:
    writer = csv.DictWriter(stream, fieldnames=list(rows[0].keys()), lineterminator="\n")
    writer.writeheader()
    writer.writerows(rows)

print(f"WROTE={OUTPUT}")
print(f"ROWS={len(rows)}")
