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

## 2026-04-07（第六次更新）
- 修改文件：
  - `project_plans/research_execution_master_plan_zh.md`
  - `project_plans/transition_entry_minimum_pipeline_zh.md`
  - `paper/src/phase1_primitives_state_space_regularity.tex`
- 修改摘要：
  - 明确当前冲刺优先级切换为“理论推导主线（Phase 1 起步）”。
  - 将 transition/entry 文档标注为“保留方案，顺延执行”。
  - 新增 Phase 1 正式推导稿（Primitives, State Space, and Regularity Conditions）。
- 触发原因：
  - 用户确认当前任务为模型数学推导，不优先执行实证管道。
- 影响范围：
  - 计划执行顺序与理论写作交付。
  - 不改变 benchmark 定义边界。

## 2026-04-07（第七次更新）
- 修改文件：
  - `paper/src/phase1_primitives_state_space_regularity.tex`
  - `paper/src/phase1_primitives_state_space_regularity_zh.tex`
- 修改摘要：
  - 扩展英文 Phase 1 稿件，增加详细推导接口：时序映射、函数空间、正则条件的后续可证明含义。
  - 新增中文 Phase 1 对应详细稿件，保证中英双版本并行审阅。
- 触发原因：
  - 用户要求先中后英，并提高推导细节密度以便外部审阅。
- 影响范围：
  - 理论写作质量与可审阅性提升。
  - 不改变 benchmark 机制边界。

## 2026-04-07（第八次更新）
- 修改文件：
  - `paper/src/phase2_static_optimization_en.tex`
  - `paper/src/phase2_static_optimization_zh.tex`
  - `paper/src/phase2_static_optimization_en_standalone.tex`
  - `paper/src/phase2_static_optimization_zh_standalone.tex`
  - `output/doc/phase2_static_optimization_en.pdf`
  - `output/doc/phase2_static_optimization_zh.pdf`
- 修改摘要：
  - 完成 Phase 2 双语详细推导稿：三类企业静态最优化、FOC/KKT、角点条件、存在唯一性、连续有界性。
  - 生成并输出中英文成对 PDF 到 `output/doc/`，满足双语并行审阅要求。
- 触发原因：
  - 用户确认按 phase 顺序推进并要求中英成对交付。
- 影响范围：
  - 理论推导阶段推进至 Phase 2。
  - 不改变 benchmark 边界。

## 2026-04-07（第九次更新）
- 修改文件：
  - `paper/src/phase3_bellman_existence_en.tex`
  - `paper/src/phase3_bellman_existence_zh.tex`
  - `paper/src/phase3_bellman_existence_en_standalone.tex`
  - `paper/src/phase3_bellman_existence_zh_standalone.tex`
  - `output/doc/phase3_bellman_existence_en.pdf`
  - `output/doc/phase3_bellman_existence_zh.pdf`
- 修改摘要：
  - 完成 Phase 3 双语详细推导稿：Bellman 算子定义、映射与压缩性质、值函数存在唯一、最优策略可测选择。
  - 生成并输出中英文成对 PDF 到 `output/doc/`。
- 触发原因：
  - 用户要求进入 Phase 3 并保持中英成对交付。
- 影响范围：
  - 理论推导阶段推进至 Phase 3。
  - 不改变 benchmark 边界。
