# DANNI 项目说明

## 1. 项目简介
DANNI 是一个围绕中国医药行业 MAH（Marketing Authorization Holder）制度改革开展的经济学研究仓库，核心目标是把理论建模、实证识别、计算求解与论文写作放在同一工作流中，并保持可追溯与可复现。

本项目当前聚焦：
- MAH 改革如何改变原研药从“发明到商业化”的组织路径。
- 三类组织形态（A 一体化、B 研发专门化、C 制造专门化）下的动态行业均衡。
- 论文写作与可编译文档产出（paper 与 output 双层结构）。

## 2. 当前进度（截至 2026-04-18）
- 已完成旧资料第一轮清理：远程仓库历史目录 old_files/ 已删除并推送。
- 已完成引言章节新版本：
  - 文献引用改为正文红色显示（不依赖 bib 引用）。
  - 单独章节可独立编译。
  - 英文字体切换为 Times New Roman（XeLaTeX 路线）。
- 已完成主文档最新可用 PDF 产出：output/doc/MAH_Policy.pdf。
- 已完成仓库第二轮瘦身：清理未跟踪中间产物并补充 .gitignore 防回流规则。
- 已新增数据目录 data/，纳入审批口径匹配数据及可复现转换脚本：
  - data/minimal_matching_table_regtype_approvalonly_2012_2024.xlsx
  - data/minimal_matching_table_regtype_approvalonly_2012_2024_to_dta.do
  - data/minimal_matching_table_regtype_approvalonly_2012_2024.dta
- 已完成 Excel -> Stata 的标准化流程：导入、变量映射、字符串清理、保存与回读校验。

## 3. 核心目录结构
- literatures/: 文献与参考资料。
- research_notes/: 研究笔记、计划、模型说明。
- models/: 模型相关材料。
- data/: 结构化数据与转换脚本。
  - `*_to_dta.do`：Excel 到 dta 的可复现转换脚本。
  - `*.dta`：用于后续实证与清洗分析的 Stata 数据文件。
- paper/: 论文源文件与本地构建目录。
  - paper/src/: 主要 TeX 源文件。
  - paper/build/: 本地构建中间产物。
- output/: 对外输出文档目录（推荐作为可交付产物出口）。
  - output/doc/: PDF 产物主目录。
- tmp/: 本地临时目录（已加入忽略规则）。

## 4. 关键文件与时间戳
| 文件 | 说明 | 最后修改时间 | 大小（bytes） |
|---|---|---:|---:|
| README.md | 项目说明与进度文档 | 2026-04-10 17:31:44 | 10468 |
| paper/src/main.tex | 主文稿源文件 | 2026-04-07 15:21:32 | 48041 |
| paper/src/section1_intro_with_explicit_cites_20260410.tex | 引言章节（红色文献版） | 2026-04-10 17:05:43 | 8871 |
| paper/src/section1_intro_with_explicit_cites_20260410_standalone.tex | 引言 standalone 编译入口（Times New Roman） | 2026-04-10 17:09:05 | 1718 |
| paper/section1_intro_with_explicit_cites_20260410_tnr.pdf | 引言独立 PDF（新罗马） | 2026-04-10 17:09:47 | 65726 |
| output/doc/MAH_Policy.pdf | 主文档输出 PDF | 2026-04-10 16:57:58 | 357952 |
| paper/src/generated_from_output_doc/main_20260409_complete_revD.tex | 生成版整合文稿（RevD） | 2026-04-10 12:57:33 | 88411 |

## 5. 当前版本管理状态
- 分支：main
- 已推送最近清理提交：
  - cbf8499（README 全量盘点版）
  - 47922db（删除 old_files 并保留当前产物）
- 近期数据更新：新增 data/ 下的 Excel、转换 do-file 及更新后的 dta。

## 6. 维护约定
- 对外可交付文档优先放在 output/doc/。
- paper/src 下的临时编译产物（如 *.pdf, *.xdv）默认不纳入版本控制。
- tmp/ 仅作本地临时运行与转换使用，不入库。
- 如需再次清理历史材料，优先按目录级别执行并在 README 记录变更。
