# 本轮 Open Issues

## REV-001 — 规格差异：已获用户决策
Phase: amendment / all affected phases
Object: x_i interpretation and specification precedence
Issue: historical v1.2 expanded the interpretation; later revisions changed internal feasibility.
Economic effect: prevents a wider innovation claim from replacing development-stage advancement.
Mathematical effect: retain the note's internal infeasibility boundary; do not import later architecture.
Resolution: current user explicitly selected note + v1.1 and September 1 baseline.
Locked architecture changed by resolution? NO relative to current authorized specification.
Approval required? Scope decision already received; phase results still require approval.
Status: scope resolved; dependent files repaired only in their current approved scope.

## REV-002 — 既有后续阶段需复核
Phase: 2--18
Object: inherited modules, candidates, manuscript, source evidence.
Issue: historical PASS records apply to earlier specifications, not automatically to this revision.
Economic/mathematical effect: no current-spec final claim before revalidation.
Preferred resolution: retain existing derivations, audit each dependency in sequence, repair only affected content.
Locked architecture change? NO.
Approval required? YES at each phase gate.
Status: scheduled; not an active mathematical P0 finding. See affected_file_inventory.csv.

## REV-P1-001 — 历史实证来源需在最终引用前复核
Phase: 16/18 empirical boundary checkpoint
Object: Shi Gu page/table evidence.
Issue: the historical evidence ledger is preserved; no new empirical verification is claimed in this Phase 1 revision.
Resolution: recheck the preserved paper version and its page/table references before final integration.
Locked architecture change? NO.
Approval required? No for evidence verification; yes if an architecture conflict is found.
Status: P1, non-blocking for Phase 1; blocks empirical claims at the relevant later gate if unresolved.

## Phase 2 当前审计结果

当前 Phase 2 未发现 P0 或本阶段 P1。数值试算中的有限差分截断误差已用 Richardson 外推消除并通过原阈值，详见独立推导审计；没有改动模型公式或放宽检验门槛。历史实证证据复核 REV-P1-001 仍为后续关口事项，不阻断当前商业利润推导。


## REV-P0-016-01 — Phase 16 来源核验 gate 未通过
Phase: 16 entry / 18 integration
Object: Shi Gu formal-PDF version and seven empirical boundary claims.
Issue: historical evidence survives but formal PDF is excluded from Git; current official retrieval returned HTTP 403.
Economic effect: detailed empirical claims cannot be presented as freshly verified.
Mathematical effect: none; Phase 1–15 derivations remain valid.
Candidate resolutions: obtain PDF and verify; or explicit user amendment allowing transparently inherited evidence.
Preferred resolution: obtain formal PDF.
Locked architecture changed? NO.
Approval required before changing evidence gate? YES.
Status: OPEN; P0 gate failure under the user's state-machine definition. Stop before Phase 16 formal output. Supersedes REV-P1-001's earlier non-blocking status.
Evidence: paper/model_rebuild/revision_20260907/audit/phase16_gate_report.md


Resolution 2026-09-07: REV-P1-001 and REV-P0-016-01 CLOSED. User supplied the exact formal PDF. All seven claims reverified, with significance qualifications, in 08_shigu_empirical_boundary_check.md. No active P0.
