# ToYongwang — 导师研究材料目录

本目录用于整理与王老师（导师）讨论 MAH 制度改革对原研药创新影响研究的相关材料，包含论文主稿、幻灯片、技术笔记、编译输出等。

---

## 目录结构

```
research_notes/ToYongwang/
│
├── ADVISOR_MEETING_CHECKLIST.md              # 见导师材料整理清单（2026年4月底）
│
├── build/                                      # 编译 PDF 输出
│   ├── main/                                   # 论文正文编译
│   │   ├── mah_references.bib
│   │   └── main.pdf
│   ├── slides_updated_talk_notes_zh/           # 更新版幻灯片（中文讲稿）
│   │   └── slides_updated_talk_notes_zh.pdf
│   ├── slides_updated_xe/                      # 更新版幻灯片
│   │   └── slides_updated.pdf
│   └── slides_xe/                              # 原版幻灯片
│       └── slides.pdf
│
├── build_4p/                                   # 4 页精简版问答备忘
│   ├── wang_advisor_QA_memo_final_4p.pdf
│   └── wang_advisor_QA_memo_final_4p2.pdf
│
├── materialUpdated/                            # 补充 / 更新资料
│   ├── mah_baseline_revision_cn.pdf / .tex     # 基线修订（中文）
│   ├── mah_baseline_revision_en.pdf / .tex     # 基线修订（英文）
│   ├── mah_mechanism_explanation_appendix.pdf / .tex        # 机制解释附录
│   ├── mah_mechanism_explanation_appendix_cn.pdf / .tex     # 机制解释附录（中文）
│   ├── mah_model_discipline_bilingual.pdf / .tex            # 模型学科中英双语
│   ├── mah_ppt_revision_plan_zh.pdf / .tex                  # PPT 修订计划
│   └── mah_ppt_revision_plan_zh (1).tex                     # PPT 修订计划备用版
│
├── paper-reviews/                              # 论文审阅
│   ├── main_review_zh_20260419.tex             # 中文审阅意见（2026-04-19）
│   └── rendered/
│       └── main_review_zh_20260419_p1.png      # 审阅意见渲染图
│
├── main.tex / main.txt                         # 论文正文（主 LaTeX 文件）
├── mian_innovation_revision_v3.tex             # 创新点修订版 v3
├── mah_tech_direction_feedback_v2.tex          # 技术方向反馈 v2
├── coauthor_note_updated_tau_ext.tex           # 合作者笔记（τ 扩展版）
├── mah_combined_note_for_coauthors.tex         # 合作者综合笔记
├── mah_bellman_state_variable_note.tex         # Bellman 方程 / 状态变量笔记
├── mah_formal_english_model_note.tex           # 英文形式化模型笔记
├── mah_governance_cost_note_v3.tex             # 治理成本笔记 v3
├── mah_exposure_construction_empirical_design (1).tex  # 暴露构建 / 经验设计
│
├── slides.tex / slides.txt                     # 原版幻灯片
├── slides_updated.tex / slides_updated.txt     # 更新版幻灯片
├── slides_updated_talk_notes_zh.tex            # 中文讲稿笔记
│
├── wang_advisor_QA_memo_final.tex / .pdf       # 导师问答备忘录（完整版）
├── mah_references.bib                          # 论文参考文献
├── references.bib                              # 通用参考文献
│
└── README.md                                   # 本文件
```

---

## 文件分类说明

| 类别 | 路径 | 说明 |
|------|------|------|
| 会议准备 | `ADVISOR_MEETING_CHECKLIST.md` | 2026 年 4 月底会议的整理清单，列出必带材料和准备重点 |
| 论文正文 | `main.tex` / `build/main/` | 论文主 LaTeX 源文件及编译后 PDF |
| 技术笔记 | `mah_*.tex` 系列文件 | Bellman 方程、治理成本、形式化模型等专项技术文档 |
| 幻灯片 | `slides*.tex` / `build/slides*/` | 原版及更新版幻灯片，含中文讲稿 |
| 导师问答 | `wang_advisor_QA_memo_final.*` | 导师问答参考备忘录，含路线 A/B 权衡说明 |
| 补充材料 | `materialUpdated/` | 基线修订、机制解析附录、PPT 修订计划等 |
| 审阅记录 | `paper-reviews/` | 论文审阅意见及渲染输出 |

---

## 核心研究主题

MAH（Marketing Authorization Holder）制度改革对中国原研药创新的影响机制研究，包含：
- 理论模型（Bellman 方程、状态变量设定）
- 治理成本分析
- 经验设计（暴露构建）
- 机制解释与附录推导

---

## 编译说明

- LaTeX 编译器：XeLaTeX
- 主字体：Times New Roman
- 参考文献管理：BibTeX / natbib
- 正文编译入口：`main.tex`
