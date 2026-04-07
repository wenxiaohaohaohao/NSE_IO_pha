# research_notes 使用说明（2026-04 更新）

本目录用于管理研究执行期的笔记、计划、脚本与归档材料。

## 先看哪里

1. `project_plans/mah_model_derivation_plan_for_codex_claude.md`
   理论推导 phase 顺序与 benchmark 边界。
2. `project_plans/research_execution_master_plan_zh.md`
   项目级执行总表（周计划、DoD、风险）。
3. `project_plans/transition_entry_minimum_pipeline_zh.md`
   transition/entry 最小数据管道实施路径。
4. `build_transition_matrices.do`
   transition matrix 计算脚本入口。
5. `transition_matrix_pre_policy.csv` / `transition_matrix_post_policy.csv`
   pre/post 转移矩阵输出文件。

## 当前目录结构（有效）

- `project_plans/`
  计划主版本目录（single source of truth），含更新规则和变更日志。
- `archive_candidates/`
  已下线但暂存可回滚的历史材料。
- `models/`
  当前保留的模型相关笔记目录。
- `build_transition_matrices.do`
  经验侧关键脚本。
- `transition_matrix_pre_policy.csv`
  pre 政策期转移矩阵文件。
- `transition_matrix_post_policy.csv`
  post 政策期转移矩阵文件。
- 其他顶层 `*.md`
  主题说明、文献比较、答辩口径等工作文档。

## 版本治理规则

1. 计划文件只在 `project_plans/` 维护。
2. 重大口径变更后，必须同步更新：
- `project_plans/plan_change_log_zh.md`
- `project_plans/master_version_dictionary_zh.md`
3. 历史文档清理采用“先归档后删除”：先移到 `archive_candidates/`，观察期后再删。

## 与主稿的关系

- 理论基准定义：`output/doc/MAH_Policy.pdf`
- 主稿源入口：`paper/src/main.tex`
- 这里的 notes 用于执行与解释，不替代主稿定义。
