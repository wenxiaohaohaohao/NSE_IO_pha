# 计划变更日志

## 2026-04-07
- 修改文件：
  - `mah_model_derivation_plan_for_codex_claude.md`
  - `research_execution_master_plan_zh.md`
- 修改摘要：
  - 两份计划迁移至统一执行目录 `research_notes/project_plans/`。
  - 在原路径保留迁移说明，避免历史链接失效。
  - 新增目录级治理文档 `README.md`，明确唯一维护位置与更新规则。
- 触发原因：
  - 进入正式研究计划实施阶段，需要统一计划入口并支持持续迭代。
- 影响范围：
  - 项目管理流程与文档维护流程。
  - 不影响模型定义与实证结果本身。

## 2026-04-07（第二次更新）
- 修改文件：
  - `paper/src/main.tex`
  - `paper/build.ps1`
  - `paper/README.md`
  - `project_plans/transition_entry_minimum_pipeline_zh.md`
  - `project_plans/master_version_dictionary_zh.md`
- 修改摘要：
  - 建立主稿源目录 `paper/`，并将 `output/doc/main.tex` 复制为主稿源入口 `paper/src/main.tex`。
  - 新增编译入口脚本 `paper/build.ps1`，支持构建后同步 PDF 到 `output/doc/MAH_Policy.pdf`。
  - 新增 transition/entry 的最小数据管道实施路径文档。
  - 新增“主版本字典”文档，用于定义稳定符号、文档状态标签和清理规则。
- 触发原因：
  - 进入正式执行阶段，优先解决“主稿不可闭环复现”和“关键识别对象仍为模板”的风险。
- 影响范围：
  - 编译流程、研究执行流程和版本治理流程。
  - 不改变 benchmark 模型定义。

## 2026-04-07（第三次更新）
- 修改文件：
  - `research_notes/`（清理）
  - `research_notes/archive_candidates/`（新增）
  - `project_plans/cleanup_candidates_zh.md`
- 修改摘要：
  - 删除两份计划迁移占位文件（原路径跳转说明）。
  - 将中风险历史材料移动到 `archive_candidates/` 以防误删。
  - 新增清理候选清单文档，明确清理分级与回滚策略。
- 触发原因：
  - 降低多版本并行导致的定义漂移风险。
- 影响范围：
  - 文档组织结构与版本治理。
  - 不改变模型与实证计算结果。

## 2026-04-07（第四次更新）
- 修改文件：
  - `paper/build.ps1`
  - `paper/README.md`
- 修改摘要：
  - 编译脚本新增 MiKTeX 固定路径优先策略（`D:\application\miktex`）。
  - 完成一次端到端编译验证，`paper/src/main.tex` 成功构建并同步到 `output/doc/MAH_Policy.pdf`。
- 触发原因：
  - 用户确认本机 LaTeX 使用 MiKTeX 安装路径。
- 影响范围：
  - 主稿可复现编译链已打通。

## 2026-04-07（第五次更新）
- 修改文件：
  - `README.md`
  - `research_notes/README.md`
  - `project_plans/cleanup_candidates_zh.md`
- 修改摘要：
  - 更新根目录与 `research_notes` 索引，移除过时目录结构描述并切换到当前执行期结构。
  - 补充 `paper/` 主稿源与编译入口说明。
  - 将清理候选文档从“待确认”改为“执行状态更新”。
- 触发原因：
  - 用户要求同步更新受影响 md 文档并删除不合理旧信息。
- 影响范围：
  - 文档导航与执行指引。
  - 不改变模型定义与实证结果。
