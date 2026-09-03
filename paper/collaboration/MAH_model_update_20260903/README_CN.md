# MAH 模型更新材料包（2026-09-03）

论文题目：**Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform**

本材料包对应 Git 分支 `codex/mah-model-rebuild`，来源提交为
`28da4281cd0d34d8400f997edef18227aef6baf5`。它包含当前正式主文、
Technical Appendix、完整 TeX 源文件、BibTeX 数据库、appendix 依赖模块
以及可重复编译脚本。

## 本次模型更新

本版保留已经完成的 commercialization baseline，并新增一个正式、独立
标记的 research--development allocation extension：

- baseline 仍以共同的 project-advancement control `x_i`、确定性路线选择、
  retained authorization 和内生 CMO price 为核心；
- extension 使用 `x_i^R`（upstream research）与 `x_i^D`
  （development/project advancement）两个控制，以及共同资源上限
  `\bar X_i`；
- 完整给出目标函数、KKT、SOC/严格凹性、资源约束不绑定与绑定两种比较
  静态、CMO price feedback 和边界情形；
- 专利申请由 `P_i^A=h_i(x_i^R)` 显式进入 extension；
- 当资源约束绑定且 development-biased value-shift condition 成立时，
  commercialization value 上升使 development 上升、research 和 patent
  applications 下降；资源约束不绑定时，research 不会被挤出；
- 这个结果直接解释 Gu (2024) 的资源异质性事实，但不把财务约束、专利
  下降或 incremental-drug ranking 写成无条件假设。

详细推导见 Technical Appendix 的
“Extension: Resource Allocation Between Research and Development”。

## 建议阅读顺序

1. `formal/mah_route_indicator_friction_model.pdf`：主文，14 页。
2. `formal/mah_route_indicator_friction_model_appendix.pdf`：Technical Appendix，38 页。

`formal/` 中的两份 PDF 是本次交付的正式阅读版本。

## 源文件结构

- `source/manuscript/mah_route_indicator_friction_model.tex`：主文 TeX。
- `source/manuscript/mah_route_indicator_friction_model_appendix.tex`：Technical Appendix TeX。
- `source/manuscript/mah_route_indicator_friction_refs.bib`：主文与附录共享的 BibTeX 数据库。
- `source/manuscript/aer.bst`：论文使用的 bibliography style；为提高跨机器可重复性，随包原样提供。
- `source/manuscript/*.bbl`：已生成的 bibliography 文件，便于快速查看；正式重编译仍建议运行完整 BibTeX 流程。
- `source/model_rebuild/*.tex`：Technical Appendix 通过 `\input` 调用的 12 个模型模块，其中 `15_research_development_patent_extension.tex` 是本次新增的完整 extension。
- `source/build.ps1`、`source/build_appendix.ps1`、`source/build_tex.ps1`：Windows PowerShell 构建脚本。

## Windows 下完整编译

在 PowerShell 中进入本材料包，然后运行：

```powershell
cd source
.\build.ps1 -KeepBuild
.\build_appendix.ps1 -KeepBuild
```

脚本按需要执行 LaTeX、BibTeX、LaTeX、LaTeX，并把结果写到
`source/output/`。脚本会优先识别本机 MiKTeX；只要 `pdflatex` 和
`bibtex` 已在 `PATH` 中，也可在其他安装环境运行。

## 其他系统下手工编译

先进入 `source/manuscript/`，分别对两个基名执行：

```text
pdflatex <basename>.tex
bibtex <basename>
pdflatex <basename>.tex
pdflatex <basename>.tex
```

请从 `source/manuscript/` 目录启动编译，以保持 appendix 的
`../model_rebuild/` 相对路径有效。

## 验证与完整性

- `validation/BUILD_VALIDATION.md` 记录本材料包的独立编译、引用、页数、
  extension 数学审查和依赖边界检查。
- `FILE_MANIFEST_SHA256.txt` 记录 ZIP 内每个 payload 文件的 SHA256。
- `VERSION.txt` 记录版本、分支和提交信息。

本包不包含旧模型 technical memo、旧讲义、内部 specification/phase audit
文件、文献全文、编译缓存或 prior collaboration package；这些文件不是
当前正式稿的编译依赖，也不属于本次合作者交付。
