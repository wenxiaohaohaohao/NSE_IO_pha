# Project Plans（执行目录）

本目录用于维护项目实施计划的唯一主版本（single source of truth）。

## 当前主计划

1. `mah_model_derivation_plan_for_codex_claude.md`
- 用途：模型数学推导与 phase 顺序约束。
- 角色：理论推导执行协议（按 Phase 1-12 推进）。

2. `research_execution_master_plan_zh.md`
- 用途：项目级执行总表（周计划、DoD、风险、72小时行动）。
- 角色：研究管理与交付节奏控制。

## 更新规则（必须遵守）

1. 只在本目录更新计划文件。
2. 发生口径变更时，两个计划文件需同步检查一致性：
- benchmark 边界
- `lambda_B` 口径
- 理论 phase 顺序
- 实证对象映射（transition matrix、entry composition、innovation proxy）
3. 每次更新后，在 `plan_change_log_zh.md` 记录：
- 日期
- 修改文件
- 修改摘要
- 触发原因
- 影响范围（理论/实证/答辩口径）

## 建议执行节奏

- 每周固定更新一次计划状态（周五）。
- 重大决策（口径、识别边界、主定义）即时更新，不等周更。
