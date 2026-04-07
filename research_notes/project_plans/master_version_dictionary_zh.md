# 主版本字典（防定义漂移）

## A. 唯一主定义

- 理论主定义：`output/doc/MAH_Policy.pdf`
- 主稿源入口：`paper/src/main.tex`
- 计划执行入口：
  - `research_notes/project_plans/mah_model_derivation_plan_for_codex_claude.md`
  - `research_notes/project_plans/research_execution_master_plan_zh.md`

## B. 核心对象白名单（不可重命名）

- 值函数：`V_A, V_B, V_C`
- 流收益：`Pi_A, Pi_B, Pi_C`
- 静态控制：`x_A, x_B, m`
- MAH 渠道：`tau_M, kappa_{sj}, lambda_B`
- 转移与进入：`P(M), e(M)`
- 创新对象：`N(M), S^O(M)`

## C. 文档状态标签规范（用于非主版本文档头部）

在文档开头加入以下四行：

- `Status: active | reference | archived | deprecated`
- `Role: theory | empirics | presentation | notes`
- `Scope: benchmark | extension | historical`
- `Source-of-truth: output/doc/MAH_Policy.pdf`

## D. 清理建议（先归档后删除）

1. 第一批（建议先归档）
- 历史对照稿、重复摘要稿、旧路线图。

2. 第二批（确认后删除）
- 已被统一版本替代且 30 天无引用的文件。

## E. 操作规则

1. 先把候选文件移动到 `research_notes/archive_candidates/`。
2. 在 `project_plans/plan_change_log_zh.md` 记录迁移原因。
3. 一周后若无回滚需求，再做永久删除。
