# 清理候选清单（执行状态更新）

## 说明

- 目标：减少版本漂移与重复材料。
- 原则：先归档，再永久删除。
- 当前状态：第一轮已执行，详见 `plan_change_log_zh.md`。

## A. 已完成（低风险）

1. 迁移说明占位文件（已删除）
- `research_notes/mah_model_derivation_plan_for_codex_claude.md`
- `research_notes/research_execution_master_plan_zh.md`
- 处理结果：已删除，主文件保留在 `project_plans/`。

## B. 已完成归档（中风险）

1. 旧路线与早期对照材料（与主稿存在口径漂移风险）
- `research_notes/mah_ge_model_memo.md`
- `research_notes/mah_ge_formal_model_draft_zh.md`
- `research_notes/mah_nse_integrated_full_model_zh.md`
- `research_notes/mah_nse_weak_integrated_model_zh.md`
- `research_notes/nse_positioning_for_mah_paper_zh.md`

2. 历史摘要聚合文件（可能重复）
- `research_notes/toyangchendanni.md`
- `research_notes/toyangchendanni_summary.md`
- `research_notes/toyangchendanni_model_details.md`
- `research_notes/toyangchendanni_welfare_tradeoff_summary.md`
- `research_notes/toxinhao.txt`

## C. 建议保留（高相关）

- `research_notes/build_transition_matrices.do`
- `research_notes/transition_matrix_pre_policy.csv`
- `research_notes/transition_matrix_post_policy.csv`
- `research_notes/jde_transition_and_model_fit_zh.md`
- `research_notes/defense_talking_points_zh.md`

## 推荐执行方式

1. 先创建 `research_notes/archive_candidates/`。
2. 将 B 类文件移动到该目录，保留 7 天。
3. 若无回滚需求，再永久删除。

## 下一步待确认

请确认两件事：
1. `archive_candidates/` 是否继续保留观察期（建议 7 天）。
2. 观察期后是否永久删除 B 类文件。
