# research_notes 整理说明

这份索引对应当前已经整理过的 `research_notes/` 结构。

使用原则：

- `models/`、`empirics/`、`references/`、`background/`、`presentation/` 是当前有效文件。
- `archive/` 只保留旧基准模型备份。
- `old_files/` 放回的是之前删掉后又恢复的旧版笔记。

## 建议阅读顺序

1. `models/main_model_weak_nse_zh.md`
   当前正文主模型。
2. `models/paper_model_section_zh.md`
   更短、更像论文正文的模型部分简版。
3. `models/welfare_tradeoff_note_zh.md`
   福利权衡怎么写、文献里通常怎么做、你这篇该怎么参考。
4. `models/model_positioning_zh.md`
   当前模型的统一定位说明。
5. `empirics/empirical_strategy_jde_zh.md`
   当前实证主线与识别设计。
6. `presentation/teacher_update_framework_zh.md`
   给老师汇报当前思路的总框架。

## 当前目录结构

### `models/`

- `main_model_weak_nse_zh.md`
  正文主模型。保留 `A/B/C`、`invention vs implementation`、状态转移、委托生产市场，并用弱整合方式纳入新结构经济学。
- `paper_model_section_zh.md`
  论文正文简版模型部分。
- `welfare_tradeoff_note_zh.md`
  福利权衡说明、文献依据和推荐写法。
- `model_positioning_zh.md`
  模型定位说明，解释借了哪些文献、为什么用弱整合版。
- `full_model_nse_extension_zh.md`
  强融合的新结构经济学理论扩展版。
- `one_page_framework_zh.md`
  一页老师汇报版模型框架。
- `model_section_latex_style_zh.tex`
  LaTeX 风格模型章节草稿。
- `model_tooling_zh.md`
  工具、Bellman equation、MATLAB/Dynare 说明。

### `empirics/`

- `empirical_strategy_jde_zh.md`
  实证主线、转移矩阵、hazard、cumulative transition 与 JDE 风格执行方案。
- `build_transition_matrices.do`
  转移矩阵骨架脚本。
- `transition_matrix_pre_policy.csv`
  政策前转移矩阵模板。
- `transition_matrix_post_policy.csv`
  政策后转移矩阵模板。

### `references/`

- `literature_map.md`
  文献地图与引用建议。

### `background/`

- `us_china_regulation_comparison_zh.md`
  中美制度对照。

### `presentation/`

- `ppt_outline.md`
  PPT 重构提纲。
- `teacher_update_framework_zh.md`
  给老师汇报当前研究思路、理论、模型、实证和识别框架的总说明。

### `archive/`

- `baseline_model_draft_zh.md`
  原始基准模型草稿，作为历史备份保留。

### `old_files/`

这个文件夹放回了之前删掉的旧版 `.md` 文件，保留原文件名，但内容是基于现有主文件重建的恢复版：

- `empirical_roadmap_en.md`
- `frs_borrowing_note_en.md`
- `frs_vs_mah_comparison_zh.md`
- `hopenhayn_vs_schumpeterian_zh.md`
- `model_memo_en.md`
- `nse_positioning_note_zh.md`

## 最简短的使用建议

- 写模型：看 `models/main_model_weak_nse_zh.md`
- 真正往正文里落：看 `models/paper_model_section_zh.md`
- 讲福利：看 `models/welfare_tradeoff_note_zh.md`
- 做实证：看 `empirics/empirical_strategy_jde_zh.md`
- 给老师汇报：看 `presentation/teacher_update_framework_zh.md`
